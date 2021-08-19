package com.study.login.web;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.car.service.ICarService;
import com.study.car.vo.CarVO;
import com.study.car.vo.MyCarVO;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.login.service.ILoginService;
import com.study.user.service.IUserService;
import com.study.user.vo.UserCountVO;
import com.study.user.vo.UserVO;

@Controller


public class LoginController {
	
	@Inject
	ILoginService loginService;
	@Inject
	ICarService carService;
	@Inject
	IUserService userService;
	
	@GetMapping("login")
	public String loginGet(HttpServletRequest req) {
		return "/login";
	}

	@PostMapping("login")
	public String loginPost(
			HttpServletRequest req,
			HttpServletResponse resp,
			@RequestParam("userId")String id,
			@RequestParam("userPass")String pw
			)throws Exception{
		if((id==null||id.isEmpty()) || (pw==null||pw.isEmpty())) {
			return "redirect:/login?msg="+URLEncoder.encode("입력안함","utf-8");
		}
		try {
			UserVO user = loginService.loginCheck(id, pw);
			UserCountVO userCount = userService.getCountInfo(id);
			HttpSession session = req.getSession();
			if(!user.getUserRole().equals("admin")) {				
				MyCarVO myCar = carService.getMyCar(id);
				CarVO car = carService.getCar(myCar.getCarId());
				session.setAttribute("CAR_INFO",car);
			}
			session.setAttribute("COUNT_INFO", userCount);
			session.setAttribute("USER_INFO",user);
			session.setMaxInactiveInterval(1800);			
			String prePage=(String)session.getAttribute("PREPAGE");
			session.removeAttribute("PREPAGE");
			if(prePage!=null) {
				return "redirect:"+prePage;
			}
			return "redirect:/";
		}catch(BizNotFoundException e) {
			return "redirect:/login?msg="+URLEncoder.encode("아이디 또는 비번 확인","utf-8");
		}catch(BizPasswordNotMatchedException e) {
			return "redirect:/login?msg="+URLEncoder.encode("아이디 또는 비번 확인","utf-8");
		}
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		HttpSession session=req.getSession();
		session.removeAttribute("USER_INFO");
		session.removeAttribute("COUNT_INFO");
		session.removeAttribute("CAR_INFO");
		return "redirect:/login?msg="+URLEncoder.encode("로그아웃 되었습니다.","utf-8");
	}
}
