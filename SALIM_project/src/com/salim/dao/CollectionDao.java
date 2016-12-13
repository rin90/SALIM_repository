package com.salim.dao;

import java.util.List;

import com.salim.vo.Collect;

public interface CollectionDao {

	//collection Id를 만들 sequence값 뽑기
	public String selectCollectionSeq();
	//그룹 가계부 추가
	public void insertCollection(Collect collection);

	//그룹 가계부 조회 - 아이디
	public List<Collect> selectCollectionByMemberId(String memberId);
	
	public Collect selectCollectionByCollectionId(String collectionId);
}
