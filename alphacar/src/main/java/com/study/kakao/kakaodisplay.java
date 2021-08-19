package com.study.kakao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class kakaodisplay {
	@RequestMapping("testkakao")
	public String test() {
		return "test";
	}
	@RequestMapping("testim")
	public String testt() {
		return "test2";
	}
	
	
}
