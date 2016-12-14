package com.salim.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	public List<Collect> findCollectionByMemberId(String memberId) throws Exception
	{
		List<Collect>list=new ArrayList<Collect>();
		list=dao.selectCollectionByMemberId(memberId); //무조건 List 값이 있는게 아님... 여기서 처리를 해야함
		if(list==null)
		{
			//collection이 null인 경우, 
			throw new Exception();
		
		}else
		{
			return list;
		}
	}
	
	public Collect findCollectionByCollectionId(String collectionId) throws Exception
	{
		Collect c=new Collect();
		c= dao.selectCollectionByCollectionId(collectionId);
		if(c==null)
		{
			//collection이 null인 경우, 
			throw new Exception();
		
		}else
		{
			return c;
		}
	}
	
	
}















