package com.salim.dao;

import com.salim.vo.Collection;

public interface CollectionDao {

	//collection Id를 만들 sequence값 뽑기
	public int selectCollectionSeq();
	
	public void insertCollection(Collection collection);
}