package com.salim.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.salim.vo.Collect;
import com.salim.vo.Member;

public interface CollectionService {

	//sequence값 받아오기.
	public String findCollectionSeq();
	
	public void addCollection(Collect collection, Member m);
	
	public List<Collect> findCollectionByMemberId(String memberId) throws Exception;
	
	public Collect findCollectionByCollectionId(String collectionId)throws Exception;

	public String modifyCollection(Collect collect,String memberIdforGrant);

	public String removeCollection(String collectionId, String memberIdforGrant);
	
	//멤버 초대 시, 입력한 이메일이 있는지 회원으로 체크.
	public String findEmailForMemberInvited(String email, String memberId, String collectionId);

	public void inviteMemberInCollection(String email, String collectionId);
	
	//memberId와 invite로 조회한 collection 객체 목록
	List<Collect> selectByMemberIdNInvite(String memberId);
	
	public void showInviteSettingMemberList(ModelMap map,Collect collect);
	//로그인 성공 시, 소속된 그룹이 어디인지, 초대된 그룹이 어디인지를 처리하는 메서드
	public void findCollectionListIncludedOrInvited(ModelMap map, String memberId);
	
	//그룹 가계부 수락-거절 버튼을 눌럿을 경우 처리하는 메서드 
	public void modifyByMemberIdAndCollectionId(String collectionId, String memberId, String invite);
}
