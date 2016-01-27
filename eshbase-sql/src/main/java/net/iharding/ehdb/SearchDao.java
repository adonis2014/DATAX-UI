package net.iharding.ehdb;

import java.util.HashSet;
import java.util.Set;

import net.iharding.core.model.Response;
import net.iharding.ehdb.ehsql.SQLRequest;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.exception.NotSupportedException;
import net.iharding.ehdb.query.ESActionFactory;
import net.iharding.utils.ElasticSearchUtils;
import net.iharding.utils.HBaseUtils;
import net.sf.jsqlparser.JSQLParserException;

import org.apache.hadoop.hbase.client.Connection;
import org.elasticsearch.client.Client;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class SearchDao {

	private static final Set<String> END_TABLE_MAP = new HashSet<>();

	static {
		END_TABLE_MAP.add("limit");
		END_TABLE_MAP.add("order");
		END_TABLE_MAP.add("where");
		END_TABLE_MAP.add("group");

	}

	private Client client = null;
	
	public  Connection connection =null;  


	public SearchDao(Client client,Connection connection) {
		this.client = client;
		this.connection=connection;
	}


	/**
	 * Prepare action And transform sql
	 * into ES ActionRequest
	 * @param sql SQL query to execute.
	 * @return ES request
	 * @throws JSQLParserException 
	 * @throws NotSupportedException 
	 * @throws ErrorSqlException 
	 * @throws SqlParseException
	 */
	public SQLRequest explain(String sql) throws JSQLParserException, NotSupportedException, ErrorSqlException  {
		QueryAction query = ESActionFactory.create(client,connection, sql);
		return query.explain();
	}
	/**
	 * 执行sql，返回结果
	 * @param sql
	 * @return
	 * @throws JSQLParserException
	 * @throws NotSupportedException
	 * @throws ErrorSqlException
	 */
	public  Response<?> extcute(String sql) throws JSQLParserException, NotSupportedException, ErrorSqlException  {
		QueryAction query = ESActionFactory.create(client,connection, sql);
		return query.extcute();
	}
	
	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
	    ApplicationContext context = new ClassPathXmlApplicationContext("spring-data.xml");
	    context.getBean("dataSource");

		SearchDao sdao=new SearchDao(ElasticSearchUtils.getClient(),HBaseUtils.getHBaseConnection());
		try {
			System.out.println(sdao.explain("select * from da.user_figure"));
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
