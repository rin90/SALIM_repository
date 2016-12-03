package com.salim.service;

import java.util.List;

import com.salim.vo.Code;

public interface CodeService {
	
	//코드 조회
	List<Code> findCode(String collection);
}
