package com.study.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.order.dao.IOrderDao;
import com.study.order.vo.OrderVO;
import com.study.prod.vo.OptionVO;
@Service
public class OrderServiceImpl implements IOrderService {

	@Inject
	IOrderDao orderDao;
	@Override
	public void registOrder(OrderVO order) {
		
		System.out.println("dao order : " + order);
		
		orderDao.insertOrder(order);
	}
	@Override
	public OrderVO getOrder(int orderNo) {

		return orderDao.getOrder(orderNo);
	}
	
	@Override
	public List<OrderVO> getOrderList(String userId) {
		return orderDao.getOrderListById(userId);
	}
	@Override
	public List<OrderVO> getOrderListBySellerId(String sellerId) {

		return orderDao.getOrderListBySellerId(sellerId);
	}
}
