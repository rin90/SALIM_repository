package com.salim.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.impl.CollectionServiceImpl;
import com.salim.vo.Collect;
import com.salim.vo.Member;

@Controller
@RequestMapping("/collection")
public class CollectController {

	@Autowired
	private CollectionServiceImpl service;


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
		
		map.addAttribute("collectionList", collectionList);//이걸 왜...request에 담았을까?..??으이..?
		//session.setAttribute("collectionList", collectionList);

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


	@RequestMapping("/collectionSetting.do")
	public String collectionSetting()
	{
		return "body/collection/setting/settings/collectionSettingMain.tiles";
	}
	
	@RequestMapping("/inviteMember.do")
	public String inviteMember()
	{
		return "body/collection/setting/settings/inviteMember_form.tiles";
	}
	
	
	
		
}
