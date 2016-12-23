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
		if(error.hasErrors())
		{
			map.addAttribute("joinFail","회원가입을 실패했습니다.  가입 조건을 확인하세요!");
			return "/body/join_form.jsp";
		}
		
		if(service.joinMember(member,map).equals("fail")) 
		{
			return "/body/join_form.jsp";
		}
		
		return "/body/join_success.jsp"; 
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
		idCheckMap.put("flag", flag); 
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
		service.leaveMember(memberId); 
		
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
				return "redirect:/collection/findAllCollectionList.do"; 
			}else
			{
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
	
	
	//회원 정보 수정
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute @Valid MemberModifyCheck member, 
			HttpSession session)
	{
	
		service.modifyMember(member);
		session.setAttribute("login_info", member);
		
		return "redirect:/myInfo_modify.do"; //이걸 왜 해? 읭 .... 회원 정보 수정 페이지로 그냥 가면 되는데..?
	}
	
	//아이디 찾기 -끝
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,String> findId(String email)
	{
		HashMap<String,String> hmap=new HashMap<String,String>();
			Member member=service.findMemberByEmail(email); 
			if(member!=null)
			{	
				String id=member.getMemberId();
				hmap.put("id", id);
			}else{
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
				String pass=member.getPassword().substring(0, 4); 
				for(int i=4; i<member.getPassword().length(); i++) 
				{
					pass=pass+"*"; 
				}
				System.out.println(pass);
				hmap.put("password", pass);
			
			}else //이메일이 일치하지 않는 경우
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
