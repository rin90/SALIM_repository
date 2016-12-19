package com.salim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.salim.vo.Collect;

public interface CollectionDao {

	//collection Id를 만들 sequence값 뽑기
	public String selectCollectionSeq();
	//그룹 가계부 추가
	public void insertCollection(Collect collection);

	//그룹 가계부 조회 - 아이디
	public List<Collect> selectCollectionByMemberId(String memberId);
	
	public Collect selectCollectionByCollectionId(String collectionId);
	
	public void updateCollection(Collect collect);
	
	public int deleteCollectionByCollectionId(String collectionId);
	
	//그룹 가계부 조회 - 아이디, 초대수락여부
	List<Collect> selectByMemberIdNInvite(String memberId);//memberId, invite

	//로그인 성공했을 때, 내가 속한 가계부 or 초대된 가계부 정보 보여주는 부분 처리
	public List<Collect> selectCollectionListIncludedOrInvited(HashMap<String, String> map);
}
