package com.study.myPage;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.car.service.ICarService;
import com.study.car.vo.CarCodeVO;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;
import com.study.order.service.IOrderService;
import com.study.order.vo.OrderVO;
import com.study.prod.sercive.IProdSercive;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;

@Controller
public class MyPageController {

	@Inject
	IUserService userService;
	@Inject
	ICarService carService;
	@Inject
	IOrderService orderService;
	@Inject
	IProdSercive prodSercive;
	
	@RequestMapping("mypage")
	public String mypage(@RequestParam("userId")String userId, HttpSession session,   Model model) {
		UserVO login = (UserVO) session.getAttribute("USER_INFO");
		if(login != null) { 
			// loginId = login.getUserId();
			userId = login.getUserId();
		}
		
		MyCarVO myCar = carService.getMyCar(userId);
		CarVO car = carService.getCar(myCar.getCarId());
		List<OrderVO> orders = orderService.getOrderList(userId);
		
		
		
		model.addAttribute("car", car);
		model.addAttribute("orders", orders);
		return "mypage/mypage";
	}
	
	@RequestMapping("360VR")
	public String VR() {
		
		
		return "mypage/360VR";
	}
	@RequestMapping("mycar")
	public String mycar(@RequestParam("userId")String userId, Model model) {
		MyCarVO myCar = carService.getMyCar(userId);
		CarVO car = carService.getCar(myCar.getCarId());
		model.addAttribute("car", car);
		List<CarCodeVO>carFacList = carService.getCarFacList();
		model.addAttribute("carFacList", carFacList);
		return "mypage/myCar";
	}
	
}
