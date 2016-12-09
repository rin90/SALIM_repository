package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.MemberDao;
import com.salim.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSessionTemplate session; //session을 주입
	
	private String makeSqlId(String id)
	{
		return "memberModule.member."+id;
	}
	@Override
	public int insertMember(Member member) {
		System.out.println("insertMember");
		return session.insert(makeSqlId("insertMember"),member);
	}

	@Override
	public int updateMember(Member member) {

		return session.update(makeSqlId("updateMember"),member);
	}

	@Override
	public int deleteMember(String memberId) {
		
		return session.delete(makeSqlId("deleteMember"),memberId);
	}

	@Override
	public int joinMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public Member selectMemberById(String memberId)
	{
		return session.selectOne(makeSqlId("selectMemberById"),memberId);
	}
	@Override
	public Member selectMemberForIdCheck(String memberId) {
		
		return session.selectOne(makeSqlId("idCheck"),memberId);
	}
	
	@Override
	public Member selectMemberByEmail(String email) {
		return session.selectOne(makeSqlId("selectMemberByEmail"),email);
	
	}
	
	

}
