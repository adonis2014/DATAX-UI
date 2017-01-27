package net.iharding.modules.meta.wrapper;

import java.util.List;

import net.iharding.modules.meta.model.DataModel;

/**
 * 自定义数据集模型
 * 
 * @author Joe.Zhang
 *
 */
public class ViewDataset extends DataModel {

	private List<LookupTable> lookups;

	private List<Dimension> dimensions;
	
	private List<Measure> measures;
	
	private String filterCondition;

	public String getFilterCondition() {
		return filterCondition;
	}

	public void setFilterCondition(String filterCondition) {
		this.filterCondition = filterCondition;
	}

	public List<Measure> getMeasures() {
		return measures;
	}

	public void setMeasures(List<Measure> measures) {
		this.measures = measures;
	}

	public List<LookupTable> getLookups() {
		return lookups;
	}

	public void setLookups(List<LookupTable> lookups) {
		this.lookups = lookups;
	}

	public List<Dimension> getDimensions() {
		return dimensions;
	}

	public void setDimensions(List<Dimension> dimensions) {
		this.dimensions = dimensions;
	}
	
	public class Measure{
		
		public Measure(String name){
			this.name=name;
		}
		
		private String name;
		
		private MeasureFunction function;
		
		private Measure dependentMeasure;
		
		

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public MeasureFunction getFunction() {
			return function;
		}

		public void setFunction(MeasureFunction function) {
			this.function = function;
		}

		public Measure getDependentMeasure() {
			return dependentMeasure;
		}

		public void setDependentMeasure(Measure dependentMeasure) {
			this.dependentMeasure = dependentMeasure;
		}
		
		
		
	}

	public class Dimension {

		private String name;

		private String tableName;

		private long datasetId;

		private Integer id;

		private String column;

		private String[] derived;

		public String getTableName() {
			return tableName;
		}

		public void setTableName(String tableName) {
			this.tableName = tableName;
		}

		public long getDatasetId() {
			return datasetId;
		}

		public void setDatasetId(long datasetId) {
			this.datasetId = datasetId;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getColumn() {
			return column;
		}

		public void setColumn(String column) {
			this.column = column;
		}

		public String[] getDerived() {
			return derived;
		}

		public void setDerived(String[] derived) {
			this.derived = derived;
		}

	}

	public class MeasureFunction {
		
		private String expression;
		private String returntype;
		private List<Parameter> parameters;

		public MeasureFunction(String expression, String returntype) {
			this.expression = expression;
			this.returntype = returntype;
		}

		public String getExpression() {
			return expression;
		}

		public void setExpression(String expression) {
			this.expression = expression;
		}

		public String getReturntype() {
			return returntype;
		}

		public void setReturntype(String returntype) {
			this.returntype = returntype;
		}

		public List<Parameter> getParameters() {
			return parameters;
		}

		public void setParameters(List<Parameter> parameters) {
			this.parameters = parameters;
		}

	}

	public class Parameter {
		private String paramType;
		private String paramValue;
		private Integer sortId;

		public Parameter(String paramType, String paramValue, Integer sortId) {
			this.paramType = paramType;
			this.paramValue = paramValue;
			this.sortId = sortId;
		}

		public String getParamType() {
			return paramType;
		}

		public void setParamType(String paramType) {
			this.paramType = paramType;
		}

		public String getParamValue() {
			return paramValue;
		}

		public void setParamValue(String paramValue) {
			this.paramValue = paramValue;
		}

		public Integer getSortId() {
			return sortId;
		}

		public void setSortId(Integer sortId) {
			this.sortId = sortId;
		}

	}

	public class LookupTable {
		private String tableName;

		private long datasetId;

		private List<LookupJoin> joins;

		public String getTableName() {
			return tableName;
		}

		public void setTableName(String tableName) {
			this.tableName = tableName;
		}

		public List<LookupJoin> getJoins() {
			return joins;
		}

		public void setJoins(List<LookupJoin> joins) {
			this.joins = joins;
		}

		public long getDatasetId() {
			return datasetId;
		}

		public void setDatasetId(long datasetId) {
			this.datasetId = datasetId;
		}

	}

	public class LookupJoin {
		private String type;

		private String[] primaryKeys;

		private String[] foreignKeys;

		public LookupJoin(String type) {
			this.type = type;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String[] getPrimaryKeys() {
			return primaryKeys;
		}

		public void setPrimaryKeys(String[] primaryKeys) {
			this.primaryKeys = primaryKeys;
		}

		public String[] getForeignKeys() {
			return foreignKeys;
		}

		public void setForeignKeys(String[] foreignKeys) {
			this.foreignKeys = foreignKeys;
		}

	}
}
