package com.salim.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.CodeService;
import com.salim.vo.Code;
import com.salim.vo.Member;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	@Autowired
	private CodeService service;
	
	//수입코드 list 가져오기
	@RequestMapping("/income/codeList")
	public View findCodeListIncome(HttpServletRequest request){
		
		
		
		
		
		List<Code> codeList = service.findCode("수입");
		
		//return new ModelAndView("body/income.tiles", "codeList",codeList);
		
		//request에 바로 저장하자. - ModelAndView를 거쳐서 가지 않기 때문에.
		request.setAttribute("codeList", codeList);
		
		//코드를 조회한 후 해당 수입이 있는지 뿌려주기
		InternalResourceView view = new InternalResourceView("/household/login/incomeSelect.do");
		return view;
	}
	
	
	
	
	//지출code list 가져오기
	@RequestMapping("/expense/codeList")
	public ModelAndView findCodeLsitExpense(){
		List<Code> codeList = service.findCode("지출");
		return new ModelAndView("body/expense.tiles", "codeList", codeList);
		
	}
	
	//소분류 코드 list가져오기
	@RequestMapping("/small/codeList")
	@ResponseBody 
	public List<Code> findCodeList(@RequestParam String secondCode){		
		return service.findCode(secondCode);
	}
	
}
