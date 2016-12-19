package com.salim.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public void updateCollection(Collect collect)
	{
		session.update(makeSql("updateCollection"),collect);
	}
	
	public int deleteCollectionByCollectionId(String collectionId)
	{
		return session.delete(makeSql("deleteCollectionByCollectionId"),collectionId);
	}
	
	//그룹조회(collect) - memberId, invite로..
	public List<Collect> selectByMemberIdNInvite(String memberId){
		return session.selectList(makeSql("selectByMemberIdNInvite"), memberId);
	}
	
	//로그인 성공했을 때, 내가 속한 가계부 or 초대된 가계부 정보 보여주는 부분 처리
	public List<Collect> selectCollectionListIncludedOrInvited(HashMap<String, String> map)
	{
		return session.selectList(makeSql("selectCollectionListIncludedOrInvited"),map);
	}
}
