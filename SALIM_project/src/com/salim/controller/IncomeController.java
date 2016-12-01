package com.salim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.salim.service.IncomeService;
import com.salim.vo.Income;

@Controller
@RequestMapping("/household")
public class IncomeController {
	
	@Autowired
	private IncomeService service;
	
	//수입 입력한 것 저장 및 수정
	/*
	 * 
	 */
	@RequestMapping(value="/login/income.do", method=RequestMethod.POST)
	public String saveIncome(@ModelAttribute Income income){
		return null;
		
	}
	
	
	
	
}
