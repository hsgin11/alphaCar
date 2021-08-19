package com.study.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.order.vo.OrderVO;

@Mapper
public interface IOrderDao {
	public int insertOrder(OrderVO order);
	public OrderVO getOrder(int orderNo);
	public List<OrderVO> getOrderListById(String userId);
	public List<OrderVO> getOrderListBySellerId(String sellerId);
}
