package com.salim.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.impl.TestDaoImpl;

@Service
public class TestServiceImpl {
	@Autowired
	private TestDaoImpl dao;
	
	public String time(){
		return dao.time();
	}
}
