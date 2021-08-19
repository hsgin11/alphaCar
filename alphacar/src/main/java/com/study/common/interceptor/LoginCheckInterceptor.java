package com.study.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		
		// 파라미터가 없거나 true는 session이 없으면 새로 생성해서 return, false는 session이 없으면 null 리턴
		// ajax 요청인지, 브라우저 요청인지 
		if (session == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		if (session.getAttribute("USER_INFO") == null) {
			session.setAttribute("PREPAGE", request.getHeader("Referer"));
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		} else
			return true;

	}
}
