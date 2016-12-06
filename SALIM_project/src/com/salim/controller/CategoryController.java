package com.salim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CategoryService;
import com.salim.vo.BigCategory;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	//소분류 코드로 대분류까지 다 조회 - 수입, 지출 해당일 내역 뽑아올 때 사용
	@RequestMapping("/allCode.do")
	public ModelAndView findBigAndSmallCode(int smallCode){
		SmallCategory smallCategory = service.selectBigCodeBySmallCode(smallCode);
		return new ModelAndView("body/income.tiles", "smallCategory", smallCategory);
	}
	
	//대분류 코드 조회 ->  대분류를 부르자.
	@RequestMapping("/income/bigCode.do")
	public ModelAndView findBigCode(){
		//수입인지, 지출인지..
		BigCategory bigCategory = (BigCategory) service.selectHighCode("수입");
		//수입의 대분류, 지출의 대분류
		List<BigCategory> bigCategoryList = service.selectBigCode(bigCategory.getBigCode());
		
		return new ModelAndView("body/income.tiles", "bigCategoryList", bigCategoryList);
	}
	
	//소분류 코드 조회 -> 소분류
	@RequestMapping("/smallCode.do")
	@ResponseBody
	public List<SmallCategory> findSmallCode(int bigCode){
		System.out.println(bigCode);
		return service.selectSmallCode(bigCode);
	}
	
	
	
}
