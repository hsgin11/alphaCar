package com.study.order.service;

import java.util.List;

import com.study.order.vo.OrderVO;

public interface IOrderService {
	public void registOrder(OrderVO order);
	public OrderVO getOrder(int orderNo);
	public List<OrderVO> getOrderList(String userId);
	public List<OrderVO> getOrderListBySellerId(String sellerId);
}
