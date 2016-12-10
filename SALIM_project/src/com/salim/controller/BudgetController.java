package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.BudgetService;
import com.salim.vo.Budget;
import com.salim.vo.Member;

@Controller
@RequestMapping("/household")
public class BudgetController {
	
	@Autowired
	private BudgetService service;
	
	//예산 저장 & 수정
	@RequestMapping(value="/login/budget.do", method=RequestMethod.POST)
	public View saveBudget(@ModelAttribute Budget budget){
		
		System.out.println("============예산 저장할 때=======================");
		service.saveBudget(budget);
		
		System.out.println("저장한 예산 객체 - "+budget);
		
		return new InternalResourceView("/household/login/findbudget.do");
	}
	
	//예산 조회
	@RequestMapping(value="/login/findbudget.do")
	public ModelAndView findBudget(HttpSession session, HttpServletRequest request){
		
		System.out.println("================(처음 시작할 때&저장후) 조회======================");
		
		System.out.println("로그인한 멤버 아이디 - "+((Member)session.getAttribute("login_info")).getMemberId());
		
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();
		Date budgetDate = new Date(year, month, 01);
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		//받기로한 포맷으로 바꿔주고 찍음
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		//System.out.println("받고자하는 날짜 포맷 - "+sdf.format(budgetDate));
		
		Budget budget = service.findBudget(map);
		System.out.println("해당일로 - "+sdf.format(budgetDate)+" 조회한 예산 - "+budget);
		
		int budgetNum=0;
		if(budget != null){
			budgetNum = budget.getNum();
			
		}
		session.setAttribute("budgetNum", budgetNum);
		
	//session대신 request로 바꿔보자
		session.setAttribute("budgetDate", sdf.format(budgetDate));
		
		
		/*
		 * 하나의 컨트롤러로 모든일을 처리할 떄 쓰는 코드
		//처음에 조회할 달을 못받아오면 넣어주자
		Date budgetDate = null;
		if(request.getAttribute("budgetDate") == null){ //한번 왔다 오면 request에 있을테니까
			Date today = new Date();
			int year = today.getYear();
			int month = today.getMonth();
			budgetDate = new Date(year, month, 01);
		}else{ //달을 받아오면 session에 있는 것을 조회해서 가져오기
			budgetDate = (Date)request.getAttribute("budgetDate"); //session에 저장
		}
		//받기로한 포맷으로 바꿔주고 찍음
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		System.out.println("받고자하는 날짜 포맷 - "+budgetDate);
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		Budget budget = service.findBudget(map);
		System.out.println("해당일로 - "+budgetDate+" 조회한 예산 - "+budget);
		
		session.setAttribute("budgetDate", sdf.format(budgetDate));
		session.setAttribute("budget", budget);
		*/
		
		
		return new ModelAndView("body/budget.tiles", "budget", budget);
		
		/*return "body/budget.tiles";*/
	}
	
	
	//예산 조회 아작스 처리
	@RequestMapping(value="/login/findbudgetMonth.do")
	@ResponseBody
	public Budget findBudgetMonth(@DateTimeFormat(pattern="yyyy-MM")@RequestParam Date budgetDate, HttpSession session, HttpServletRequest request){
		
		/*String budgetDate*/
		/*@RequestParam Date budgetDate*/
		/*@DateTimeFormat(pattern="yyyy-MM")*/
		/*@DateTimeFormat(pattern="dd/MM/yyyy")*/
		/*@DateTimeFormat(pattern="yyyy-MM-dd")*/
		/*@DateTimeFormat(pattern="yyyy-mm")*/
		
		/* 그룹추가시 사용할 것
		 * String memberId = null;
		if(session.getAttribute("group_info") != null){
			memberId = ((Group)session.getAttribute("group_info").get)
		}*/
		
		System.out.println("===========아작스로 조회할 때 ===================");
		
		System.out.println("아작스 조회시 사용할 날짜 - "+budgetDate);
		
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		
		
		
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		session.setAttribute("budgetDate", budgetDate);
		
		Budget budget = service.findBudget(map);
		
		//session.setAttribute("budget", budget);
		request.setAttribute("budget", budget);
		System.out.println("조회한 달의 예산 - "+budget);
		
		
		int budgetNum=0;
		if(budget != null){
			budgetNum = budget.getNum();
		}
		session.setAttribute("budgetNum", budgetNum);
		
		return budget;
	}
	
	
	
	
}
