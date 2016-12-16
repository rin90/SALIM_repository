package com.salim.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.salim.dao.CollectionDao;
import com.salim.dao.MemberDao;
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
	
	@Autowired
	private MemberDao memdao;
	@Override
	public String findCollectionSeq() {
		return dao.selectCollectionSeq();
	}
	

	public void addCollection(Collect collection, Member m)
	{
		System.out.println("addCollection"+collection);
		 dao.insertCollection(collection); //가계부 추가 부분
		 
		 	HashMap<String,String> map=new HashMap<String,String>();
			
				//가계부가 추가 되었다. 'ㅅ' 
				
				map.put("memberId",m.getMemberId());
				map.put("collectionId", collection.getCollectionId());
				map.put("invite","false");
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
	
	public String modifyCollection(Collect collect,String memberIdforGrant)
	{
		//1. memberIdforGrant를 비교해야되니까.
		Collect dbCollect=new Collect();
		Member member=new Member();
		

		dbCollect=dao.selectCollectionByCollectionId(collect.getCollectionId());
		
		
		if(memberIdforGrant.equals(dbCollect.getGrantId()))
		{
			//권한 있는 사람 - 수정 가능
			dao.updateCollection(collect);
		}
		else
		{
			//권한 없는 사람의 접근
			return "접근 권한이 없습니다.";
		}
		return "";
	}
	
	//가계부 삭제 부분
	
	public int removeCollection(String collectionId)
	{
		int num=mncdao.deleteMemberNCollectionByCollectionId(collectionId);
		
		if(num==1) //부모 테이블의 row 삭제 성공 시
		{
			return dao.deleteCollectionByCollectionId(collectionId); 
		}else
		{
			System.out.println("부모 테이블이 삭제가 안 되었다.");
			return 0;
		}
	}
	
}















