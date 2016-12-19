package com.salim.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.MemberNCollectionDao;
import com.salim.vo.Member;
import com.salim.vo.MemberNCollection;

@Repository
public class MemberNCollectionDaoImpl implements MemberNCollectionDao{

	@Autowired
	private SqlSessionTemplate session;
	public String makeSql(String sql)
	{
		return "memberNCollection."+sql;
	}
	public void insertmemberNCollection(MemberNCollection collection)
	{
		 session.insert(makeSql("insertmemberNCollection"),collection);
	}
	
	public int deleteMemberNCollectionByCollectionId(String collectionId)
	{
		return session.delete(makeSql("deleteMemberNCollectionByCollectionId"),collectionId);
	}
	
	public MemberNCollection selectByMemberIdAndCollectionId(HashMap<String,String> map)
	{
		return session.selectOne(makeSql("selectByMemberIdAndCollectionId"), map);
	}
	
	public List<MemberNCollection> selectAllByCollectionId(String collectionId)
	{
		return session.selectList(makeSql("selectAllByCollectionId"),collectionId);
	}	
	
	public List<Member>selectAllCollectionMemberListByCollectionId(HashMap<String,String> map)
	{
		return session.selectList(makeSql("selectAllCollectionMemberListByCollectionId"),map);
	}
	
	public void updateByMemberIdAndCollectionId(HashMap<String,String> map)
	{
		session.update(makeSql("updateByMemberIdAndCollectionId"), map);
	}
	
	public void deleteMemberCollection(HashMap<String, String>map)
	{
		session.delete(makeSql("deleteMemberCollection"),map);
	}
}
