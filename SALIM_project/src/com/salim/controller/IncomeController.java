package com.salim.controller;

import java.text.ParseException;
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
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NotesService notesService;
	
	//수입 입력한 것 저장 및 수정
	@RequestMapping(value="/login/income.do", method=RequestMethod.POST)
	public String saveIncome(@RequestParam ArrayList<Integer> incomeId, 
						   @RequestParam ArrayList<String> explanation, 
						   @RequestParam ArrayList<Integer> incomeMoney, 
						   @RequestParam ArrayList<Integer> codeId, 
						   @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date incomeDate, 
						   @RequestParam ArrayList<Integer> bigCategory, 
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
		int max = 1;
		if(explanation.size() > codeId.size() && explanation.size() > incomeMoney.size()){
			max = explanation.size();
		}else if(codeId.size() > incomeMoney.size()){
			max = codeId.size();
		}else{
			max = incomeMoney.size();
		}
		for(int i=0; i<max; i++){
			try{
				if(codeId.get(i) == null){
					codeId.set(i, 1);
				}
			}catch(Exception e){
				codeId.add(i, 1);
			}
			try{
				if(explanation.get(i) == null || explanation.get(i).isEmpty()){
					explanation.set(i, " ");
				}
			}catch(Exception e){
				explanation.add(i, " ");
			}
			try{
				if(incomeMoney.get(i) == null){
					incomeMoney.set(i, 0);
				}
			}catch(Exception e){
				incomeMoney.add(i, 0);
			}
		}
		
		//메모 객체 만들기
		String content = request.getParameter("notes");
		if(content != null && !content.trim().isEmpty()){
			Notes notes = new Notes(Integer.parseInt(request.getParameter("notesNum")), incomeDate, request.getParameter("notes"), memberId);
			notesService.saveNotes(notes);
		}
		
		//저장할 객체 만들기 - 수입
		List<Income> incomeList = new ArrayList<Income>();
		for(int i=0; i<max; i++){
			if(codeId.get(i)==1 && explanation.get(i).trim().isEmpty() && incomeMoney.get(i) == 0){
				return "redirect:/household/login/incomeSelect.do?incomeDate="+new SimpleDateFormat("yyyy-MM-dd").format(incomeDate);
			}else{
				incomeList.add(new Income(incomeId.get(i), memberId, codeId.get(i), incomeDate, explanation.get(i), incomeMoney.get(i)));
			}
		}
		System.out.println("==========저장한 수입객체 =============");
		System.out.println(incomeList);
		
		//DB에 저장
		service.saveIncome(incomeList);

		return "redirect:/household/login/incomeSelect.do?incomeDate="+new SimpleDateFormat("yyyy-MM-dd").format(incomeDate);
	}
	
	
	
	
	//수입 조회
	@RequestMapping(value="/login/incomeSelect.do")//, method=RequestMethod.POST
	public String selectIncome(@DateTimeFormat(pattern="yyyy-MM-dd")Date incomeDate ,HttpServletRequest request, HttpSession session, ModelMap modelMap){
		
		if(incomeDate == null){
			Date now = new Date();
			int year = now.getYear();
			int month = now.getMonth();
			int day = now.getDate();
			incomeDate = new Date(year, month, day); 
			System.out.println("없으면 오늘날짜로 조회 - "+incomeDate);
		}

		//memberId에 개인id인지 그룹id인지 파악
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		System.out.println("수입 조회에서 collection이 있나 파악하는 것"+collect);
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		//String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		//수입 조회
		Map map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("incomeDate", incomeDate);
		List<Income> incomeList = service.selectIncome(map);
		
		//대분류 조회
		List<BigCategory> bigCategoryList = categoryService.selectBigCode(categoryService.selectHighCode("수입").getBigCode());
		//조회된 지출에 해당되는 소분류 조회
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<incomeList.size(); i++){
			int bidgCode = incomeList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryService.selectBigCodeBySmallCode(bidgCode));
		}
		//메모 조회
		Map notesMap = new HashMap();
		notesMap.put("memberId", memberId);
		notesMap.put("dayDate", incomeDate);
		Notes notes = notesService.findNotes(notesMap);
		
		//request에 저장
		modelMap.addAttribute("incomeList", incomeList);
		modelMap.addAttribute("bigCategoryList", bigCategoryList);
		modelMap.addAttribute("selectSmallCategoryList", selectSmallCategoryList);
		modelMap.addAttribute("notes", notes);

		//해당하는 날짜의 유지를 위해서 session에 담아줌
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		request.setAttribute("incomeDate", sdf.format(incomeDate));

		return "body/income.tiles";
	}
	
	
	
	//삭제
	@RequestMapping(value="/login/incomeDelete.do")
	public String deleteIncome(@RequestParam ArrayList<Integer> incomeIdList, HttpSession session, HttpServletRequest request){
		
		//memberId에 개인id인지 그룹id인지 파악
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		//String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		service.deleteIncome(incomeIdList, memberId);
		return "redirect:/household/login/incomeSelect.do?incomeDate="+request.getParameter("incomeDate");
	}
	
	

	
}
