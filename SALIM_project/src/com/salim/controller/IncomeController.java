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

import com.salim.service.CategoryService;
import com.salim.service.IncomeService;
import com.salim.service.NotesService;
import com.salim.vo.BigCategory;
import com.salim.vo.Collect;
import com.salim.vo.Income;
import com.salim.vo.Member;
import com.salim.vo.Notes;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/household")
public class IncomeController {
	
	@Autowired
	private IncomeService service;
	
	//수입 입력한 것 저장 및 수정
	@RequestMapping(value="/login/income.do", method=RequestMethod.POST)
	public String saveIncome(@RequestParam ArrayList<Integer> incomeId, 
						   @RequestParam ArrayList<String> explanation, 
						   @RequestParam ArrayList<Integer> incomeMoney, 
						   @RequestParam ArrayList<Integer> codeId, 
						   @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date incomeDate, 
						   HttpSession session,
						   HttpServletRequest request){
		
		String memberId = checkMemberId(session);
		System.out.println("수입에 들어온 멤버 조회 - "+memberId);
		service.saveIncome(memberId, incomeId, explanation, incomeMoney, codeId, incomeDate, request.getParameter("notes"), Integer.parseInt(request.getParameter("notesNum")));				
		return "redirect:/household/login/incomeSelect.do?incomeDate="+new SimpleDateFormat("yyyy-MM-dd").format(incomeDate);
	}
	
	//수입 조회
	@RequestMapping(value="/login/incomeSelect.do")
	public String selectIncome(@DateTimeFormat(pattern="yyyy-MM-dd")Date incomeDate, HttpSession session, ModelMap modelMap){
		
		if(incomeDate == null){
			Date now = new Date();
			int year = now.getYear();
			int month = now.getMonth();
			int day = now.getDate();
			incomeDate = new Date(year, month, day);
		}
		
		String memberId = checkMemberId(session);
		modelMap.addAllAttributes(service.selectIncome(memberId, incomeDate));
		modelMap.addAttribute("incomeDate", new SimpleDateFormat("yyyy-MM-dd").format(incomeDate));
		return "body/income.tiles";
	}
	
	//수입 삭제
	@RequestMapping(value="/login/incomeDelete.do")
	public String deleteIncome(@RequestParam ArrayList<Integer> incomeIdList, HttpSession session, HttpServletRequest request){
		String memberId = checkMemberId(session);
		service.deleteIncome(incomeIdList, memberId);
		return "redirect:/household/login/incomeSelect.do?incomeDate="+request.getParameter("incomeDate");
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
