package com.salim.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CodeDao;
import com.salim.vo.Code;

@Repository
public class CodeDaoImpl implements CodeDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Code> selectCode(String collection) {
		return session.selectList("codeMapper.selectCode", collection);
	}

	@Override
	public Code selectCodeById(int id) {
		return session.selectOne("codeMapper.selectCodeById", id);
	}
	
	
}
