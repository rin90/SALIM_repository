package com.salim.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.MemberService;
import com.salim.service.impl.MemberServiceImpl;
import com.salim.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService service; //MemberService 타입으로 만드는거 맞나?
	
	//회원 가입
	@RequestMapping("join.do")
	public String join(@ModelAttribute Member member) //요청파라미터를 vo 객체로 생성하고, request에 자동 저장
	{
		//여기서 validator 검증을 해야함!
		System.out.println(member);
		service.joinMember(member); //여기까진 잘 온당..ㅎㅎ
		//return "/body/join_success.tiles";
		return "body/join_success.tiles"; //잘 간다.
	}
	
	
	//아이디 중복 체크 - ajax 처리
	//<!-- ajax-->
	@RequestMapping("idDueCheck.do")
	@ResponseBody
	public HashMap<String,Boolean> idDueCheck(String memberId)
	{
		System.out.println("hello1");
		//business logic을 불러서 처리를 하고, 
		System.out.println(memberId);
		boolean flag=service.findMemberForIdCheck(memberId);
		System.out.println(flag);
		HashMap<String,Boolean> idCheckMap=new HashMap<String, Boolean>();
		
		idCheckMap.put("flag", flag); //이 부분은 VO가 없어서 map의 형태로 만들어준 부분이다!
		return idCheckMap;
	}
	
	//회원 탈퇴
	@RequestMapping("leave.do")
	public String leaveMember(String memberId, String password)
	{
		 //1.요청파라미터 받기
		
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("password", password);
		
		//2.비지니스 로직 호출! - 아이디로 멤버 한 row 있는지 알아보고, 'ㅅ' 그다음 해야겠다 그러니까 그 회원이 있는지 체크해야하네!?
		service.leaveMember(map);
		//3.응답 페이지로 이동- 단순 페이지 이동하기!
		return "/WEB-INF/view/member/view.jsp";
		
	}
	
	//로그인 
	@RequestMapping("login.do")
	public String login(String memberId, String password , HttpSession	session)
	{
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("password", password);
		System.out.println("로그인 : "+memberId+","+password);
		
		HashMap<String,Object> sendMap=new HashMap<String,Object>();
		boolean memberFlag=false; //회원인지 아닌지 확인하고,
		sendMap=service.loginMember(map);
		
		if((boolean)sendMap.get("memberFlag"))
		{
			System.out.println("session 달기 ");
			Member m=(Member)sendMap.get("member");
			System.out.println(m);
			session.setAttribute("login_info", (Member)sendMap.get("member"));
			return "body/login_success.tiles";
		}
		//회원인 경우 - login 성공페이지로 이동, session에 login_info라는 이름으로 걸어둔다.
		//회원이 아닌 경우 - 회원 가입 유도
		//아이디 비밀번호가 틀린경우 - 아이디 비번 재입력 유도
		
		return "/WEB-INF/view/member/login_form.jsp";
	}

	//로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/main.do";
	}
	
	//마이페이지는 일단 단순 view 이동으로 처리함
	
	//회원 정보 수정
	@RequestMapping("modify.do")
	public String modifyMember()
	{
		//회원 정보 수정 
		//요청 파라미터를 읽어온다.
		//원래는 검증하고~??
		//2.business logic 호출
		//3.결과 응답!
		return null;
	}
}
