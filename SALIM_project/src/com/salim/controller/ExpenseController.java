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
import com.salim.vo.BigCategory;
import com.salim.vo.Expense;
import com.salim.vo.Member;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/household")
public class ExpenseController {
	
	@Autowired
	private ExpenseService service;
	
	@Autowired
	private CategoryService categoryService;
	
	//지출 조회
	@RequestMapping(value="/login/expenseSelect.do")
	public String selectExpense(@DateTimeFormat(pattern="yyyy-MM-dd")Date expenseDate, HttpServletRequest request, HttpSession session, ModelMap modelMap){
		
		System.out.println(expenseDate);
		
		if(expenseDate == null){
			Date date = new Date();
			int year = date.getYear();
			int month = date.getMonth();
			int day = date.getDate();
			expenseDate = new Date(year, month, day);
		}
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("expenseDate", expenseDate);
		List<Expense> expenseList = service.selectExpense(map);
		
		List<BigCategory> bigCategoryList = categoryService.selectBigCode(categoryService.selectHighCode("지출").getBigCode());
		
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<expenseList.size(); i++){
			int bigCode = expenseList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryService.selectBigCodeBySmallCode(bigCode));
		}

		modelMap.addAttribute("bigCategoryList", bigCategoryList);
		modelMap.addAttribute("expenseList", expenseList);
		modelMap.addAttribute("selectSmallCategoryList", selectSmallCategoryList);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		session.setAttribute("expenseDate", sdf.format(expenseDate));
		
		return "body/expense.tiles";
	}
	
	
	//지출 저장
	@RequestMapping(value="/login/expense.do", method=RequestMethod.POST)
	public View saveExpense(@RequestParam ArrayList<Integer> expenseId, 
							  @RequestParam ArrayList<String> expenseExplain,
							  @RequestParam ArrayList<Integer> cashExpense,
							  @RequestParam ArrayList<Integer> cardExpense,
							  /* 카드 통장 타입 보여지게 하는 것은 나중에..*/
							  @RequestParam ArrayList<Integer> codeId,
							  @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date expenseDate,
							  HttpSession session){
		
		Member member = (Member) session.getAttribute("login_info");
		
		List<Expense> expenseList = new ArrayList<> ();
		
		//검증
		int max =1;
		if(expenseExplain.size() > cashExpense.size() && expenseExplain.size() > cardExpense.size() && expenseExplain.size() > codeId.size()){
			max = expenseExplain.size();
		}else if(cashExpense.size() > cardExpense.size() && cashExpense.size() > codeId.size()){
			max = cashExpense.size();
		}else if(cardExpense.size() > codeId.size()){
			max = cardExpense.size();
		}else{
			max = codeId.size();
		}
		for(int i=0; i<max; i++){
			try{
				if(expenseExplain.get(i) == null || expenseExplain.get(i).isEmpty()){
					expenseExplain.set(i, " ");
				}
			}catch(Exception e){
				expenseExplain.add(i, " ");
			}
			try{
				if(cashExpense.get(i) == null){
					cashExpense.set(i, 0);
				}
			}catch(Exception e){
				cashExpense.add(i, 0);
			}
			try{
				if(cardExpense.get(i) == null){
					cardExpense.set(i, 0);
				}
			}catch(Exception e){
				cardExpense.add(i, 0);
			}
			try{
				if(codeId.get(i) == null){
					codeId.set(i, 18);
				}
			}catch(Exception e){
				codeId.add(i, 18);
			}
		}

		for(int i=0; i<max; i++){
			if(codeId.get(i)==18 && expenseExplain.get(i).trim().isEmpty() && cashExpense.get(i)==0 && cardExpense.get(i)==0){
				return new InternalResourceView("/household/login/expenseSelect.do");
			}else{
				expenseList.add(new Expense(expenseId.get(i), member.getMemberId(), codeId.get(i), expenseDate, expenseExplain.get(i), cashExpense.get(i), cardExpense.get(i), "카드타입"));
			}
		}
		service.saveExpense(expenseList);
		return new InternalResourceView("/household/login/expenseSelect.do");
	}
	
	
	//지출 삭제
	@RequestMapping(value="/login/expenseDelete.do")
	@ResponseBody
	public View deleteExpense(@RequestParam ArrayList<Integer> expenseIdList, HttpSession session){
		
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		service.deleteExpense(expenseIdList, memberId);
		System.out.println("==========지출 아이디============"+expenseIdList);
		return new InternalResourceView("/household/login/expenseSelect.do");
	}
	
	
	
	
}
