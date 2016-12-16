package com.salim.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.salim.dao.CollectionDao;
import com.salim.dao.MemberDao;
import com.salim.dao.MemberNCollectionDao;
import com.salim.service.CollectionService;
import com.salim.vo.Collect;
import com.salim.vo.Member;
import com.salim.vo.MemberNCollection;

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
		 
		 MemberNCollection memberNcollection=new MemberNCollection(m.getMemberId(),collection.getCollectionId(),"true");
		 mncdao.insertmemberNCollection(memberNcollection);
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
	
	public String findEmailForMemberInvited(String email, String memberId, String collectionId)
	{
		//1.멤버가 -> 'ㅅ' 권한이 있는지
		//있다면 -> 입력한 이메일이 있는지  -> 있을 경우 -> 입력한 이메일에 해당하는 맴버 아이디와 콜랙션 아이디로 => 이미 초대했거나 최종 최대된 회원인지를! 확인.
		
		System.out.println("검증하는 메서드인데ㅡ,"+email+"/"+memberId+"/"+collectionId);
		Member member=new Member();
		Collect collection=new Collect();
		collection=dao.selectCollectionByCollectionId(collectionId); // 
		
		if(memberId.equals(collection.getGrantId())) //권한이 있는 사람인지 확인
		{
			member=memdao.selectMemberByEmail(email); //입력한 이메일로 회원을 가져왔고,

			if(member!=null) //회원이 있는 경우 
			{
				//여기서 다시 나뉘어야 한다
				MemberNCollection mnc=new MemberNCollection();
				HashMap<String,String> map=new HashMap<String,String>();
				map.put("memberId", memberId);
				map.put("collectionId", collectionId);
				
				mnc=mncdao.selectByMemberIdAndCollectionId(map);
				if(mnc==null)
				{
					return email+"님께 초대 메시지를 보냈습니다.";
				}else
				{
					return "이미 초대한 회원입니다.";
				}
			}else{
				return "이메일을 찾을 수 없습니다.";
			}
		}else
		{
			return "멤버 초대 권한이 없습니다.";
		}
		
	}
	
	//회원 초대!! 'ㅅ' 
	public void inviteMemberInCollection(String email, String collectionId)
	{
		Member member=new Member();
		member=memdao.selectMemberByEmail(email); //회원 아이디 알아내려고...
		if(member!=null)
		{
			MemberNCollection memberNcollection=new MemberNCollection(member.getMemberId(),collectionId,"false");
			mncdao.insertmemberNCollection(memberNcollection);
			System.out.println("아////////////////ㅠㅠ");
		}
	}
}












