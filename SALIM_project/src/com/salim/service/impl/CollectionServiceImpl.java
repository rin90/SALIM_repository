package com.salim.service.impl;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.salim.dao.CollectionDao;
import com.salim.dao.MemberNCollectionDao;
import com.salim.service.CollectionService;
import com.salim.vo.Collect;
import com.salim.vo.Member;

@Service
public class CollectionServiceImpl implements CollectionService{
	
	@Autowired
	private CollectionDao dao;
	
	@Autowired
	private MemberNCollectionDao mncdao;
	
	@Override
	public String findCollectionSeq() {
		return dao.selectCollectionSeq();
	}
	

	public void addCollection(Collect collection,Member m)
	{
		//System.out.println("addCollection"+collection);
		 dao.insertCollection(collection);
		 
		 	HashMap<String,String> map=new HashMap<String,String>();
			
				//가계부가 추가 되었다. 'ㅅ' 
				
				map.put("memberId",m.getMemberId());
				map.put("collectionId", collection.getCollectionId());
				map.put("grantId",m.getMemberId());
				mncdao.insertmemberNCollection(map);
		
	}
	
	
}
