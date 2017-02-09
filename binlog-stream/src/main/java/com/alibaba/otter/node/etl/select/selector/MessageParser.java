/*
 * Copyright (C) 2010-2101 Alibaba Group Holding Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.otter.node.etl.select.selector;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ddlutils.model.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.util.CollectionUtils;

import com.alibaba.otter.canal.protocol.CanalEntry;
import com.alibaba.otter.canal.protocol.CanalEntry.Column;
import com.alibaba.otter.canal.protocol.CanalEntry.Entry;
import com.alibaba.otter.canal.protocol.CanalEntry.RowChange;
import com.alibaba.otter.canal.protocol.CanalEntry.RowData;
import com.alibaba.otter.node.common.config.ConfigClientService;
import com.alibaba.otter.node.etl.common.db.dialect.DbDialect;
import com.alibaba.otter.node.etl.common.db.dialect.DbDialectFactory;
import com.alibaba.otter.node.etl.common.db.dialect.mysql.MysqlDialect;
import com.alibaba.otter.node.etl.common.db.dialect.oracle.OracleDialect;
import com.alibaba.otter.node.etl.select.exceptions.SelectException;
import com.alibaba.otter.shared.common.model.config.ConfigHelper;
import com.alibaba.otter.shared.common.model.config.pipeline.Pipeline;
import com.alibaba.otter.shared.common.model.config.pipeline.PipelineParameter;
import com.alibaba.otter.shared.etl.model.EventColumn;
import com.alibaba.otter.shared.etl.model.EventColumnIndexComparable;
import com.alibaba.otter.shared.etl.model.EventData;
import com.alibaba.otter.shared.etl.model.EventType;

/**
 * 数据对象解析
 * 
 * @author jianghang 2012-10-25 下午02:31:06
 * @version 4.1.2
 */
public class MessageParser {

    private static final Logger logger = LoggerFactory.getLogger(MessageParser.class);
    private ConfigClientService configClientService;
    private DbDialectFactory    dbDialectFactory;

    /**
     * 将对应canal送出来的Entry对象解析为otter使用的内部对象
     * 
     * <pre>
     * 需要处理数据过滤：
     * 1. Transaction Begin/End过滤
     * 2. retl.retl_client/retl.retl_mark 回环标记处理以及后续的回环数据过滤
     * 3. retl.xdual canal心跳表数据过滤
     * </pre>
     */
    public List<EventData> parse(Long pipelineId, List<Entry> datas) throws SelectException {
        List<EventData> eventDatas = new ArrayList<EventData>();
        Pipeline pipeline = configClientService.findPipeline(pipelineId);
        List<Entry> transactionDataBuffer = new ArrayList<Entry>();
        try {
            for (Entry entry : datas) {
                switch (entry.getEntryType()) {
                    case TRANSACTIONBEGIN:
                        break;
                    case ROWDATA:
                        // 检查下otter3.0的回环表，对应的schmea会比较随意，所以不做比较
                        transactionDataBuffer.add(entry);
                        break;
                    case TRANSACTIONEND:
                        // 添加数据解析
                        for (Entry bufferEntry : transactionDataBuffer) {
                            List<EventData> parseDatas = internParse(pipeline, bufferEntry);
                            if (CollectionUtils.isEmpty(parseDatas)) {// 可能为空，针对ddl返回时就为null
                                continue;
                            }

                            // 初步计算一下事件大小
                            long totalSize = bufferEntry.getHeader().getEventLength();
                            long eachSize = totalSize / parseDatas.size();
                            for (EventData eventData : parseDatas) {
                                if (eventData == null) {
                                    continue;
                                }
                                eventData.setSize(eachSize);// 记录一下大小
                                eventDatas.add(eventData);
                            }
                        }
                        transactionDataBuffer.clear();
                        break;
                    default:
                        break;
                }
            }

            // 添加最后一次的数据，可能没有TRANSACTIONEND
            // 添加数据解析
            for (Entry bufferEntry : transactionDataBuffer) {
                List<EventData> parseDatas = internParse(pipeline, bufferEntry);
                if (CollectionUtils.isEmpty(parseDatas)) {// 可能为空，针对ddl返回时就为null
                    continue;
                }

                // 初步计算一下事件大小
                long totalSize = bufferEntry.getHeader().getEventLength();
                long eachSize = totalSize / parseDatas.size();
                for (EventData eventData : parseDatas) {
                    if (eventData == null) {
                        continue;
                    }

                    eventData.setSize(eachSize);// 记录一下大小
                    eventDatas.add(eventData);
                }
            }
        } catch (Exception e) {
            throw new SelectException(e);
        }

        return eventDatas;
    }

  
    private List<EventData> internParse(Pipeline pipeline, Entry entry) {
        RowChange rowChange = null;
        try {
            rowChange = RowChange.parseFrom(entry.getStoreValue());
        } catch (Exception e) {
            throw new SelectException("parser of canal-event has an error , data:" + entry.toString(), e);
        }

        if (rowChange == null) {
            return null;
        }

        String schemaName = entry.getHeader().getSchemaName();
        String tableName = entry.getHeader().getTableName();
        EventType eventType = EventType.valueOf(rowChange.getEventType().name());

        // 处理下DDL操作
        if (eventType.isQuery()) {
            // 直接忽略query事件
            return null;
        }

        // 首先判断是否为系统表
        if (StringUtils.equalsIgnoreCase(pipeline.getParameters().getSystemSchema(), schemaName)) {
            // do noting
            if (eventType.isDdl()) {
                return null;
            }

            if (StringUtils.equalsIgnoreCase(pipeline.getParameters().getSystemDualTable(), tableName)) {
                // 心跳表数据直接忽略
                return null;
            }
        } else {
            if (eventType.isDdl()) {
                boolean notExistReturnNull = false;
                if (eventType.isRename()) {
                    notExistReturnNull = true;
                }

                DataMedia dataMedia = ConfigHelper.findSourceDataMedia(pipeline, schemaName, tableName,
                    notExistReturnNull);
                // 如果EventType是CREATE/ALTER，需要reload
                // DataMediaInfo;并且把CREATE/ALTER类型的事件丢弃掉.
                if (dataMedia != null && (eventType.isCreate() || eventType.isAlter() || eventType.isRename())) {
                    DbDialect dbDialect = dbDialectFactory.getDbDialect(pipeline.getId(),
                        (DbMediaSource) dataMedia.getSource());
                    dbDialect.reloadTable(schemaName, tableName);// 更新下meta信息
                }

                boolean ddlSync = pipeline.getParameters().getDdlSync();
                if (ddlSync) {
                    // 处理下ddl操作
                    EventData eventData = new EventData();
                    eventData.setSchemaName(schemaName);
                    eventData.setTableName(tableName);
                    eventData.setEventType(eventType);
                    eventData.setExecuteTime(entry.getHeader().getExecuteTime());
                    eventData.setSql(rowChange.getSql());
                    eventData.setDdlSchemaName(rowChange.getDdlSchemaName());
                    eventData.setTableId(dataMedia.getId());
                    return Arrays.asList(eventData);
                } else {
                    return null;
                }
            }
        }

        List<EventData> eventDatas = new ArrayList<EventData>();
        for (RowData rowData : rowChange.getRowDatasList()) {
            EventData eventData = internParse(pipeline, entry, rowChange, rowData);
            if (eventData != null) {
                eventDatas.add(eventData);
            }
        }

        return eventDatas;
    }

    /**
     * 解析出从canal中获取的Event事件<br>
     * Oracle:有变更的列值. <br>
     * <i>insert:从afterColumns中获取所有的变更数据<br>
     * <i>delete:从beforeColumns中获取所有的变更数据<br>
     * <i>update:在before中存放所有的主键和变化前的非主键值，在after中存放变化后的主键和非主键值,如果是复合主键，只会存放变化的主键
     * <br>
     * Mysql:可以得到所有变更前和变更后的数据.<br>
     * <i>insert:从afterColumns中获取所有的变更数据<br>
     * <i>delete:从beforeColumns中获取所有的变更数据<br>
     * <i>update:在beforeColumns中存放变更前的所有数据,在afterColumns中存放变更后的所有数据<br>
     */
    private EventData internParse(Pipeline pipeline, Entry entry, RowChange rowChange, RowData rowData) {
        EventData eventData = new EventData();
        eventData.setTableName(entry.getHeader().getTableName());
        eventData.setSchemaName(entry.getHeader().getSchemaName());
        eventData.setEventType(EventType.valueOf(rowChange.getEventType().name()));
        eventData.setExecuteTime(entry.getHeader().getExecuteTime());
        EventType eventType = eventData.getEventType();
        TableInfoHolder tableHolder = null;

        if (!StringUtils.equalsIgnoreCase(pipeline.getParameters().getSystemSchema(), eventData.getSchemaName())) {
            boolean useTableTransform = pipeline.getParameters().getUseTableTransform();
            Table table = null;
            DataMedia dataMedia = ConfigHelper.findSourceDataMedia(pipeline, eventData.getSchemaName(),
                eventData.getTableName());
            eventData.setTableId(dataMedia.getId());
            if (useTableTransform || dataMedia.getSource().getType().isOracle()) {// oracle需要反查一次meta
                // 如果设置了需要进行table meta转化，则反查一下table信息
                // 比如oracle erosa解析时可能使用了非物理主键，需要直接使用，信任erosa的信息
                DbDialect dbDialect = dbDialectFactory.getDbDialect(pipeline.getId(),
                    (DbMediaSource) dataMedia.getSource());
                table = dbDialect.findTable(eventData.getSchemaName(), eventData.getTableName());// 查询一下meta信息
                if (table == null) {
                    logger.warn("find table[{}.{}] is null , may be drop table.", eventData.getSchemaName(),
                        eventData.getTableName());
                }
                tableHolder = new TableInfoHolder(dbDialect, table, useTableTransform);
            }
        }

        List<Column> beforeColumns = rowData.getBeforeColumnsList();
        List<Column> afterColumns = rowData.getAfterColumnsList();
        String tableName = eventData.getSchemaName() + "." + eventData.getTableName();

        // 判断一下是否需要all columns
        boolean isRowMode = pipeline.getParameters().getSyncMode().isRow(); // 如果是rowMode模式，所有字段都需要标记为updated
        boolean needAllColumns = isRowMode || checkNeedAllColumns(pipeline);

        // 变更后的主键
        Map<String, EventColumn> keyColumns = new LinkedHashMap<String, EventColumn>();
        // 变更前的主键
        Map<String, EventColumn> oldKeyColumns = new LinkedHashMap<String, EventColumn>();
        // 有变化的非主键
        Map<String, EventColumn> notKeyColumns = new LinkedHashMap<String, EventColumn>();

        if (eventType.isInsert()) {
            for (Column column : afterColumns) {
                String isPk = this.isPrimaryKey(pipeline, eventData.getSchemaName(), eventData.getTableName(), column);
                if (isPk != null) {
                    keyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                    //					notKeyColumns.put(column.getName(), copyEventColumn(column,isPk,true, true, tableHolder));
                } else {
                    if (isKey(tableHolder, tableName, column)) {
                        keyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    } else {
                        // mysql 有效
                        notKeyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    }
                }
            }
        } else if (eventType.isDelete()) {
            for (Column column : beforeColumns) {
                String isPk = this.isPrimaryKey(pipeline, eventData.getSchemaName(), eventData.getTableName(), column);
                if (isPk != null) {
                    keyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                } else {
                    if (isKey(tableHolder, tableName, column)) {
                        keyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    } else {
                        // mysql 有效
                        notKeyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    }
                }
            }
        } else if (eventType.isUpdate()) {
            // 获取变更前的主键.
            for (Column column : beforeColumns) {
                String isPk = this.isPrimaryKey(pipeline, eventData.getSchemaName(), eventData.getTableName(), column);
                if (isPk != null) {
                    oldKeyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                    keyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                } else {
                    if (isKey(tableHolder, tableName, column)) {
                        oldKeyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                        // 同时记录一下new
                        // key,因为mysql5.6之后出现了minimal模式,after里会没有主键信息,需要在before记录中找
                        keyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    } else {
                        if (needAllColumns && entry.getHeader().getSourceType() == CanalEntry.Type.ORACLE) {
                            // 针对行记录同步时，针对oracle记录一下非主键的字段，因为update时针对未变更的字段在aftercolume里没有
                            notKeyColumns.put(column.getName(), copyEventColumn(column, isRowMode, tableHolder));
                        }
                    }
                }
            }
            for (Column column : afterColumns) {
                String isPk = this.isPrimaryKey(pipeline, eventData.getSchemaName(), eventData.getTableName(), column);
                if (isPk != null) {
                    keyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                    oldKeyColumns.put(column.getName(), copyEventColumn(column, isPk, true, true, tableHolder));
                } else {
                    if (isKey(tableHolder, tableName, column)) {
                        // 获取变更后的主键
                        keyColumns.put(column.getName(), copyEventColumn(column, true, tableHolder));
                    } else {
                        if (needAllColumns || entry.getHeader().getSourceType() == CanalEntry.Type.ORACLE
                            || column.getUpdated()) {
                            // 在update操作时，oracle和mysql存放变更的非主键值的方式不同,oracle只有变更的字段;
                            // mysql会把变更前和变更后的字段都发出来，只需要取有变更的字段.
                            // 如果是oracle库，after里一定为对应的变更字段
                            boolean isUpdate = true;
                            if (entry.getHeader().getSourceType() == CanalEntry.Type.MYSQL) { // mysql的after里部分数据为未变更,oracle里after里为变更字段
                                isUpdate = column.getUpdated();
                            }
                            notKeyColumns.put(column.getName(),
                                copyEventColumn(column, isRowMode || isUpdate, tableHolder));// 如果是rowMode，所有字段都为updated
                        }
                    }
                }
            }

            if (entry.getHeader().getSourceType() == CanalEntry.Type.ORACLE) { // 针对oracle进行特殊处理
                checkUpdateKeyColumns(oldKeyColumns, keyColumns);
            }
        }

        List<EventColumn> keys = new ArrayList<EventColumn>(keyColumns.values());
        List<EventColumn> oldKeys = new ArrayList<EventColumn>(oldKeyColumns.values());
        List<EventColumn> columns = new ArrayList<EventColumn>(notKeyColumns.values());

        Collections.sort(keys, new EventColumnIndexComparable());
        Collections.sort(oldKeys, new EventColumnIndexComparable());
        Collections.sort(columns, new EventColumnIndexComparable());
        if (!keyColumns.isEmpty()) {
            eventData.setKeys(keys);
            if (eventData.getEventType().isUpdate() && !oldKeys.equals(keys)) { // update类型，如果存在主键不同,则记录下old
                                                                                    // keys为变更前的主键
                eventData.setOldKeys(oldKeys);
            }
            eventData.setColumns(columns);
        } else {
            throw new SelectException(
                "this rowdata has no pks , entry: " + entry.toString() + " and rowData: " + rowData);
        }

        return eventData;
    }

    private boolean checkNeedAllColumns(Pipeline pipeline) {
        boolean needAllColumns = false;
        // 只要有filter/resolver逻辑存在，就需要尽可能保留所有字段
        for (DataMediaPair pair : pipeline.getPairs()) {
            needAllColumns |= pair.isExistFilter();
            if (pair.getResolverData() != null && pair.getResolverData().getExtensionDataType() != null) {
                if (pair.getResolverData().getExtensionDataType().isClazz()) {
                    needAllColumns |= StringUtils.isNotEmpty(pair.getResolverData().getClazzPath());
                } else {
                    needAllColumns |= StringUtils.isNotEmpty(pair.getResolverData().getSourceText());
                }
            } else {
                needAllColumns |= Boolean.FALSE;
            }

        }
        return needAllColumns;
    }

    /**
     * 在oracle中，补充没有变更的主键<br>
     * 如果变更后的主键为空，直接从old中拷贝<br>
     * 如果变更前后的主键数目不相等，把old中存在而new中不存在的主键拷贝到new中.
     * 
     * @param oldKeys
     * @param newKeys
     */
    private void checkUpdateKeyColumns(Map<String, EventColumn> oldKeyColumns, Map<String, EventColumn> keyColumns) {
        // 在变更前没有主键的情况
        if (oldKeyColumns.size() == 0) {
            return;
        }
        // 变更后的主键数据大于变更前的，不符合
        if (keyColumns.size() > oldKeyColumns.size()) {
            return;
        }
        // 主键没有变更，把所有变更前的主键拷贝到变更后的主键中.
        if (keyColumns.size() == 0) {
            keyColumns.putAll(oldKeyColumns);
            return;
        }

        // 把old中存在而new中不存在的主键拷贝到new中
        if (oldKeyColumns.size() != keyColumns.size()) {
            for (String oldKey : oldKeyColumns.keySet()) {
                if (keyColumns.get(oldKey) == null) {
                    keyColumns.put(oldKey, oldKeyColumns.get(oldKey));
                }
            }
        }
    }

    /**
     * 把 erosa-protocol's Column 转化成 otter's model EventColumn.
     * 
     * @param column
     * @return
     */
    private EventColumn copyEventColumn(Column column, boolean isUpdate, TableInfoHolder tableHolder) {
        return copyEventColumn(column, null, column.getIsKey(), isUpdate, tableHolder);
    }

    private EventColumn copyEventColumn(Column column, String pkFunctionName, boolean isKey, boolean isUpdate,
                                        TableInfoHolder tableHolder) {
        EventColumn eventColumn = new EventColumn();
        eventColumn.setIndex(column.getIndex());
        eventColumn.setKey(isKey);
        if (isKey && StringUtils.isNotEmpty(pkFunctionName)) {
            eventColumn.setPkFunctionName(pkFunctionName);
        }
        eventColumn.setNull(column.getIsNull());
        eventColumn.setColumnName(column.getName());
        eventColumn.setColumnValue(column.getValue());
        eventColumn.setUpdate(isUpdate);
        eventColumn.setColumnType(column.getSqlType());

        if (tableHolder != null && tableHolder.getTable() != null
            && (tableHolder.isUseTableTransform() || tableHolder.isOracle())) {
            org.apache.ddlutils.model.Column dbColumn = tableHolder.getTable().findColumn(column.getName(), false);
            if (dbColumn == null) {
                // 可能存在ddl，重新reload一下table
                tableHolder.reload();
                dbColumn = tableHolder.getTable().findColumn(column.getName(), false);
            }

            if (dbColumn != null) {
                int sqlType = dbColumn.getTypeCode();
                if (sqlType != column.getSqlType()) {
                    // 针对oracle的erosa给出的字段为非标准的jdbc，需要做一次类型反查
                    eventColumn.setColumnType(sqlType);
                    logger.info("table [{}] column [{}] is not match , MeType: {}, EType {}",
                        new Object[] { tableHolder.getTable().getName(), column.getName(), sqlType,
                                       column.getSqlType() });
                }
            }
        }

        return eventColumn;
    }

    private String isPrimaryKey(Pipeline pipeline, String schemaName, String tableName, Column column) {
        // 根据pipeline判断是否key
        if (tableName != null) {
            for (DataMediaPair mediaPair : pipeline.getPairs()) {
                if (ConfigHelper.isMatch(mediaPair.getSource(), schemaName, tableName)) {
                    for (ColumnPair columnPair : mediaPair.getColumnPairs()) {
                        if (columnPair.getSourceColumn().getName().equalsIgnoreCase(column.getName())) {
                            if (columnPair.getIsPk() != null && columnPair.getIsPk() == 1) {
                                return columnPair.getFunctionName();
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    private boolean isKey(TableInfoHolder tableHolder, String tableName, Column column) {
        boolean isEKey = column.getIsKey();
        if (tableHolder == null || tableHolder.getTable() == null || !tableHolder.isUseTableTransform()) {
            return isEKey;
        }

        org.apache.ddlutils.model.Column dbColumn = tableHolder.getTable().findColumn(column.getName(), false);
        if (dbColumn == null) {
            // 可能存在ddl，重新reload一下table
            tableHolder.reload();
            dbColumn = tableHolder.getTable().findColumn(column.getName(), false);
            if (dbColumn == null) {
                throw new SelectException(String.format("not found column[%s] in table[%s]", column.getName(),
                    tableHolder.getTable().toVerboseString()));
            }
        }

        boolean isMKey = dbColumn.isPrimaryKey();
        if (isMKey != isEKey) {
            logger.info("table [{}] column [{}] is not match , isMeky: {}, isEkey {}",
                new Object[] { tableName, column.getName(), isMKey, isEKey });
        }
        return isMKey;
    }

    // ======================== setter / getter =============================

    public void setDbDialectFactory(DbDialectFactory dbDialectFactory) {
        this.dbDialectFactory = dbDialectFactory;
    }

    public void setConfigClientService(ConfigClientService configClientService) {
        this.configClientService = configClientService;
    }

    /**
     * 实现可reload的table meta，可替换table属性.
     * 
     * @author jianghang 2012-5-16 下午04:34:18
     * @version 4.0.2
     */
    static class TableInfoHolder {

        private DbDialect dbDialect;
        private Table     table;
        private boolean   useTableTransform;

        public TableInfoHolder(DbDialect dbDialect, Table table, boolean useTableTransform) {
            this.dbDialect = dbDialect;
            this.table = table;
            this.useTableTransform = useTableTransform;
        }

        public Table getTable() {
            return table;
        }

        public void setTable(Table table) {
            this.table = table;
        }

        public DbDialect getDbDialect() {
            return dbDialect;
        }

        public void setDbDialect(DbDialect dbDialect) {
            this.dbDialect = dbDialect;
        }

        public boolean isUseTableTransform() {
            return useTableTransform;
        }

        public void setUseTableTransform(boolean useTableTransform) {
            this.useTableTransform = useTableTransform;
        }

        public boolean isOracle() {
            return (dbDialect != null && dbDialect instanceof OracleDialect);
        }

        public boolean isMysql() {
            return (dbDialect != null && dbDialect instanceof MysqlDialect);
        }

        public void reload() {
            if (table != null) {
                String schemaName = StringUtils.isEmpty(table.getCatalog()) ? table.getSchema() : table.getCatalog();
                this.table = dbDialect.findTable(schemaName, table.getName(), false);
            }
        }

    }
}
