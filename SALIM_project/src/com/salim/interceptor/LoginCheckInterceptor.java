package com.salim.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.salim.vo.Member;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{//interceptor : handler(컨트롤러 로직 처리)들의 공통 로직을 처리하기 위한 component

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {//handler메소드 호출전에 호출
		HttpSession session = request.getSession();
		
		
		//로그인 했다고 가정하고 멤버 가짜 객체 넣자  - session한테 -> 연동 후 session에서 login_info로 가져오면 됨.
		session.setAttribute("login_info", new Member("id-1", "안녕히", 20, new Date(1991-01-06), "password1","email123456@naver.com"));
		//System.out.println(session.getAttribute("login_info"));
		
		
		
		
		if(session.getAttribute("login_info")==null){//로그인 안 했다
			System.out.println(session.getAttribute("login_info"));
			throw new ModelAndViewDefiningException(new ModelAndView("/member/login_form.jsp", "error_message", "로그인 먼저 하세요."));
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		//로그아웃 후 웹 브라우저 back 버튼 클릭시 이전 페이지에 로그인 된 상태로 보이는 것 안되도록 처리 & 로그인 한 후 모든 페이지들이 cache 사용하지않도록 처리한다
		response.setHeader("cache-control", "no-store, no-cache");
	}
	
}
