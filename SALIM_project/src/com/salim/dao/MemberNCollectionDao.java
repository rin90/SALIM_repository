package com.salim.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.salim.vo.Member;
import com.salim.vo.MemberNCollection;

public interface MemberNCollectionDao {

	
	public void insertmemberNCollection(MemberNCollection collection);

	public int deleteMemberNCollectionByCollectionId(String collectionId);
	
	public MemberNCollection selectByMemberIdAndCollectionId(HashMap<String,String> map);
	
	public List<MemberNCollection> selectAllByCollectionId(String collectionId);
	//멤버 아이디로 그룹 가계부의 회원들 조회하기
	public List<Member>selectAllCollectionMemberListByCollectionId(HashMap<String,String> map);
	
	public void updateByMemberIdAndCollectionId(HashMap<String,String> map);
}

