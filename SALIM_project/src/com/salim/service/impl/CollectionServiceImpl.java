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
	
	public String removeCollection(String collectionId, String memberIdforGrant)
	{
		System.out.println("removeCollection:    "+collectionId);
		
		Collect dbCollect=new Collect();
		
		dbCollect=dao.selectCollectionByCollectionId(collectionId);
		
		if(memberIdforGrant.equals(dbCollect.getGrantId()))
		{
			//권한 있는 사람 - 수정 가능
			List<MemberNCollection> list=new ArrayList<MemberNCollection>();
			list=mncdao.selectAllByCollectionId(collectionId);
			if(list!=null) //부모 테이블이 있는 경우
			{
				mncdao.deleteMemberNCollectionByCollectionId(collectionId);// 부모 테이블 지우고
				System.out.println("부모 테이블 삭제함");
				dao.deleteCollectionByCollectionId(collectionId);
			}else
			{
				System.out.println("부모 테이블이 없는 경우?");
				dao.deleteCollectionByCollectionId(collectionId);
			}
			
		}
		else
		{
			//권한 없는 사람의 접근
			return "접근 권한이 없습니다.";
		}
		
		//무조건 있는게 아니라서??라고 생각했는데 무조건 부모테이블은 1개 있음 그룹을 생성한 사람의 정보는 무조건 1row 저장된다. 하 ㅠㅠ 있는 경우와 없는 경우를 나눠서 해야 함 ㅠㅠㅠㅠㅠ 하..
		
		return "";
		
	}
	
	//나중에 조인으로 처리해야할 메서드 일단은 그냥 함 ㄱㄱ
	public String findEmailForMemberInvited(String email, String memberId, String collectionId)
	{
		//1.멤버가 -> 'ㅅ' 권한이 있는지
		//있다면 -> 입력한 이메일이 있는지  -> 있을 경우 -> 입력한 이메일에 해당하는 맴버 아이디와 콜랙션 아이디로 => 이미 초대했거나 최종 최대된 회원인지를! 확인.
		
		System.out.println("검증하는 메서드인데ㅡ,"+email+"/"+memberId+"/"+collectionId);
		Member member=new Member();
		Collect collection=new Collect();
		collection=dao.selectCollectionByCollectionId(collectionId); // collectionId로 collection에 접근해서, 권한이 있는 지 확인....
		if(memberId.equals(collection.getGrantId())) //권한이 있는 사람인지 확인
		{
			member=memdao.selectMemberByEmail(email); //입력한 이메일로 회원을 가져왔고,

			if(member!=null) //회원이 있는 경우 
			{
				//여기서 다시 나뉘어야 한다
				MemberNCollection mnc=new MemberNCollection(); //중간 테이블 접근!
				HashMap<String,String> map=new HashMap<String,String>(); //왜 map을 이용했니?
				map.put("memberId", member.getMemberId());
				map.put("collectionId", collectionId);
				
				mnc=mncdao.selectByMemberIdAndCollectionId(map);
				
				System.out.println(mnc);
				if(mnc==null)
				{
					return email+"님께 초대 메시지를 보냈습니다.";
				}else
				{
					return "이미 초대한 회원입니다.";
				}
			}else{ //입력한 회원이 없는 경우
				return "이메일을 찾을 수 없습니다.";
			}
		}else //멤버 초대할 권한이 없는 경우
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
			System.out.println("회원 초대하는 부분 끝남 inviteMemberInCollection();");
		}
		
	}

	
	//그룹 목록 조회 memberId, invite로 조회한 그룹 목록 뿌려주기
	public List<Collect> selectByMemberIdNInvite(String memberId){
		return dao.selectByMemberIdNInvite(memberId);
	}
	
}












