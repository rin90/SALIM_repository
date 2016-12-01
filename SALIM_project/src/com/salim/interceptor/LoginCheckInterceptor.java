package com.salim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{//interceptor : handler(컨트롤러 로직 처리)들의 공통 로직을 처리하기 위한 component

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {//handler메소드 호출전에 호출
		HttpSession session = request.getSession();
		if(session.getAttribute("login_info")==null){//로그인 안 했다
			throw new ModelAndViewDefiningException(new ModelAndView("member/login_form.tiles", "error_message", "로그인 먼저 하세요."));
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		//로그아웃 후 웹 브라우저 back 버튼 클릭시 이전 페이지에 로그인 된 상태로 보이는 것 안되도록 처리 & 로그인 한 후 모든 페이지들이 cache 사용하지않도록 처리한다
		response.setHeader("cache-control", "no-store, no-cache");
	}
	
}
