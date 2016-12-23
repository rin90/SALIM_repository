package com.salim.service.impl;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

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
import com.salim.vo.validator.MemberModifyCheck;


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
	public String joinMember(Member member,ModelMap map)/*throws IOException*/ { 
		System.out.println("아이디 중복, 이메일 중복,비번 8글자 이상");
		boolean b1=findMemberForIdCheck(member.getMemberId()); //아이디 중복 체크
		boolean b2=findMemberForEmailCheck(member.getEmail());//이메일 중복 체크
		System.out.println(b1 +":"+ b2);
		if((b1==true)&&(b2==true))
		{
			if(member.getPassword().length()>7&&member.getPassword().length()<16)
			{
				memberdao.insertMember(member); //Business logic 처리 - 회원 저장
				return "true";
			}else
			{
				map.addAttribute("joinFail","회원가입을 실패했습니다.  비밀번호 조건을 확인하세요!");
			}
		}
		else
		{
			map.addAttribute("joinFail","이미 사용 중인 아이디 or 이메일을 입력하셨습니다.");
		}
		return "fail";	
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
	
	public String modifyMember(MemberModifyCheck member)
	{
		
		Member modifiedmember=new Member();	//최종으로 들어갈 멤버
		Member tempMember=new Member();//임시 저장
		tempMember=findMemberById(member.getMemberId());
		boolean tempMember2=findMemberForEmailCheck(member.getEmail());
		//일단, 이메일 체크부터 해야한다. 
		//이메일이 기존의 다른 회원의 이메일과 중복이라면 아예 ㄴㄴ, 하지만 그렇지 않은 경우?
		
		//만약에 tempMember의 아이디랑 , 현재 작성한 이메일을 가진 회원의 아이디랑 같은 경우 
		
		if(tempMember2) //받아온 이메일 기준으로 멤버가 있는지 없는 경우!
		{ //이메일 바꿀 수 있음!
		//비밀번호 체크
			if(member.getPassword().equals("")||member.getPassword()==null||member.getPassword().length()<8||member.getPassword().length()>16)
			{
				modifiedmember.setPassword(tempMember.getPassword());
				modifiedmember.setPassword2(tempMember.getPassword());
			}else
			{
				modifiedmember.setPassword(member.getPassword());
				modifiedmember.setPassword2(member.getPassword2());
			}
		
				//생년월일 체크
			if(member.getBirthday()==null)
			{
				modifiedmember.setBirthday(tempMember.getBirthday());
				modifiedmember.setAge(tempMember.getAge());
			}else
			{
				modifiedmember.setBirthday(member.getBirthday());
				modifiedmember.setAge(member.getAge());
			}
			if(member.getEmail()==null)
			{
				modifiedmember.setEmail(tempMember.getEmail());
			}else
			{
				modifiedmember.setEmail(member.getEmail());
			}
			
			modifiedmember.setMemberId(member.getMemberId());
			
			if(member.getName()==null)
			{
				modifiedmember.setName(tempMember.getName());
			}else
			{
				modifiedmember.setName(member.getName());
			}
			
			modifiedmember.setName(member.getMemberId());
			
		}else{ //받아온 이메일을 기준으로 멤버가 있는 경우인데, 이때, 다른 사람이랑 같은 경우가 있고, 내 아이디랑 같은 경우가 있음!
			
			if(tempMember.getEmail().equals(member.getEmail())) //이메일이 같은 경우 ㅇㅋㅇ
			{
				if(member.getPassword().equals("")||member.getPassword()==null||member.getPassword().length()<8||member.getPassword().length()>16)
				{
					modifiedmember.setPassword(tempMember.getPassword());
					modifiedmember.setPassword2(tempMember.getPassword());
				}else
				{
					modifiedmember.setPassword(member.getPassword());
					modifiedmember.setPassword2(member.getPassword2());
				}
			
					//생년월일 체크
				if(member.getBirthday()==null)
				{
					modifiedmember.setBirthday(tempMember.getBirthday());
					modifiedmember.setAge(tempMember.getAge());
				}else
				{
					modifiedmember.setBirthday(member.getBirthday());
					modifiedmember.setAge(member.getAge());
				}
				if(member.getEmail()==null)
				{
					modifiedmember.setEmail(tempMember.getEmail());
				}else
				{
					modifiedmember.setEmail(member.getEmail());
				}
				
				modifiedmember.setMemberId(member.getMemberId());
				
				if(member.getName()==null)
				{
					modifiedmember.setName(tempMember.getName());
				}else
				{
					modifiedmember.setName(member.getName());
				}
				
				modifiedmember.setName(member.getMemberId());
			}
			else
			{
				return "이미 사용중인 이메일입니다.";
			}
			
			
		}
		
		//이름 추가.
		modifiedmember.setName(member.getName());
		
		/*BeanUtils.copyProperties(member,resultMember);
		System.out.println("resultMember"+resultMember);
		*/
		//memberdao.updateMember(modifiedmember);
		return null;
	}
	
	
}
