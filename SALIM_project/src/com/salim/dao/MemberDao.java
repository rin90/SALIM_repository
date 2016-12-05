package com.salim.dao;

import com.salim.vo.Member;

public interface MemberDao {
	
	//회원가입
	int insertMember(Member member);
	
	//회원 정보 수정
	int updateMember(Member member);
	
	//회원탈퇴
	int deleteMember(String memberId);
	
	//회원 로그인 - 메서드 이름이 바뀔 수도 있음 - 바꾸는게 좋을 것 같다.
	int joinMember(Member member);
	
	Member selectMemberById(String memberId);
}
