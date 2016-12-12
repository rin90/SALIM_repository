package com.salim.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.CollectionDao;
import com.salim.service.CollectionService;
import com.salim.vo.Collection;

@Service
public class CollectionServiceImpl implements CollectionService{
	
	@Autowired
	private CollectionDao dao;

	@Override
	public String findCollectionSeq() {
		//sequence 조회 후, collectionId 값을 만들어서 리턴해줌!
		int str=dao.selectCollectionSeq();
		return "collectionId"+str;
	}
	
	public void addCollection(Collection collection)
	{
		System.out.println("addCollection"+collection);
		dao.insertCollection(collection);
		
	}
	
	
}
