package com.study.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertifyController {
	@RequestMapping("/user/certify")
	public String certify() {
		
		return "user/certify";
		
	}

}
