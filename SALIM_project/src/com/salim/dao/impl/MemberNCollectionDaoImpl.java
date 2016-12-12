package com.salim.dao.impl;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.MemberNCollectionDao;

@Repository
public class MemberNCollectionDaoImpl implements MemberNCollectionDao{

	@Autowired
	private SqlSessionTemplate session;
	public String makeSql(String sql)
	{
		return "memberNCollection."+sql;
	}
	public void insertmemberNCollection(HashMap<String, String> map)
	{
		 session.insert(makeSql("insertmemberNCollection"),map);
	}
}
