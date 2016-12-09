package com.salim.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		service.saveBudget(budget);
		return new InternalResourceView();
	}
	
	//예산 조회
	@RequestMapping(value="/login/findbudget.do")
	public /*String*/ModelAndView findBudget(@DateTimeFormat(pattern="yyyy-MM-dd")@RequestParam Date budgetDate, HttpSession session){
		
		System.out.println(budgetDate);
		
		if(budgetDate == null){
			Date today = new Date();
			int year = today.getYear();
			int month = today.getMonth();
			budgetDate = new Date(year, month, 1);
		}
		
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		return new ModelAndView("body/budget.tiles", "findBudget", service.findBudget(map));
		
		/*return "body/budget.tiles";*/
	}
	
	
}
