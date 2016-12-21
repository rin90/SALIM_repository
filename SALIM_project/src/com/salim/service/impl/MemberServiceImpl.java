package com.salim.service.impl;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.salim.dao.BankDao;
import com.salim.dao.BudgetDao;
import com.salim.dao.CardDao;
import com.salim.dao.ExpenseDao;
import com.salim.dao.GoalDao;
import com.salim.dao.IncomeDao;
import com.salim.dao.MemberDao;
import com.salim.dao.NotesDao;
import com.salim.dao.ScheduleDao;
import com.salim.service.MemberService;
import com.salim.vo.Member;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberdao;
	@Autowired
	private CardDao carddao;
	@Autowired
	private BudgetDao budgetdao;
	@Autowired
	private BankDao bankdao;
	@Autowired 
	private ScheduleDao scheduledao;
	@Autowired 
	private GoalDao  goaldao;
	@Autowired
	private NotesDao notesdao;
	@Autowired
	private IncomeDao incomedao;
	@Autowired
	private ExpenseDao expensedao;
	
	
	//회원가입 모듈
	@Override
	//@Transactional(rollbackFor={IOException.class})
	public String joinMember(Member member)/*throws IOException*/ { 
		System.out.println("joinMember");
		//여기서 검증이 필요했던 것..ㄷㄷ
		boolean b1=findMemberForIdCheck(member.getMemberId()); //아이디 중복 체크
		boolean b2=findMemberForEmailCheck(member.getEmail());//이메일 중복 체크
		System.out.println(b1 +":"+ b2);
		if(b1&&b2)
		{
			memberdao.insertMember(member); //Business logic 처리 - 회원 저장	
			return "";
		}else
		{
			return "회원 가입 정보를 다시 확인하세요.";
		}
	}
	
	//회원 탈퇴
	@Override
	public void leaveMember(String memberId) 
	{
		memberdao.deleteMember(memberId);
		carddao.deleteCardByMemberId(memberId);
		budgetdao.deleteBudgetBymemberId(memberId);
		bankdao.deleteBankByMemberId(memberId);
		scheduledao.deleteScheuldeBasedMemberId(memberId);
		goaldao.deleteScheuldeBasedMemberId(memberId);
		notesdao.deleteNotes(memberId);
		incomedao.deleteIncomeByMemberId(memberId);
		expensedao.deleteExpenseByMemberId(memberId);
	}
	
	//회원 조회
	@Override
	public Member findMemberById(String memberId)
	{
		Member member=new Member();
		member=memberdao.selectMemberById(memberId);
		return member;
	}
	
	//로그인 
	@Override
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
		
		Member member=new Member();
		member=memberdao.selectMemberForIdCheck(memberId); 
		System.out.println("findMemberForIdCheck"+member);
		if(member==null)
		{
			return true; //중복된 아이디가 없는 경우.  -사용가능
		}

		return false; //중복된 아이디가 있는 경우. - 사용 불가능
	}

	//이메일 중복 체크 서비스!
	@Override
	public boolean findMemberForEmailCheck(String email)
	{
		Member member=new Member();
		member=memberdao.selectMemberByEmail(email);
		System.out.println("selectMemberByEmail"+member);
		if(member==null)
		{
			return true; //중복된 이메일이 없는 경우
		}
		return false; //중복된 이메일이 있는 경우
	}
	
	//이메일로 회원 조회
	@Override
	public Member findMemberByEmail(String email) {
		Member member=new Member();
		member=memberdao.selectMemberByEmail(email);
		
		return member;
	}
	
	public void modifyMember(Member member)
	{
		memberdao.updateMember(member);
	}
	
	
}
