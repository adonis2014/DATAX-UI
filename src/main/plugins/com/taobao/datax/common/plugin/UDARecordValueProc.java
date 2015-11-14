package com.taobao.datax.common.plugin;

import java.util.Map;

import org.apache.hadoop.hbase.client.Table;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

import com.taobao.datax.common.model.AggregationRecord;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.util.ETLStringUtils;
import com.taobao.datax.common.util.IP;

/**
 * UDA(User)记录行处理
 * 
 * @author admin
 * 
 */
public class UDARecordValueProc implements RecordValueProc {

	private static Logger logger = Logger.getLogger(UDARecordValueProc.class.getCanonicalName());
	ObjectMapper mapper = new ObjectMapper();
	Table table = null;
	private static IP ip = null;

	@Override
	public void endProcRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity) {

	}

	/**
	 * 获取ip对应地理位置和从Hbase获取用户数据
	 */
	@Override
	public void initRow(Map<String, AggregationRecord> aggRows, Map<String, String> curRow, DataProcessEntity dpEntity) {
		if (ip == null) {
			ip = new IP();
			ip.init(dpEntity.getParams().get("ipdat"));
			logger.info("ip dat:"+dpEntity.getParams().get("ipdat"));
		}
		// 根据ip获取地理位置，省和城市，写入curRow
		String ipStr = curRow.get("remote");
		try {
			String[] citys = ip.find(ipStr);
			if (ETLStringUtils.isNotEmpty(citys[0])) {
				curRow.put("country", citys[0]);
			}
			if (ETLStringUtils.isNotEmpty(citys[1])) {
				curRow.put("province", citys[1]);
			}
			if (ETLStringUtils.isNotEmpty(citys[2])) {
				curRow.put("city", citys[2]);
			}
			if (ETLStringUtils.isNotEmpty(citys[3])) {
				curRow.put("unit", citys[3]);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		// 获取用户信息，写入curRow
		// if (curRow.get("userId")==null)
		// return;
		// try {
		// if (table==null){
		// String userHtable=dpEntity.getParams().get("userHTable");
		// Configuration conf = new Configuration();
		// conf.addResource(new Path(dpEntity.getParams().get("hbase_conf")));
		// Configuration config = new Configuration(conf);
		// Connection connection = ConnectionFactory.createConnection(config);
		// table = connection.getTable(TableName.valueOf(userHtable));
		// }
		// Get get = new Get(Bytes.toBytes(curRow.get("userId")));
		// // 根据rowkey查询
		// Result ur = table.get(get);
		// byte[] family=Bytes.toBytes(Constants.DEFAULT_COLUMN_FAMILY);
		// if (ur != null) {
		// User user = new User();
		// user.setName(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_NAME));
		// if(StringUtils.isNotEmpty(user.getName()))curRow.put("name",
		// user.getName());
		// user.setIdentity(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_IDENTITY));
		// if(StringUtils.isNotEmpty(user.getIdentity()))curRow.put("identity",
		// user.getIdentity());
		// user.setBigAppId(ETLStringUtils.getIntValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_BIGAPPID));
		// if(user.getBigAppId()!=0)curRow.put("bigAppId",
		// String.valueOf(user.getBigAppId()));
		// user.setAuthType(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_AUTHTYPE));
		// if(StringUtils.isNotEmpty(user.getAuthType()))curRow.put("authType",
		// user.getAuthType());
		// user.setCreditBankId(ETLStringUtils.getListStringFromResult(ur,
		// family, Constants.ENNIU_USER_FIELD_CREDITBANKID));
		// if(user.getCreditBankId()!=null)curRow.put("netcreditcard",mapper.writeValueAsString(user.getCreditBankId()));
		// user.setMobile(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_MOBILE));
		// if(StringUtils.isNotEmpty(user.getMobile()))curRow.put("mobile",
		// user.getMobile());
		// user.setRegistApp(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_REGISTAPP));
		// if(StringUtils.isNotEmpty(user.getRegistApp()))curRow.put("registApp",
		// user.getRegistApp());
		// user.setRegIp(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_REGIP));
		// if(StringUtils.isNotEmpty(user.getRegIp()))curRow.put("regIp",
		// user.getRegIp());
		// user.setRegCity(ETLStringUtils.getStringValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_REGCITY));
		// if(StringUtils.isNotEmpty(user.getRegCity()))curRow.put("regCity",
		// user.getRegCity());
		// user.setRegProvince(ETLStringUtils.getStringValueFromResult(ur,
		// family, Constants.ENNIU_USER_FIELD_REGPROVINCE));
		// if(StringUtils.isNotEmpty(user.getRegProvince()))curRow.put("regProvince",
		// user.getRegProvince());
		// user.setRegTime(ETLStringUtils.getDateValueFromResult(ur, family,
		// Constants.ENNIU_USER_FIELD_REGTIME,Constants.DATE_FORMAT_SSS));
		// if(user.getRegTime()!=null)curRow.put("regTime",HBDateUtils.formatDate(user.getRegTime(),Constants.DATE_FORMAT_SSS));
		// }
		// } catch (Exception e) {e.printStackTrace();
		// logger.error(Constants.MSG_FAIL+"  "+e.getMessage());
		// }
	}

}
