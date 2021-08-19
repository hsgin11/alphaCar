package com.study.login.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.validation.groups.Default;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.common.valid.Modify;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.user.service.IUserService;
import com.study.user.vo.UserVO;

@Controller
public class UserController {

	@Inject
	IUserService userService;

	@RequestMapping("/user/userList")
	public String userList(Model model) {
		List<UserVO> userList = userService.getUserList();
		model.addAttribute("userList", userList);
		return "user/userList";
	}

	@RequestMapping("/user/userView")
	public String userView(String userId, Model model) throws BizNotFoundException {
		UserVO user = userService.getUser(userId);
		model.addAttribute("user", user);
		return "user/userView";
	}

	@RequestMapping("/user/userEdit")
	public String userModify(String userId, Model model) throws BizNotFoundException {
		UserVO user = userService.getUser(userId);
		model.addAttribute("user", user);
		return "user/userEdit";
	}

	@RequestMapping("/user/userModify")
	public String userModfiy(@ModelAttribute("user") @Validated({ Default.class, Modify.class }) UserVO user,
			BindingResult errors, Model model) {
		if (errors.hasErrors()) {
			return "user/userEdit";
		}
		try {
			userService.modifyUser(user);
		} catch (BizNotEffectedException eee) {
			eee.printStackTrace();
		} catch (BizNotFoundException e) {
			e.printStackTrace();
		}
		return "redirect:/user/userView?userId=" + user.getUserId();
	}
	@RequestMapping("/user/userForm")
	public String userForm(Model model) {
		return "user/userForm";
	}
	@RequestMapping(value ="/user/findPw", method = RequestMethod.GET)
	public void findPwGet() throws Exception{
		
	}
	@RequestMapping(value = "/user/sendmail", method =RequestMethod.POST )
	public void fidnPwPost(@ModelAttribute UserVO user, HttpServletResponse response) throws Exception{
		userService.findPw(response, user);
	}

}
