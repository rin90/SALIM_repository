package com.salim.dao;

import com.salim.vo.Collect;

public interface CollectionDao {

	//collection Id를 만들 sequence값 뽑기
	public String selectCollectionSeq();
	
	public void insertCollection(Collect collection);
}
