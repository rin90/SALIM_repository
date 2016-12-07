package com.salim.service;

import java.util.List;

import com.salim.vo.Code;

public interface CodeService {
	
	//코드 조회
	List<Code> findCode(String collection);
	
	//코드 id로 조회
	Code findCodeById(int id);
}
