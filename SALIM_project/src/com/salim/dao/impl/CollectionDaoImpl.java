package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CollectionDao;
import com.salim.vo.Collection;

@Repository
public class CollectionDaoImpl implements CollectionDao{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String sql)
	{
		return "colletion."+sql;
	}

	@Override
	public int selectCollectionSeq() {
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectSequence"));
		
	}

	@Override
	public void insertCollection(Collection collection) {
		// TODO Auto-generated method stub
		session.selectOne(makeSql("insertCollection"),collection);
	}
}
