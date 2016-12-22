package com.salim.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.CollectionService;
import com.salim.service.MemberService;
import com.salim.vo.Collect;
import com.salim.vo.Member;
import com.salim.vo.validator.LoginCheck;
import com.salim.vo.validator.MemberModifyCheck;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service; //MemberService 타입으로 만드는거 맞나?
	@Autowired
	private CollectionService collectionService;
	
	//회원 가입
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid Member member , BindingResult error,ModelMap map) //요청파라미터를 vo 객체로 생성하고, request에 자동 저장
	{
		//검증을 받아서 들어오면!
		System.out.println(member);
		//여기서 validator 검증을 해야함!
		if(error.hasErrors())
		{
			return "/body/join_form.jsp";
		}
		
		String str=service.joinMember(member); //여기까진 잘 온당..ㅎㅎ
		map.addAttribute("joinFail",str);
		return "/body/join_success.jsp"; //잘 간다.
	}
	
	
	//아이디 중복 체크 - ajax 처리
	//<!-- ajax-->
	@RequestMapping("/checkingDuplicatedId.do")
	@ResponseBody
	public HashMap<String,Boolean> checkingDuplicatedId(String memberId)
	{
		System.out.println(memberId);
		boolean flag=service.findMemberForIdCheck(memberId);
		HashMap<String,Boolean> idCheckMap=new HashMap<String, Boolean>();
		idCheckMap.put("flag", flag); //이 부분은 VO가 없어서 map의 형태로 만들어준 부분이다!
		return idCheckMap;
	}
	//이메일 중복 체크- ajax 처리 
	@RequestMapping("/checkingDuplicatedEmail.do")
	@ResponseBody
	public HashMap<String,Boolean> checkingDuplicatedEmail(String email)
	{
		boolean flag=service.findMemberForEmailCheck(email);
		HashMap<String,Boolean> emailCheckMap=new HashMap<String, Boolean>();
		emailCheckMap.put("flag", flag);
		return emailCheckMap;
	}
	
	//비밀번호 입력 체크 - ajax 처리
	@RequestMapping("/passwordCheck.do")
	@ResponseBody
	public HashMap<String,Boolean>passwordCheck(String password, String password2)
	{
		HashMap<String, Boolean>resultMap=new HashMap<String, Boolean>();
		if(!password.equals(password2))
		{
			resultMap.put("passwordResult",false);
		}else
		{
			resultMap.put("passwordResult",true);
		}
		
		if(password.length()<8)
		{
			resultMap.put("passwordResult", false);
		}
		
		return resultMap;
	}
	
	//생일 입력 시 - 나이 자동으로 생성 - ajax 처리
	@RequestMapping("/birthday.do")
	@ResponseBody
	public Map<String,Object> birthdayCheck(String birthday)
	{
		HashMap<String,Object> resultMap=new HashMap<String,Object>();
	 	System.out.println(birthday);
	 	if(birthday instanceof String)
	 	{
	 		System.out.println(true);
	 	}
		int age=Integer.parseInt(birthday.substring(0,4));
		int year=new Date().getYear()+1900;
		resultMap.put("age", year-age);
		return resultMap;
	}

	
	//회원 탈퇴
	@RequestMapping("/leave.do")
	public String leaveMember(String memberId,HttpSession session)
	{
		session.invalidate();
		service.leaveMember(memberId); //member_collection 테이블에서도 삭제해줘야 한다.
		
		return "redirect:/main.do";
		
	}
	
	
	
	
	
	
	
	
	
	
	//로그인 -끝
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@Valid LoginCheck login, BindingResult errors, HttpSession session, ModelMap map)
	{
		if(errors.hasErrors()) //에러가 있는 경우 전달 
		{
			return "/body/login_form.jsp";
		}
		
		Member member= service.findMemberById(login.getMemberId());
		java.util.List<ObjectError> list = errors.getAllErrors();
	      for(ObjectError e : list){
	         System.out.println(e.getObjectName()+" "+e.getDefaultMessage());
	      }
	      
		if(member!=null) 
		{ //해당 member가 있을 경우
			if(login.getPassword().equals(member.getPassword())) //비밀번호 체크
			{
				 session.setAttribute("login_info",member); // 비밀번호가 일치하는 경우 - 로그인 성공
				 
				 //로그인 성공시 회원 아이디로 개인과 그룹 목록 보여줌
				 List<Collect> groupList = collectionService.selectByMemberIdNInvite(member.getMemberId());
				 session.setAttribute("groupList", groupList);
				 System.out.println("그룹  조회......"+groupList);
				 
				return "redirect:/collection/findAllCollectionList.do"; //로그인 성공화면
			}else
			{//비밀번호가 틀린 경우 - 다시 로그인 폼으로 돌아간다.
				map.addAttribute("error", "Password가 틀렸습니다!");
				return "/body/login_form.jsp";
			}
			
		}else //해당 아이디가 없는 경우
		{
			map.addAttribute("error","ID를 찾을 수 없습니다!");
			return "/body/login_form.jsp";
		}
	}

	//로그아웃-끝
	@RequestMapping("/logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/main.do";
	}
	
	//마이페이지는 일단 단순 view 이동으로 처리함
	
	//회원 정보 수정
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute @Valid MemberModifyCheck member, 
			HttpSession session)
	{
		System.out.println(member.getBirthday());
		Member tempMember=null, resultMember=new Member();
		//회원 비밀번호가 공백으로 가면 ""로 값이 들어가니까, 그거 체크해서 공백인 경우
		
		System.out.println(member.getPassword()+member.getPassword2()+"여기 오류?");
		if(member.getPassword().equals("")||member.getPassword()==null)
		{
			System.out.println("password"+member.getPassword());
			tempMember=service.findMemberById(member.getMemberId());
			System.out.println("tempMember"+tempMember);
			member.setPassword(tempMember.getPassword());
			member.setPassword2(member.getPassword());
		}
		
		
		if(member.getBirthday()==null)
		{
			tempMember=service.findMemberById(member.getMemberId());
			member.setBirthday(tempMember.getBirthday());
		}
		
		
		BeanUtils.copyProperties(member,resultMember);
		System.out.println("resultMember"+resultMember);
		service.modifyMember(resultMember);
		session.setAttribute("login_info", resultMember);
		
		return "redirect:/myInfo_modify.do";
	}
	
	//아이디 찾기 -끝
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> findId(String email)
	{
		HashMap<String,Object> hmap=new HashMap<String,Object>();
			Member member=service.findMemberByEmail(email); //member로 받아왔는데, 
			//map.addAttribute("id", member.getMemberId()); //아이디 걸어주기!
			if(member!=null)
			{	
				hmap.put("id", member.getMemberId());
			}else
			{
				hmap.put("emailError","일치하는 이메일 주소가 없습니다.");
			}
		return hmap;
	}
	
	//비밀번호 찾기 -끝
	@RequestMapping(value="/findPassword.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> findPassword(String id, String email, ModelMap map)
	{ 
		HashMap<String,Object> hmap=new HashMap<String,Object>();
		Member member=service.findMemberById(id);
		if(member!=null)//멤버가 있는 경우
		{
			if(member.getEmail().equals(email)) //이메일이 일치하는 경우 - 정상의 경우
			{
				String pass=member.getPassword().substring(0, 4); //0-4까지의 문자들을 temp에 넣기.
				for(int i=4; i<member.getPassword().length(); i++) //총 길이만큼 돌린다.
				{
					pass=pass+"*"; // 결과값 만들기! 이걸 보내줘야 한다.
				}
				System.out.println(pass);
				hmap.put("password", pass);
			
			}else //이메일이 일치하지 않는 경우!
			{
				hmap.put("emailError", "이메일을 잘못입력하셨습니다.");
			}
			
		}else
		{
			//member가 없는 경우
			hmap.put("idError", "아이디를 잘못입력하셨습니다.");
		}
		
		return hmap;
	}
	
}
