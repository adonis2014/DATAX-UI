package net.iharding.query.query;

import java.sql.SQLFeatureNotSupportedException;

import net.iharding.query.parse.SqlParser;
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
import net.sf.jsqlparser.statement.select.Select;
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
	 */
	public static QueryAction create(Client client, String sql) throws JSQLParserException {
		Statement stmt = CCJSqlParserUtil.parse(sql);
		if (stmt instanceof Select) {

		} else if (stmt instanceof Delete) {

		} else if (stmt instanceof Insert) {

		} else if (stmt instanceof Update) {

		} else if (stmt instanceof Alter) {

		} else if (stmt instanceof CreateTable) {

		}else if (stmt instanceof CreateIndex) {

		}else if (stmt instanceof CreateView) {

		}else if (stmt instanceof Drop) {

		}else if (stmt instanceof Replace) {

		}else if (stmt instanceof Truncate) {

		}else if (stmt instanceof Execute) {

		}

		String firstWord = sql.substring(0, sql.indexOf(' '));
		switch (firstWord.toUpperCase()) {
		case "SELECT":
			SQLQueryExpr sqlExpr = (SQLQueryExpr) SQLUtils.toMySqlExpr(sql);
			Select select = new SqlParser().parseSelect(sqlExpr);

			if (select.isAgg) {
				return new AggregationQueryAction(client, select);
			} else {
				return new DefaultQueryAction(client, select);
			}
		case "DELETE":
			SQLStatementParser parser = SQLParserUtils.createSQLStatementParser(sql, JdbcUtils.MYSQL);
			SQLDeleteStatement deleteStatement = parser.parseDeleteStatement();
			Delete delete = new SqlParser().parseDelete(deleteStatement);
			return new DeleteQueryAction(client, delete);

		default:
			throw new SQLFeatureNotSupportedException(String.format("Unsupported query: %s", sql));
		}
	}
}
