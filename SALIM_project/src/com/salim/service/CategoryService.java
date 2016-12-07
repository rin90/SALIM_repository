package com.salim.service;

import java.util.List;

import com.salim.vo.BigCategory;
import com.salim.vo.SmallCategory;

public interface CategoryService {
//카테고리 서비스
		//상위코드를 조회
		BigCategory selectHighCode(String bigContent);
		
		//대분류 코드를 조회
		List<BigCategory> selectBigCode(int highCode);
		
		//소분류 코드를 조회
		List<SmallCategory> selectSmallCode(int bigCode);
		
		//소분류 코드로 소분류vo, 대분류vo까지 다 조회
		SmallCategory selectBigCodeBySmallCode(int smallCode);
	}
