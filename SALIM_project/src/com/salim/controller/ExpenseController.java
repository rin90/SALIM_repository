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
		
		//memberId에 개인id인지 그룹id인지 파악
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		System.out.println("지출 조회에서 collection이 있나 파악하는 것"+collect);
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		
		//지출 조회
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("expenseDate", expenseDate);
		List<Expense> expenseList = service.selectExpense(map);
		//대분류 조회
		List<BigCategory> bigCategoryList = categoryService.selectBigCode(categoryService.selectHighCode("지출").getBigCode());
		//조회된 지출에 해당되는 소분류 조회
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<expenseList.size(); i++){
			int bigCode = expenseList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryService.selectBigCodeBySmallCode(bigCode));
		}
		//메모 조회
		Map notesMap = new HashMap();
		notesMap.put("memberId", memberId);
		notesMap.put("dayDate", expenseDate);
		Notes notes = notesService.findNotes(notesMap);
		
		//request에 저장
		modelMap.addAttribute("bigCategoryList", bigCategoryList);
		modelMap.addAttribute("expenseList", expenseList);
		modelMap.addAttribute("selectSmallCategoryList", selectSmallCategoryList);
		modelMap.addAttribute("notes", notes);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		request.setAttribute("expenseDate", sdf.format(expenseDate));
		
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
		
		//로그인 체크
		
		//memberId에 개인id인지 그룹id인지 파악
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		
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

		//메모 객체 만들기
		String content = request.getParameter("notes");
		if(content != null && !content.trim().isEmpty()){
			Notes notes = new Notes(Integer.parseInt(request.getParameter("notesNum")), expenseDate, request.getParameter("notes"), memberId);
			notesService.saveNotes(notes);
		}
		
		//저장할 객체 만들기 - 지출
		List<Expense> expenseList = new ArrayList<> ();
		for(int i=0; i<max; i++){
			if(codeId.get(i)==18 && expenseExplain.get(i).trim().isEmpty() && cashExpense.get(i)==0 && cardExpense.get(i)==0){
				return "redirect:/household/login/expenseSelect.do?expenseDate="+new SimpleDateFormat("yyyy-MM-dd").format(expenseDate);
			}else{
				expenseList.add(new Expense(expenseId.get(i), memberId, codeId.get(i), expenseDate, expenseExplain.get(i), cashExpense.get(i), cardExpense.get(i), "카드타입"));
			}
		}

		//DB에 저장
		service.saveExpense(expenseList);
		
		return "redirect:/household/login/expenseSelect.do?expenseDate="+new SimpleDateFormat("yyyy-MM-dd").format(expenseDate);
	}
	
	
	//지출 삭제
	@RequestMapping(value="/login/expenseDelete.do")
	public String deleteExpense(@RequestParam ArrayList<Integer> expenseIdList, HttpSession session, HttpServletRequest request){
		
		//memberId에 개인id인지 그룹id인지 파악
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		service.deleteExpense(expenseIdList, memberId);
		return "redirect/household/login/expenseSelect.do?expenseDate="+request.getParameter("expenseDate");
	}
	
	
	
	
}
