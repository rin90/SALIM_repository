package com.salim.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CollectionDao;
import com.salim.vo.Collect;

@Repository
public class CollectionDaoImpl implements CollectionDao{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSql(String sql)
	{
		return "collections."+sql;
	}
	private String makeSqlmemberNCollection(String sql)
	{
		return "memberNCollection."+sql;
	}
	@Override
	public String selectCollectionSeq() { // 그룹 가계부 이름 생성
		// TODO Auto-generated method stub
		return session.selectOne(makeSql("selectSequence"));
		
	}

	@Override
	public void insertCollection(Collect collection) { 
		// TODO Auto-generated method stub
		session.selectOne(makeSql("insertCollection"),collection);
	}
	

	
	public List<Collect> selectCollectionByMemberId(String memberId)
	{
		return session.selectList(makeSql("selectCollectionByMemberId"),memberId);
	}
	public Collect selectCollectionByCollectionId(String collectionId)
	{
		return session.selectOne(makeSql("selectCollectionByColletionId"),collectionId);
	}

}
