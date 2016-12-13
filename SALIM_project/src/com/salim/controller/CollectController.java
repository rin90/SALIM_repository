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
		
		String collectionId=service.findCollectionSeq();
		Collect collect=new Collect(collectionId, collectionName, collectionIntro);
		Member m=(Member)session.getAttribute("login_info");
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
		collectionList=service.findCollectionByMemberId(m.getMemberId());
		System.out.println(collectionList);
		map.addAttribute("collectionList", collectionList);

		return "body/login_success.tiles";
	}
	
	@RequestMapping("/getSession.do")
	public String getSession(HttpSession session,String collectionId)
	{
		//요청 파라미터 받은 뒤, 디비에서 받아와야겟다,
		Collect collect=new Collect();
		collect=service.findCollectionByCollectionId(collectionId);
		session.setAttribute("group_info",collect);
		return "redirect:/household/login/incomeSelect.do";
	}

	//${initParam.rootPath }/
	
	
	
	
		
}
