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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.CategoryService;
import com.salim.service.IncomeService;
import com.salim.vo.Income;
import com.salim.vo.Member;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/household")
public class IncomeController {
	
	@Autowired
	private IncomeService service;

	@Autowired
	private CategoryService categoryService;
	
	
	
	//수입 입력한 것 저장 및 수정
	@RequestMapping(value="/login/income.do", method=RequestMethod.POST)
	public View saveIncome(@RequestParam ArrayList<Integer> incomeId, 
						   @RequestParam ArrayList<String> explanation, 
						   @RequestParam ArrayList<Integer> incomeMoney, 
						   @RequestParam ArrayList<Integer> codeId, 
						   @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date incomeDate, 
						   @RequestParam ArrayList<Integer> bigCategory, 
						   HttpSession session){
	
		Member member = (Member) session.getAttribute("login_info");
		
		List<Income> incomeList = new ArrayList<Income>();
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

		for(int i=0; i<max; i++){
			if(codeId.get(i)==1 && explanation.get(i).trim().isEmpty() && incomeMoney.get(i) == 0){
				return new InternalResourceView("/household/login/incomeSelect.do");
			}else{
				incomeList.add(new Income(incomeId.get(i), member.getMemberId(), codeId.get(i), incomeDate, explanation.get(i), incomeMoney.get(i)));
			}
		}

		service.saveIncome(incomeList);
		InternalResourceView view = new InternalResourceView("/household/login/incomeSelect.do");
		return view;
	}
	
	
	
	
	//해당 날짜에 저장한 수입 목록이 있으면 가져오기
	@RequestMapping(value="/login/incomeSelect.do")//, method=RequestMethod.POST
	public View selectIncome(@DateTimeFormat(pattern="yyyy-MM-dd")Date incomeDate ,HttpServletRequest request, HttpSession session){

		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		if(incomeDate == null){
			Date now = new Date();
			int year = now.getYear();
			int month = now.getMonth();
			int day = now.getDate();
			incomeDate = new Date(year, month, day); 
			System.out.println("없으면 오늘날짜로 조회 - "+incomeDate);
		}
		
		Map map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("incomeDate", incomeDate);
		List<Income> incomeList = service.selectIncome(map);
		request.setAttribute("incomeList", incomeList);

		//가져온 incomeList에서 해당하는 소분류 객체 List를 뽑는 일을 하자 & 모든 소분류 가져오기
		List<SmallCategory> selectSmallCategoryList = new ArrayList();
		SmallCategory selectSmallCategory = null;
		if(!incomeList.isEmpty()){
			for(int i=0; i<incomeList.size(); i++){ //해당 날짜로 조회한 incomeList에서 codeId로 그 코드들의 묶음을 조회해옴
				Income income = incomeList.get(i);
				int codeId = income.getCodeId();
				selectSmallCategory = categoryService.selectBigCodeBySmallCode(codeId);
				selectSmallCategoryList.add(selectSmallCategory);
			}
		}

		//해당하는 날짜의 유지를 위해서 session에 담아줌
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		session.setAttribute("incomeDate", sdf.format(incomeDate));

		request.setAttribute("selectSmallCategoryList", selectSmallCategoryList);

		return new InternalResourceView("/category/income/bigCode.do");
	}
	
	
	
	//삭제
	@RequestMapping("/login/incomeDelete.do")
	@ResponseBody
	public View deleteIncome(@RequestParam ArrayList<Integer> incomeIdList, HttpSession session){

		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		service.deleteIncome(incomeIdList, memberId);

		return new InternalResourceView("/household/login/incomeSelect.do?incomeDate="+session.getAttribute("incomeDate"));
	}
	
	

	
}
