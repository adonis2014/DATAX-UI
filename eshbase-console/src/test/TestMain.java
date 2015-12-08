import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.codehaus.jackson.map.ObjectMapper;

import com.enniu.vdata.common.model.CommonQueryParams;
import com.enniu.vdata.common.model.WhereFieldParam;
import com.enniu.vdata.common.model.WhereListParam;
import com.taobao.datax.common.model.DataProcessEntity;
import com.taobao.datax.common.model.DataProcessField;


public class TestMain {
	
	/**
	 * 清除增加的前缀
	 * @param str
	 * @param remove
	 * @return
	 */
	public static String removeLeftPad(String str,String remove){
		 
	        while (str.startsWith(remove)){
	            str=str.substring(remove.length());
	        }
	        return str;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CommonQueryParams params=new CommonQueryParams();
		WhereListParam paramw=new WhereListParam();
		paramw.setFieldName("appId");
		List<String> pvs=new ArrayList<String>();
		pvs.add("1");
		pvs.add("d");
		paramw.setParamValues(pvs);
		paramw.setType(0);
		List<WhereListParam> wps=new ArrayList<WhereListParam>();
		wps.add(paramw);
		WhereListParam paramw2=new WhereListParam();
		paramw2.setFieldName("logDate");
		paramw2.setIsRange(1);
		paramw2.setFormat("yyyy-MM-dd");
		List<String> pvs2=new ArrayList<String>();
		pvs2.add("2015-04-04/2015-06-09");
		pvs2.add("2015-10-10/2015-10-24");
		paramw2.setParamValues(pvs2);
		paramw2.setType(2);
		wps.add(paramw2);
		params.setWhereListParams(wps);
		List<WhereFieldParam> wfps=new ArrayList<WhereFieldParam>();
		WhereFieldParam fp1=new WhereFieldParam();
		fp1.setFieldName("logCIty");
		fp1.setParamValue("杭州");
		wfps.add(fp1);
params.setExactFieldParams(wfps);
		params.setWildFieldParams(wfps);
		System.out.println(params.toQueryString());
		
		
		// TODO Auto-generated method stub
//		System.out.println(System.currentTimeMillis());
//		Date today=new Date(System.currentTimeMillis());
//		
//		System.out.println(DateUtils.addYears(today,50).getTime());
//		System.out.println(DateUtils.addYears(today,-16).getTime());
//		System.out.println(StringUtils.substring("0134343", 2));
//		System.out.println(removeLeftPad("000203210210","0"));
//		List<String> colNames=new ArrayList<String>();
//		colNames.add("name");
//		colNames.add("regTime");
//		colNames.add("regApp");
//		System.out.println(colNames.contains("regApp2"));
		
//		
//		ObjectMapper mapper = new ObjectMapper();
//		DataProcessEntity entity=new DataProcessEntity();
//		entity.setName("userDayAccess");
//		entity.setProcessClassName("com.enniu.processV");
//		Map<String,String> params=new HashMap<String,String>();
//		params.put("userHTable","EN_User");
//		params.put("ipHttpApiUrl","http://192.168.2.234:8080/ipcity?ip={0}");
//		entity.setParams(params);
//		List<DataProcessField> fields=new ArrayList<DataProcessField>();
//		DataProcessField field=new DataProcessField();
//		field.setId(1);
//		field.setColumnName("id");
//		field.setFamilyName("cf");
//		field.setFieldType(0);
//		field.setFunctionName("to_number");
//		field.setScript("set t=1; return var");
//		fields.add(field);
//		entity.setFields(fields);
//		try {
//			System.out.println(mapper.writeValueAsString(entity));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		Map<String,Map<String,String>> jset = new HashMap<String,Map<String,String>>();
//		Map<String,String> row=new ConcurrentHashMap<String, String>();
//		row.put("count","1");
//		jset.put("hangzhou",row);
//		try {
//			System.out.println(mapper.writeValueAsString(jset));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		Set  set=new HashSet();
//		set.add("abc");
//		set.add("cde");
//		set.add("efg");
//		set.add("fgh");    
//		set.add("abc"); 
//		try {
//			System.out.println(mapper.writeValueAsString(set));
//			Set set1=mapper.readValue("[\"abc\",\"fgh\",\"efg\",\"cde\"]", new TypeReference<HashSet>(){});
//			System.out.println(set1.toString());
//		}  catch (IOException e) {
//			e.printStackTrace();
//		} 
//		JavaType javaType =mapper.getTypeFactory().constructParametricType(ArrayList.class, String.class);
//		try {
//			File file=new File("/Users/admin/projects/vdata/vdata/vdata-common-hbase/src/main/resources/esmapping/enuser.json");
//			FileInputStream is = new FileInputStream(file);
//	           int size = (int) file.length();
//	           byte[] bytes =new byte[size]; 
//	           is.read(bytes);
//	           String content = new String(bytes, "GBK");
//	           System.out.println(content);
//	           is.close();
//	           Node node = nodeBuilder().clusterName("enniu-data").client(true).node();
//	   			Client client = node.client();
//	   			XContentBuilder xcb=XContentFactory.jsonBuilder()
// 		       .startObject()
// 		         .startObject("user")
// 		           .startObject("properties")
// 		             .startObject("title")
// 		             .field("analyzer", "whitespace")
// 	               .field("type", "string")
// 		           .endObject()
// 		         .endObject()
// 		         .endObject()
// 		       .endObject();
//	   			XContentBuilder doc = XContentFactory.jsonBuilder(); //整个每次循环都需要创建一个，否则会在startObject时报空指针
//	   		    //添加属性，相当于添加表的字段的值
//	   		    doc.startObject();
//	   		    doc.array("xdecc","sdsd","dfdfffg","dffgfg");
//	   		    //获取id，如果存在的话
////	   		    String idValue = null;
////	   		    for(String field : contextObject.keySet()) {
////	   		       Object[] values = contextObject.get(field);
////	   		       //如果是同一个field下多个值，则全部加入到同一个field下
////	   		       if(null != values && values.length > 1) {
////	   		          doc.array(field, values);
////	   		       } else {
////	   		          String formatValue = this.formatInsertData(values);//格式化处理值
////	   		          try {
////	   		            if(StringUtils.isNotEmpty(idFieldName) && idFieldName.equals(field)) {
////	   		              idValue = formatValue;
////	   		            }
////	   		            doc.field(field, formatValue);
////	   		          } catch (IOException e) {
////	   		            this.logger.error(e.getMessage());
////	   		            return false;
////	   		          }          
////	   		      }            
////	   		    }
//	   		    doc.endObject();
//	   		System.out.println(doc.string());
//	           PutMappingResponse response = client.admin().indices()
//	        		     .preparePutMapping("enuser")
//	        		     .setType("user")
//	        		     .setSource(xcb)
//	        		     .execute().actionGet();
//	           
//		} catch (JsonParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

}
