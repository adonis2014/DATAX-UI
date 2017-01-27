<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
									<table width="100%" class="dbgrid">
                                   		<thead>
                                   			<tr>
                                   				<th nowrap="nowrap">读入列</th>
                                   				<th nowrap="nowrap">写入列</th>
                                   				<th nowrap="nowrap">来源类别</th>
                                   				<th nowrap="nowrap">处理类别</th>
                                   				<th nowrap="nowrap">函数</th>
                                   				<th nowrap="nowrap">脚本</th>
                                   				<th nowrap="nowrap">脚本类别</th>
                                   				<th nowrap="nowrap">自定义类</th>
                                   				<th nowrap="nowrap">排序</th>
                                   				<th nowrap="nowrap">备注</th>
                                   				<th nowrap="nowrap">操作</th>
                                   			</tr>
                                   		</thead>
                                   		<tbody>
                                   			<c:forEach items="${obj}" var="taskColumn">
                                   			<tr><input type="hidden" name="taskColumnId" value="${taskColumn.id}"/>
                                   			<input type="hidden" name="readColumnId" value="${taskColumn.readColumnId}"/>
                                   			<input type="hidden" name="writeColumnId" value="${taskColumn.writeColumnId}"/>
                                   				<td nowrap="nowrap"><input type="text" style="width:80px;" name="readColumnName" value="${taskColumn.readColumnName}" /> </td>
                                   				<td nowrap="nowrap"><input type="text" style="width:80px;"  name="writeColumnName" value="${taskColumn.writeColumnName}" /></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="readerFieldType" codeType="1053" hasLabel="false" hasPSel="false" styleText="width:120px;" defaultVal="${taskColumn.readerFieldType}"/></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="writerFieldType" codeType="1054" hasLabel="false" hasPSel="false" styleText="width:120px;"  defaultVal="${taskColumn.writerFieldType}"/></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="functionName" codeType="1067" hasLabel="false" hasPSel="true" styleText="width:120px;" defaultVal="${taskColumn.functionName}" /></td>
                                   				<td nowrap="nowrap"><input type="text" name="script" value="${taskColumn.script}" /></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="scriptType" codeType="1063" hasLabel="false" hasPSel="false" styleText="width:120px;" defaultVal="${taskColumn.scriptType}"/></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:120px;"  name="class_name" value="${taskColumn.class_name}" /></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:40px;"  name="sortId" value="${taskColumn.sortId}" /></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:180px;"  name="cloumn_remark" value="${taskColumn.remark}" /></td>
                                   				<td nowrap="nowrap"><a href="javascript:removeColumnPair('${taskColumn.id}');">删除</a></td>
                                   			</tr>
                                   			</c:forEach>
                                   			<tr>
                                   				<td nowrap="nowrap"><input type="text" style="width:80px;"  id="add_readColumnName" name="add_readColumnName" value="" /></td>
                                   				<td nowrap="nowrap"><input type="text" style="width:80px;"  id="add_writeColumnName" name="add_writeColumnName" value="" /></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="add_readerFieldType" codeType="1053" hasLabel="false" hasPSel="false" styleText="width:120px;"/> </td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="add_writerFieldType" codeType="1054" hasLabel="false" hasPSel="false" styleText="width:120px;"/></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="add_functionName" codeType="1067" hasLabel="false" hasPSel="false" styleText="width:120px;"/></td>
                                   				<td nowrap="nowrap"><input type="text" id="add_script" name="add_script" value="" /></td>
                                   				<td nowrap="nowrap"><mytags:dictSelect field="add_scriptType" codeType="1063" hasLabel="false" hasPSel="false" styleText="width:120px;"/></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:120px;" id="add_class_name" name="add_class_name" value="" /></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:40px;"  id="add_sortId" name="add_sortId" value="" /></td>
                                   				<td nowrap="nowrap"><input type="text"  style="width:180px;"  id="add_cloumn_remark" name="add_cloumn_remark" value="" /></td>
                                   				<td nowrap="nowrap"><a href="javascript:addColumnPair();">增加</a></td>
                                   			</tr>
                                   		</tbody>
                                   </table>