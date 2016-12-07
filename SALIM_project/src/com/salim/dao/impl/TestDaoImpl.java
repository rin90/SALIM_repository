package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDaoImpl{
	
	@Autowired
	private SqlSessionTemplate session;
	
	public String time(){
		return session.selectOne("testMapper.time");
	}
}
