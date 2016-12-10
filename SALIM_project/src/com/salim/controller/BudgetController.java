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
import org.springframework.ui.ModelMap;
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
	public String saveBudget(@ModelAttribute Budget budget){
		service.saveBudget(budget);
		
		
		
		return "body/budget.tiles";
	}
	
	//예산 조회
	@RequestMapping(value="/login/findbudget.do")
	public String findBudget(HttpSession session, HttpServletRequest request, ModelMap modelmap){
		
		
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();
		Date budgetDate = new Date(year, month, 01);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		System.out.println(budgetDate);
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		modelmap.put("budget", service.findBudget(map));
		modelmap.put("budgetDate", sdf.format(budgetDate));
		
		/*return new ModelAndView("body/budget.tiles", "Budget", service.findBudget(map));*/
		
		return "body/budget.tiles";
	}
	
	
	//예산 조회 아작스 처리
	@RequestMapping(value="/login/findbudgetMonth.do")
	@ResponseBody //@DateTimeFormat(pattern="yyyy-MM")@RequestParam
	public Budget findBudgetMonth(@DateTimeFormat(pattern="yyyy-MM")@RequestParam Date budgetDate, HttpSession session){
		
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
		
		System.out.println("뭘롤 넘어오는지 좀 찍어보자 휴 - "+budgetDate);
		
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		Budget budget = service.findBudget(map);
		
		
		
		return budget;
	}
	
	
	
	
}
