package com.study.login.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.study.car.service.ICarService;
import com.study.car.vo.CarCodeVO;
import com.study.car.vo.CarVO;
import com.study.common.valid.Step1;
import com.study.common.valid.Step2;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;

@Controller
@SessionAttributes("user")
public class JoinController {
	
	@Inject
	ICarService carService;
	
	
	@ModelAttribute("user")
	public UserVO user() {
		UserVO user = new UserVO();
		return user;
	}

	@Inject
	IUserService userService;

	@RequestMapping("/join/step1")
	public String step1(@ModelAttribute("user") UserVO user) {
		return "join/step1";
	}

	@RequestMapping("/join/step2")
	public String step2(@ModelAttribute("user") @Validated({ Step1.class }) UserVO user, BindingResult errors, Model model) {
		if (errors.hasErrors()) {
			return "join/step1";
		}
		List<CarCodeVO>carFacList = carService.getCarFacList();
		model.addAttribute("carFacList", carFacList);
		return "join/step2";
	}
	@RequestMapping("join/regist")
	public String regist(@ModelAttribute("user") @Validated({ Step2.class }) UserVO user, BindingResult errors,
			@RequestParam("carId")String carId, Model model, SessionStatus sessionStatus, HttpServletResponse resp) {

		if (errors.hasErrors()) {
			return "join/step2";
		}
		
		CarVO car = carService.getCar(carId);
	
		Map<String , String> registCarData = new HashMap<String, String>();
		registCarData.put("carId", carId);
		registCarData.put("userId", user.getUserId());
		registCarData.put("myCarName", car.getCarName());
		try {
			sessionStatus.setComplete();
			userService.registUser(user);
			carService.myCarRegist(registCarData);
			
		}catch(BizDuplicateKeyException edk) {
			try {
				PrintWriter out = resp.getWriter();
				out.print("<script>alert('아이디 중복입니다.')</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "join/step2";
		}catch(BizNotEffectedException eee) {
			return "join/step2";
		}
		return "redirect:/";
	}
	@RequestMapping("join/cancel")
	public String cancel(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/login";
				
	}
	
	@RequestMapping("join/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String id, UserVO user) {
		try {
			user = userService.getUser(id);
		}catch(BizNotFoundException e) {
			return "Y";
		}
		return "N";
	}
	
}
