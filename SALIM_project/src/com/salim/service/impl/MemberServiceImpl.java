package com.salim.service.impl;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.salim.dao.MemberDao;

import com.salim.service.MemberService;
import com.salim.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberdao;
	
	//회원가입 모듈
	@Override
	//@Transactional(rollbackFor={IOException.class})
	public void joinMember(Member member)/*throws IOException*/ { 
		System.out.println("joinMember");
		//요청파라미터로 받아와서 member가 넘어올꺼니까 그냥 member로 받음
		memberdao.insertMember(member); //Business logic 처리
	}
	
	//회원 탈퇴
	public void leaveMember(HashMap<String, String> map) 
	{
		String id=map.get("memberId");
		String pw=map.get("password");
		
		//여기서 findMemberById()호출하고, 비밀번호 체크해서! 'ㅅ' 탈퇴시키기
		System.out.println("지울거지만, id, pw 잘 들어온건지 체크"+id+","+pw);
		
		Member member = new Member();
		member=findMemberById(id);
		System.out.println(member);
		if(member!=null)
		{
		
			System.out.println("member를 잘 받아왔다,");
			if(member.getPassword().equals(pw))
			{
				memberdao.deleteMember(id);
			}
			else
			{
				System.out.println("비밀번호가 틀렸는데, 이걸 나중에 어떻게 바꿀까낭~");
			}
		}
		
	
	}
	
	//회원 조회
	public Member findMemberById(String memberId)
	{
		Member member=null;
		member=memberdao.selectMemberById(memberId);
		return member;
	}
	
	//로그인 
	public HashMap<String, Object> loginMember(HashMap<String, String> map)
	{
		String id=map.get("memberId");
		String pw=map.get("password");
		
		//여기서 findMemberById()호출하고, 비밀번호 체크해서! 'ㅅ' 탈퇴시키기
		//System.out.println("지울거지만, id, pw 잘 들어온건지 체크"+id+","+pw);
		HashMap <String,Object> sendMap=new HashMap<String,Object>();
		Member member = new Member();
		member=findMemberById(id);
		System.out.println(member);
		
		if(member!=null)
		{
			sendMap.put("member", (Member)member);
			System.out.println("member를 잘 받아왔다,");
			if(member.getPassword().equals(pw))
			{
				sendMap.put("memberFlag", (boolean)true);
			}
			else
			{
				//비밀번호가 잘못된 경우!
			}
		}
		System.out.println("로그인 : loginMember()");
		return sendMap;
	}

	//아이디 중복 체크 서비스!
	@Override
	public boolean findMemberForIdCheck(String memberId) {
		
		Member member=memberdao.selectMemberForIdCheck(memberId); 
		if(member==null)
		{
			return true; //중복된 아이디가 없는 경우.
		}

		return false; //중복된 아이디가 있는 경우.
	}

	@Override
	public Member findMemberByEmail(String email) {
		Member member=memberdao.selectMemberByEmail(email);
		return member;
	}
	
	
	
}
