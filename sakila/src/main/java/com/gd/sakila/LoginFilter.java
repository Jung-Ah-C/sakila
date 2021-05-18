package com.gd.sakila;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.internal.org.jline.utils.Log;

@WebFilter(urlPatterns = "/admin/*") // admin으로 시작하는 모든 주소를 가로챔
public class LoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 요청 전
		Log.debug("▶▶▶▶▶▶ LoginFilter 요청전");
		// 세션 검사
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
		}
		
		if(session.getAttribute("loginStaff") == null) { // 로그인이 되어 있지 않다면
			if(request instanceof HttpServletResponse) {
				((HttpServletResponse)response).sendRedirect("/");
			}
			return;
		}
		
		chain.doFilter(request, response);
		// 요청 후
	}
}
