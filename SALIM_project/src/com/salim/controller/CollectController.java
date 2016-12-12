package com.salim.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		return "redirect:/loginSuccess.do"; //로그인 성공페이지로 일단 ㄱㄱ 
	}

	//이건 main화면을 뿌려줄 때 사용할 컨트롤러인데,! - 돌아간다! 야호~ 'ㅅ'
	@RequestMapping("/findAllCollectionList.do")
	public String collectShow()
	{
		System.out.println("colletionsShow()");
		return "/loginSuccess.do";
	}
	
	
		
}
