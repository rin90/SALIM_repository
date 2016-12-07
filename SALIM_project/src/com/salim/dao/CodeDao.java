package com.salim.dao;

import java.util.List;

import com.salim.vo.Code;

public interface CodeDao {
	
	//코드 조회하기
	List<Code> selectCode(String collection);
	
	//코드 아이디로 조회하기
	Code selectCodeById(int id);
}
