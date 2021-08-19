package com.study.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.user.vo.UserVO;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		if(session == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		if(user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		if(!user.getUserRole().equals("customer")){
			PrintWriter out = response.getWriter();
			String referer = (String)request.getHeader("REFERER");
			out.print("<script>alert('상품을 구매할 수 없습니다. 권한을 확인하세요.');location.href='"+referer+"'</script>");
			out.flush();
			out.close();
			return false;
		}
		
		
		return true;
	}

}
