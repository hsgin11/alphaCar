package com.study.order.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class OrderListVO {
	private List<OrderVO> orders;

	public List<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderVO> orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
	
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
}
