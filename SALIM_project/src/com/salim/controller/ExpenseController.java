package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.CategoryService;
import com.salim.service.ExpenseService;
import com.salim.service.NotesService;
import com.salim.vo.BigCategory;
import com.salim.vo.Collect;
import com.salim.vo.Expense;
import com.salim.vo.Member;
import com.salim.vo.Notes;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/household")
public class ExpenseController {
	
	@Autowired
	private ExpenseService service;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NotesService notesService;
	
	//지출 조회
	@RequestMapping(value="/login/expenseSelect.do")
	public String selectExpense(@DateTimeFormat(pattern="yyyy-MM-dd")Date expenseDate, HttpServletRequest request, HttpSession session, ModelMap modelMap){

		if(expenseDate == null){
			Date date = new Date();
			int year = date.getYear();
			int month = date.getMonth();
			int day = date.getDate();
			expenseDate = new Date(year, month, day);
		}
		String memberId = checkMemberId(session);
		modelMap.addAllAttributes(service.selectExpense(memberId, expenseDate));
		modelMap.addAttribute("expenseDate", new SimpleDateFormat("yyyy-MM-dd").format(expenseDate));
		return "body/expense.tiles";
	}
	
	
	//지출 저장
	@RequestMapping(value="/login/expense.do", method=RequestMethod.POST)
	public String saveExpense(@RequestParam ArrayList<Integer> expenseId, 
							  @RequestParam ArrayList<String> expenseExplain,
							  @RequestParam ArrayList<Integer> cashExpense,
							  @RequestParam ArrayList<Integer> cardExpense,
							  /* 카드 통장 타입 보여지게 하는 것은 나중에..*/
							  @RequestParam ArrayList<Integer> codeId,
							  @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date expenseDate,
							  HttpSession session,
							  HttpServletRequest request){
		
		String memberId = checkMemberId(session);
		service.saveExpense(memberId, expenseId, expenseExplain, cashExpense, cardExpense, codeId, expenseDate, request.getParameter("notes"), Integer.parseInt(request.getParameter("notesNum")));
		return "redirect:/household/login/expenseSelect.do?expenseDate="+new SimpleDateFormat("yyyy-MM-dd").format(expenseDate);
	}
	
	
	//지출 삭제
	@RequestMapping(value="/login/expenseDelete.do")
	public String deleteExpense(@RequestParam ArrayList<Integer> expenseIdList, HttpSession session, HttpServletRequest request){
		String memberId = checkMemberId(session);
		service.deleteExpense(expenseIdList, memberId);
		return "redirect:/household/login/expenseSelect.do?expenseDate="+request.getParameter("expenseDate");
	}
	
	//그룹인지 개인인지 판별
	public String checkMemberId(HttpSession session){
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		return memberId;
	}
	
	
}
