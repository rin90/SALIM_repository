package com.salim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CodeService;
import com.salim.vo.Code;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	@Autowired
	private CodeService service;
	
	//수입코드 list 가져오기
	@RequestMapping("/income/codeList")
	public ModelAndView findCodeListIncome(){
		List<Code> codeList = service.findCode("수입");
		
		return new ModelAndView("body/income.tiles", "codeList",codeList);
	}
	
	//지출code list 가져오기
	@RequestMapping("/expense/codeList")
	public ModelAndView findCodeLsitExpense(){
		List<Code> codeList = service.findCode("지출");
		return new ModelAndView("/body/expense.tiles", "codeList", codeList);
		
	}
	
	//소분류 코드 list가져오기
	@RequestMapping("/small/codeList")
	@ResponseBody 
	public List<Code> findCodeList(@RequestParam String secondCode){
		
		return service.findCode(secondCode);
	}
	
	
	
	
	
}
