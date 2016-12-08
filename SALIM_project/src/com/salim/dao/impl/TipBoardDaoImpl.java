package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;

import com.salim.vo.TipBoard;

public class TipBoardDaoImpl {
	private SqlSessionTemplate session;
	
	public void insert(TipBoard tipboard){
		session.insert("tipInsert",tipboard);
	};
	
}
