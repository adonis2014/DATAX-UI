package net.iharding.ehdb.query;

import java.sql.SQLFeatureNotSupportedException;
import java.util.List;

import net.iharding.ehdb.QueryAction;
import net.iharding.ehdb.ddl.AlterTableAction;
import net.iharding.ehdb.ddl.CreateTableAction;
import net.iharding.ehdb.dml.DeleteQueryAction;
import net.iharding.ehdb.exception.ErrorSqlException;
import net.iharding.ehdb.exception.NotSupportedException;
import net.iharding.ehdb.parse.SqlParser;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.alter.Alter;
import net.sf.jsqlparser.statement.create.index.CreateIndex;
import net.sf.jsqlparser.statement.create.table.CreateTable;
import net.sf.jsqlparser.statement.create.view.CreateView;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.drop.Drop;
import net.sf.jsqlparser.statement.execute.Execute;
import net.sf.jsqlparser.statement.insert.Insert;
import net.sf.jsqlparser.statement.replace.Replace;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectBody;
import net.sf.jsqlparser.statement.select.WithItem;
import net.sf.jsqlparser.statement.truncate.Truncate;
import net.sf.jsqlparser.statement.update.Update;

import org.durid.sql.SQLUtils;
import org.durid.sql.ast.expr.SQLQueryExpr;
import org.durid.sql.ast.statement.SQLDeleteStatement;
import org.durid.sql.parser.SQLParserUtils;
import org.durid.sql.parser.SQLStatementParser;
import org.durid.util.JdbcUtils;
import org.elasticsearch.client.Client;

public class ESActionFactory {

	/**
	 * Create the compatible Query object based on the SQL query.
	 * 
	 * @param sql
	 *            The SQL query.
	 * @return Query object.
	 * @throws ErrorSqlException 
	 */
	public static QueryAction create(Client client, String sql) throws JSQLParserException,NotSupportedException, ErrorSqlException {
		Statement stmt = CCJSqlParserUtil.parse(sql);
		if (stmt instanceof Select) {
			Select select=(Select) stmt;
			if (select.getSelectBody()!=null){
				SelectBody selBody=select.getSelectBody();
				if (selBody instanceof PlainSelect){
					PlainSelect psel=(PlainSelect)selBody;
					if (psel.getFetch()!=null && psel.getFirst()!=null && psel.getForUpdateTable()!=null 
							&& psel.getOracleHierarchical()!=null && psel.getSkip()!=null && psel.getTop()!=null){
						throw new NotSupportedException("Fetch,First,ForUpdateTable,OracleHierarchical,Skip,Top not supported! ");
					}else if (psel.getGroupByColumnReferences()!=null && psel.getGroupByColumnReferences().size()>0){//统计聚合
						return new AggregationQueryAction(client, select);
					}else if (psel.getJoins()!=null && psel.getJoins().size()>0){//join 查询
						return new JoinQueryAction(client, select);
					}else if (psel.getDistinct()!=null ){//distinct 查询
						return new DistinctQueryAction(client,select);
					}else{//基本查询
						return new DefaultQueryAction(client, select);
					}
				}else{//Union 查询
					return new UnionQueryAction(client, select);
				}
			}else{
				throw new NotSupportedException("with not support!");
//				List<WithItem> items=select.getWithItemsList();
//				for(WithItem witem:items){
//					witem.getSelectBody()
//				}
			}
			
		} else if (stmt instanceof Delete) {
			return new DeleteQueryAction(client,(Delete)stmt);
		} else if (stmt instanceof Insert) {

		} else if (stmt instanceof Update) {

		} else if (stmt instanceof Alter) {
			return new AlterTableAction(client,(Alter)stmt);
		} else if (stmt instanceof CreateTable) {
			return new CreateTableAction(client,(CreateTable)stmt);
		}else if (stmt instanceof CreateIndex) {

		}else if (stmt instanceof CreateView) {

		}else if (stmt instanceof Drop) {

		}else if (stmt instanceof Replace) {

		}else if (stmt instanceof Truncate) {

		}else if (stmt instanceof Execute) {

		}	
		return null;
	}
}
