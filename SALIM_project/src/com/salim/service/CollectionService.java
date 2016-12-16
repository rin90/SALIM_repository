package com.salim.service;

import java.util.List;

import com.salim.vo.Collect;
import com.salim.vo.Member;

public interface CollectionService {

	//sequence값 받아오기.
	public String findCollectionSeq();
	
	public void addCollection(Collect collection, Member m);
	
	public List<Collect> findCollectionByMemberId(String memberId) throws Exception;
	
	public Collect findCollectionByCollectionId(String collectionId)throws Exception;

	public String modifyCollection(Collect collect,String memberIdforGrant);

	public int removeCollection(String collectionId);
	
	//멤버 초대 시, 입력한 이메일이 있는지 회원으로 체크.
	public String findEmailForMemberInvited(String email, String memberId, String collectionId);

	public void inviteMemberInCollection(String email, String collectionId);
	
}
