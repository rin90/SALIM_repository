package com.salim.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.CategoryDao;
import com.salim.service.CategoryService;
import com.salim.vo.BigCategory;
import com.salim.vo.SmallCategory;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDao dao;

	//상위코드를 조회
	public BigCategory selectHighCode(String bigContent) {
		return dao.selectHighCode(bigContent);
	}

	//대분류 코드를 조회
	public List<BigCategory> selectBigCode(int highCode) {
		return dao.selectBigCode(highCode);
	}

	//소분류 코드를 조회
	public List<SmallCategory> selectSmallCode(int bigCode) {
		return dao.selectSmallCode(bigCode);
	}

	//소분류 코드로 소분류vo, 대분류vo까지 다 조회
	public SmallCategory selectBigCodeBySmallCode(int smallCode) {
		return dao.selectBigCodeBySmallCode(smallCode);
	}
	
	
	
	
	
}
