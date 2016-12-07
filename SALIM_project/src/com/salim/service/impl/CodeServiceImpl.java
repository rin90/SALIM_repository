package com.salim.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.CodeDao;
import com.salim.service.CodeService;
import com.salim.vo.Code;

@Service
public class CodeServiceImpl implements CodeService{
	
	@Autowired
	private CodeDao dao;

	@Override
	public List<Code> findCode(String collection) {
		return dao.selectCode(collection);
	}

	@Override
	public Code findCodeById(int id) {
		return dao.selectCodeById(id);
	}
	
	
	
}
