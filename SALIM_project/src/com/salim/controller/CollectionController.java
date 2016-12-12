package com.salim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.impl.CollectionServiceImpl;
import com.salim.vo.Collection;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	/*	<!-- collection -->
	<mvc:view-controller path="/collection.do" view-name="body/collection_form.tiles"/> 
	*/
	
	@Autowired
	private CollectionServiceImpl service;

	//가계부 추가 
	@RequestMapping("/collection_add.do")
	public void collectionAdd(String collectionName, String collectionIntro)
	{
		//일단 요청파라미터를 VO로 안 받고 매개변수로 받기!
		
		String id=service.findCollectionSeq();
		Collection collection=new Collection(id,collectionName,collectionIntro);
		service.addCollection(collection);
		collectionsShow();//어디넘어가지? 메인으로 넘어가야 되는데, 일단..조회하는 컨트롤러를 거쳐서 조회 후 뿌려줘야 하니까 조회하는 컨트롤러로 가자!
		
	}

	//이건 main화면을 뿌려줄 때 사용할 컨트롤러인데,!
	@RequestMapping("show.do")
	public String collectionsShow()
	{
		System.out.println("collcetionsShow()");
		return "/showSuccessLogin.do";
	}
		
}
