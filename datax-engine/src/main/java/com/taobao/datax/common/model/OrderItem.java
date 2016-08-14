package com.taobao.datax.common.model;

public class OrderItem {

	// es排序字段名
		private String orderFieldName;
		
		// es排序倒序顺序
		private String order="desc";
		//顺序
		private int sortId=0;

		public int getSortId() {
			return sortId;
		}

		public void setSortId(int sortId) {
			this.sortId = sortId;
		}

		public String getOrderFieldName() {
			return orderFieldName;
		}

		public void setOrderFieldName(String orderFieldName) {
			this.orderFieldName = orderFieldName;
		}

		public String getOrder() {
			return order;
		}

		public void setOrder(String order) {
			this.order = order;
		}
		
		
}
