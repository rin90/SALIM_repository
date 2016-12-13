package com.salim.controller;

import java.text.ParseException;
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
		
		/* 그룹추가시 사용할 것
		 * String memberId = null;
		if(session.getAttribute("group_info") != null){
			memberId = ((Group)session.getAttribute("group_info").get)
		}*/
		
		service.saveBudget(budget);
		
		
		return "redirect:/household/login/findbudget.do?budgetDate="+new SimpleDateFormat("yyyy-MM").format(budget.getBudgetDate())+"&budgetNum="+budget.getNum();
	}
	
	//예산 조회
	@RequestMapping(value="/login/findbudget.do")
	public String findBudget(HttpSession session, HttpServletRequest request, ModelMap modelMap) throws ParseException{
		
		/* 그룹추가시 사용할 것
		 * String memberId = null;
		if(session.getAttribute("group_info") != null){
			memberId = ((Group)session.getAttribute("group_info").get)
		}*/
		
		Date budgetDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		if(request.getParameter("budgetDate") == null){
			Date today = new Date();
			int year = today.getYear();
			int month = today.getMonth();
			budgetDate = new Date(year, month, 01);
		}else{
			budgetDate = (Date)sdf.parse(request.getParameter("budgetDate"));
		}
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		
		Map result = service.findBudget(map);
		modelMap.addAllAttributes(result);
		
		Budget budget = (Budget) result.get("budget");
		int budgetNum=0;
		if(budget != null){
			budgetNum = budget.getNum();
		}
		request.setAttribute("budgetNum", budgetNum);
		
		request.setAttribute("budgetDate", sdf.format(budgetDate));//budgetDate
		
		return "body/budget.tiles";
	}
	
	
	//예산 조회 아작스 처리
	@RequestMapping(value="/login/findbudgetMonth.do")
	@ResponseBody
	public Map findBudgetMonth(@DateTimeFormat(pattern="yyyy-MM")@RequestParam Date budgetDate, HttpSession session, HttpServletRequest request){
		
		
		/* 그룹추가시 사용할 것
		 * String memberId = null;
		if(session.getAttribute("group_info") != null){
			memberId = ((Group)session.getAttribute("group_info").get)
		}*/

		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("budgetDate", budgetDate);
		
		request.setAttribute("budgetDate", budgetDate);
		
		Map result = service.findBudget(map);
		
		Budget budget = (Budget) result.get("budget");	
		int budgetNum=0;
		if(budget != null){
			budgetNum = budget.getNum();
		}
		request.setAttribute("budgetNum", budgetNum);
		
		return result;
	}
	
	
	
	
}
