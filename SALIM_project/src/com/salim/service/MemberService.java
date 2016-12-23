package com.salim.service;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.salim.dao.MemberDao;

import com.salim.vo.Member;


@Service
public interface MemberService {

	//MemberService 
	//회원 가입 -join
	public String joinMember(Member member,ModelMap map)/*throws IOException*/;
	
	//회원 탈퇴 -leave
	public void leaveMember(String memberId);
	
	//회원 수정- modify
	
	//로그인 -login
	public HashMap<String, Object> loginMember(HashMap<String, String> map);
	

	
	//회원 1사람 id로 조회
	public Member findMemberById(String memberId);
	
	//아이디 중복 체크
	public boolean findMemberForIdCheck(String memberId);
	
	//이메일 중복 체크
	public boolean findMemberForEmailCheck(String email);

	//회원 1사람 email로 조회
	public Member findMemberByEmail(String email);

	//회원 정보 수정
	public void modifyMember(Member member);
	
	
}
