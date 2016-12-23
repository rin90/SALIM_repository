package com.salim.controller;

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

import com.salim.dao.impl.MemberNCollectionDaoImpl;
import com.salim.service.impl.CollectionServiceImpl;
import com.salim.service.impl.MemberServiceImpl;
import com.salim.vo.Collect;
import com.salim.vo.Member;
import com.salim.vo.MemberNCollection;

@Controller
@RequestMapping("/collection")
public class CollectController {

	@Autowired
	private CollectionServiceImpl service;
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private MemberNCollectionDaoImpl mncService;

	//가계부 추가 
	@RequestMapping("/collection_add.do")
	public String collectionAdd(String collectionName, String collectionIntro, HttpSession session)
	{
		//일단 요청파라미터를 VO로 안 받고 매개변수로 받기!
		
		Member m=(Member)session.getAttribute("login_info");
		String collectionId=service.findCollectionSeq();
		Collect collect=new Collect(collectionId, collectionName, collectionIntro, m.getMemberId());
		service.addCollection(collect,m);
		List<Collect> groupList = service.selectByMemberIdNInvite(m.getMemberId());
		session.setAttribute("groupList", groupList);
		return "redirect:/collection/findAllCollectionList.do"; //로그인 성공페이지로 일단 ㄱㄱ 
	}

	//이건 main화면을 뿌려줄 때 사용할 컨트롤러-가계부 조회
	@RequestMapping("/findAllCollectionList.do")
	public String collectShow(HttpSession session, ModelMap map)
	{
		System.out.println("문제의 /findAllCollectionList.do");
		Member m=(Member)session.getAttribute("login_info"); //로그인 한 사람 session에 추가 
		System.out.println(m.getMemberId());
		service.findCollectionListIncludedOrInvited(map, m.getMemberId());
		return "body/login_success.tiles";
	}
	//그룹 가계부 수락
	@RequestMapping("/okay.do")
	public String inviteOkay(String collectionId, String memberId, HttpSession session)
	{
		
		System.out.println("수락");
		service.modifyByMemberIdAndCollectionId(collectionId,memberId,"true");
		List<Collect> groupList = service.selectByMemberIdNInvite(memberId);
		session.setAttribute("groupList", groupList);
		return "redirect:/collection/findAllCollectionList.do";
	}
	
	//그룹 가계부 거절
	@RequestMapping("/refusal.do")
	public String inviteRefusal(String collectionId, String memberId)
	{
		System.out.println("거절");
		service.modifyByMemberIdAndCollectionId(collectionId,memberId,"refusal");
		return "redirect:/collection/findAllCollectionList.do";
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
		return "redirect:/household/login/expenseSelect.do";
	}


	//가계부 수정하기.
	@RequestMapping(value="/collectionModify.do",method=RequestMethod.POST)
	public String collectionModify(HttpSession session,String memberIdforGrant, @ModelAttribute Collect collect, ModelMap map)
	{
		//1. bussiness 로직으로 입력 받은 memberId 가 collection 테이블의 grantId인지 체크한 다음 
		// 맞으면 수정, 틀리면 ajax로 화면에 alert 창 띄우고 'ㅅ' 그럼 되겠다.
	
		//1.memberIdforGrant가 참/거짓 
		System.out.println("수정!!!!!!!!!!!!!!!"+collect);
		Member m=new Member();
		if(!collect.getGrantId().equals(memberIdforGrant))
		{
			map.addAttribute("grantMessage","접근 권한이 없습니다.");
		}
		else //접근 권한이 있는 경우!
		{
			String message=service.modifyCollection(collect, memberIdforGrant);
			if(message.equals("success"))
			{
				System.out.println("수정 성공");
				session.setAttribute("group_info", collect);
				List<Collect> groupList = service.selectByMemberIdNInvite(((Member)session.getAttribute("login_info")).getMemberId());
				session.setAttribute("groupList", groupList);	
			}else
			{
				map.addAttribute("grantMessage","해당 컬랙션이 없습니다.");
			}
			
		}
		
		return "body/collection/collectionSettingMain.tiles";
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
			List<Collect> groupList = service.selectByMemberIdNInvite(((Member)session.getAttribute("login_info")).getMemberId());
			session.setAttribute("groupList", groupList);
		//	return "redirect:/invite.do";
			return "redirect:/collection/findAllCollectionList.do";
		}else
		{
			map.put("deletefailMessage", str);
			return "body/collection/collectionSettingMain.tiles";
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
	public String inviteMember(String email, String collectionId, ModelMap map )
	{
		//2.비지니스 로직 호출! 'ㅅ'
		System.out.println("inviteMember()"+email+collectionId);
		Member m=new Member();
		m=memberService.findMemberByEmail(email);
		if(m!=null&&email!=null) //널이 아닌 경우
		{
			String id=m.getMemberId(); //회원의 아이디를 받아옴
			MemberNCollection mncRow=new MemberNCollection();
			HashMap<String,String> map2=new HashMap<String,String>();
			map2.put("memberId",id);
			map2.put("collectionId", collectionId);
			mncRow=mncService.selectByMemberIdAndCollectionId(map2);
			if(mncRow!=null)
			{
				map.put("message", "이미 초대한 회원입니다.");
				
			}else
			{
				if(!(email==null||email.equals("")))
				{
					service.inviteMemberInCollection(email, collectionId);		
					
				}else
				{
					map.addAttribute("inviteMessage", "해당하는 이메일이 없습니다.");
				}
				
			}
			
		}else //널인 경우
		{
			map.put("message",  "없는 회원입니다.");
			
		}
	
		return "redirect:/collection/inviteSetting.do";
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

		return "redirect:/household/login/expenseSelect.do";
	}
	
	//그룹 멤버 관리를 눌렀을 때 - 현재 회원 정보와 상태를 보여주는 곳 
	@RequestMapping("/inviteSetting.do") 
	public String showInviteSetting(HttpSession session, ModelMap map)
	{
		System.out.println("여기!!!!");
		Collect collect=(Collect)session.getAttribute("group_info");
		System.out.println(collect);//현재 세션에 있는 그룹을 받아온다.
		
		//2. business logic으로 'ㅅ' -> 해당 collectionId를 통해서 초대한 회원이나 현재 회원을 보여준다음 
		//이걸 requestScope에 담아서 view로 이동하고, view 에서는 list에 담긴 정보를 뿌려주기만 하면 끝
		service.showInviteSettingMemberList(map,collect); //현재 그룹이랑, map을 보냄
		
		return "body/collection/inviteMember_form.tiles";
	}
	
	//초대 거부한 회원 삭제하기! 
	@RequestMapping(value="/removeRefusalMember.do")
	public String removeRefusalMember(HttpSession session,String email)
	{
		System.out.println("초대 거부한 회원 삭제하기 ㅠㅠ");
		System.out.println(email);

		Collect c=(Collect)session.getAttribute("group_info");
		Member m=new Member();
		m=memberService.findMemberByEmail(email);
		//2.비지니스 로직 ㄱㄱ ㅠㅠ
		service.removeRefusalMemberByCollectionId(c.getCollectionId(),m.getMemberId());

		return "redirect:/collection/inviteSetting.do";
		
	}
	
		
}
