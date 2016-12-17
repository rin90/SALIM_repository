package com.salim.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.impl.CollectionServiceImpl;
import com.salim.service.impl.MemberServiceImpl;
import com.salim.vo.Collect;
import com.salim.vo.Member;

@Controller
@RequestMapping("/collection")
public class CollectController {

	@Autowired
	private CollectionServiceImpl service;
	@Autowired
	private MemberServiceImpl memberService;


	//가계부 추가 
	@RequestMapping("/collection_add.do")
	public String collectionAdd(String collectionName, String collectionIntro, HttpSession session)
	{
		//일단 요청파라미터를 VO로 안 받고 매개변수로 받기!
		
		Member m=(Member)session.getAttribute("login_info");
		String collectionId=service.findCollectionSeq();
		Collect collect=new Collect(collectionId, collectionName, collectionIntro, m.getMemberId());
		service.addCollection(collect,m);
		return "redirect:/collection/findAllCollectionList.do"; //로그인 성공페이지로 일단 ㄱㄱ 
	}

	//이건 main화면을 뿌려줄 때 사용할 컨트롤러인데,! - 돌아간다! 야호~ 'ㅅ'
	@RequestMapping("/findAllCollectionList.do")
	public String collectShow(HttpSession session, ModelMap map)
	{
		
		Member m=(Member)session.getAttribute("login_info");
		System.out.println(m.getMemberId());
		List<Collect> collectionList=new ArrayList<Collect>();	
		try {
			collectionList=service.findCollectionByMemberId(m.getMemberId());
			System.out.println(collectionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("collectionList가 없음!!ㄷㄷ");
		}
		
		map.addAttribute("collectionList", collectionList);
		return "body/login_success.tiles";
	}
	
	@RequestMapping("/setSession.do")
	public String setSession(HttpSession session , String collectionId)
	{
		//요청 파라미터 받은 뒤, 디비에서 받아와야겟다,
		Collect collect=new Collect();
		try {
			collect=service.findCollectionByCollectionId(collectionId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("collection이 값이 없음...ㄷㄷ");
		}

		session.setAttribute("group_info",collect);
		return "redirect:/household/login/incomeSelect.do";
	}


	//가계부 수정하기.
	@RequestMapping(value="/collectionModify.do",method=RequestMethod.POST)
	public String collectionModify(HttpSession session,String memberIdforGrant, @ModelAttribute Collect collect, ModelMap map)
	{
		//1. bussiness 로직으로 입력 받은 memberId 가 collection 테이블의 grantId인지 체크한 다음 
		// 맞으면 수정, 틀리면 ajax로 화면에 alert 창 띄우고 'ㅅ' 그럼 되겠다.
	
		//1.memberIdforGrant가 참/거짓 
		System.out.println("수정!!!!!!!!!!!!!!!");
		String grantMessage=service.modifyCollection(collect, memberIdforGrant);
		if(!grantMessage.equals(""))
		{
			map.addAttribute("grantMessage",grantMessage);
		}
		else
		{
			session.setAttribute("group_info", collect);
		}
		System.out.println("grantMessage =  "+grantMessage);
		
		return "body/collection/setting/settings/collectionSettingMain.tiles";
	}
	
	//그룹 가계부 삭제하기
	@RequestMapping(value="/removeCollection.do",method=RequestMethod.POST)
	public String removeCollection(HttpSession session,String memberIdforGrant, @ModelAttribute Collect collect, ModelMap map)
	{
		
		System.out.println("삭제!!!!!!!!!!!!!");
	
		String str=service.removeCollection(collect.getCollectionId(),memberIdforGrant);
		if(str.equals(""))
		{
			session.removeAttribute("group_info");
			return "redirect:/invite.do";
		}else
		{
			map.put("deletefailMessage", str);
			return "body/collection/setting/settings/collectionSettingMain.tiles";
		}
		
		
	}
	
	
	//emailcheck - ajax 처리
	@RequestMapping("/emailCheck.do")
	@ResponseBody
	public HashMap<String,String> emailCheckAjax(String emailMessage, String memberId, String collectionId)
	{
		System.out.println("아작스 처리 부분");
		HashMap<String,String> map=new HashMap<String,String>();	
		String emailCheckMessage=service.findEmailForMemberInvited(emailMessage,memberId,collectionId);
		System.out.println("emailCheckMessage:=> "+emailCheckMessage);
		map.put("emailCheckMessage",emailCheckMessage);
		return map;
	}
	
	//초대하기
	@RequestMapping(value="/inviteMember.do", method=RequestMethod.POST)
	public String inviteMember(String email, String collectionId, ModelMap map)
	{
		//2.비지니스 로직 호출! 'ㅅ'
		System.out.println("inviteMember()"+email+collectionId);
		if(!(email==null||email.equals("")))
		{
			service.inviteMemberInCollection(email, collectionId);
			//return "body/collection/setting/settings/inviteMember_form.tiles";	
			//return "redirect:/invite.do";
		}else
		{
			map.addAttribute("inviteMessage", "해당하는 이메일이 없습니다.");
			//return "body/collection/setting/settings/inviteMember_form.tiles";
		}
		return "redirect:/invite.do";
	}
	
	
	
	
	//상단의 select바로 이동하는 것
	@RequestMapping("/moving.do")
	public String moving(String selectId, HttpSession session){

		Collect collect = null;
		try {
			collect = service.findCollectionByCollectionId(selectId);
			if(collect == null){
				session.removeAttribute("group_info");
			}else{
				session.setAttribute("group_info", collect);
			}
		} catch (Exception e) {
			session.removeAttribute("group_info");
		}

		return "redirect:/household/login/incomeSelect.do";
	}
		
}
