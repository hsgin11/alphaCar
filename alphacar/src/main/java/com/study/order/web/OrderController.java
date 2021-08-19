package com.study.order.web;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.order.service.IOrderService;
import com.study.order.vo.OrderListVO;
import com.study.order.vo.OrderVO;

@Controller
public class OrderController {
	
	@Inject
	IOrderService orderService;
	
	@RequestMapping("orderregist")
	public String registOrder(@ModelAttribute("orders") OrderListVO orders, Model model, @RequestParam("sumPrice")String sumPrice) {
		System.out.println(orders);
		List<OrderVO> orderList = orders.getOrders();
		System.out.println(orderList);
		for (OrderVO order : orderList) {
			orderService.registOrder(order);	
		}
		model.addAttribute("order", orderList);
		model.addAttribute("sumPrice", sumPrice);
		return "prod/payment"; 
	}
}
