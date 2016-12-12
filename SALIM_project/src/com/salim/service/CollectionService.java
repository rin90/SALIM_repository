package com.salim.service;

import com.salim.vo.Collection;

public interface CollectionService {

	//sequence값 받아오기.
	public String findCollectionSeq();
	
	public void addCollection(Collection collection);
}
