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
		
		
		System.out.println("파라미터에서 받아온 지출일 - "+expenseDate);
		//expenseDate가 null이면 오늘날짜로 조회 - 다시 조회해도 선택한 날짜를 유지하기 위해서 session에 저장.
		if(expenseDate == null){
			Date date = new Date();
			int year = date.getYear();
			int month = date.getMonth();
			int day = date.getDate();
			expenseDate = new Date(year, month, day);
		}
		
		//date랑 memberid받음-session의 login_infor에서 받아온다.
		//로그인 정보 가져오기
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		//service로 보낼 map을 만들자
		Map map = new HashMap();
		map.put("memberId", memberId);
		map.put("expenseDate", expenseDate);
		
		//조회하는 서비스를 부르자
		List<Expense> expenseList = service.selectExpense(map);
		
		//하나의 서비스에서 다 처리 해볼까나. - 전체 대분류 코드 받아서 뿌려주기 - 예) 지출에 해당하는 것 다 부름.
		List<BigCategory> bigCategoryList = categoryService.selectBigCode(categoryService.selectHighCode("지출").getBigCode());
		
		//해당 소분류 코드로 선택된 대분류 코드들 관리
		//선택된 지출목록에서 선택된 소분류 코드로 선택된 대분류vo, 소분류vo를 리스트로 뽑아낸다.
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<expenseList.size(); i++){
			int bigCode = expenseList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryService.selectBigCodeBySmallCode(bigCode));
		}
		System.out.println("소분류 조회해온것 찍기"+selectSmallCategoryList);
		
		//ModelMap을 이용해서 requestScope에 저장
		modelMap.addAttribute("bigCategoryList", bigCategoryList);
		modelMap.addAttribute("expenseList", expenseList);
		modelMap.addAttribute("selectSmallCategoryList", selectSmallCategoryList);
		
		//다 처리하고 session에 expenseDate 저장하기 - 포맷저장해서
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		session.setAttribute("expenseDate", sdf.format(expenseDate));
		System.out.println("session에 저장된 지출일 - "+expenseDate);
		
		//뷰로 이동
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
		
		
		System.out.println("====================지출 저장 =====================");
		System.out.println("지출 아이디 - "+expenseId);
		System.out.println("지출 내역 - "+expenseExplain);
		System.out.println("현금 지출 - "+cashExpense);
		System.out.println("카드 지출 - "+cardExpense);
		System.out.println("지출 코드 - "+codeId);
		System.out.println("조회하고자 하는 지출일 - "+expenseDate);
		System.out.println("=================================================");
		
		//expense객체 만들어서 넘기기
		//로그인한 멤버 아이디 가져오기
		Member member = (Member) session.getAttribute("login_info");
		
		//지출 list로 만들기
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
				if(expenseExplain.get(i) == null){
					expenseExplain.add(i, " ");
				}
			}catch(Exception e){
				expenseExplain.add(i, " ");
			}
			try{
				if(cashExpense.get(i) == null){
					cashExpense.add(i, 0);
				}
			}catch(Exception e){
				cashExpense.add(i, 0);
			}
			try{
				if(cardExpense.get(i) == null){
					cardExpense.add(i, 0);
				}
			}catch(Exception e){
				cardExpense.add(i, 0);
			}
			try{
				if(codeId.get(i) == null){
					codeId.add(i, 18);
				}
			}catch(Exception e){
				codeId.add(i, 18);
			}
		}
		
		System.out.println("====================지출 저장 =====================");
		System.out.println("지출 아이디 - "+expenseId);
		System.out.println("지출 내역 - "+expenseExplain);
		System.out.println("현금 지출 - "+cashExpense);
		System.out.println("카드 지출 - "+cardExpense);
		System.out.println("지출 코드 - "+codeId);
		System.out.println("조회하고자 하는 지출일 - "+expenseDate);
		System.out.println("=================================================");
		
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
	public View deleteExpense(@RequestParam ArrayList<Integer> expenseIdList){
		service.deleteExpense(expenseIdList);
		return new InternalResourceView("/household/login/expenseSelect.do");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
