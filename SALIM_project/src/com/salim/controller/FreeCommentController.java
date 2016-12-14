package com.salim.controller;

import java.net.URLEncoder;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.FreeCommentService;
import com.salim.vo.FreeComment;

@Controller
@RequestMapping("/comment/")
public class FreeCommentController {
	
	@Autowired
	private FreeCommentService service;
	
	//댓글 등록  -> 답글 도 이 Controller를 통해 처리 --월요일에 ajax처리하기 쿼리랑 dao,service,controller정상 작동
 	@RequestMapping("login/insert")
	public String commentRegister(@ModelAttribute @Valid FreeComment comment,BindingResult result,int page,String category,String search,ModelMap map) throws Exception{
 		System.out.println("comment등록 도착");
 		System.out.println("그룹:"+comment.getCommentGroup());
 		if(comment.getCommentGroup() ==0){
 			comment.setCommentGroup(service.comGroupUp()); 			
 		}
		service.comRegister(comment);
		System.out.println("카테고리comment:"+category);
		System.out.println("내용comment:"+search);
		return "redirect:/free/seleteDetail.do?no="+comment.getNo()+"&page="+page+"&search="+search+"&category="+URLEncoder.encode(category, "UTF-8");
		//URLEncoder.encode -> 한글이 보낼때 encoding이 되지 않아서 해준 것임
 	}
	
 	
 	
 	
 	//수정  ->모든 댓글
	@RequestMapping("login/update")
	public String comUpdate(@ModelAttribute FreeComment comment,int page,String category,String search){
		System.out.println("댓글 수정 도착"+comment.getId());
		System.out.println(comment.getCommentContent());
		service.comUpdate(comment);
		return "redirect:/free/seleteDetail.do?no="+comment.getNo()+"&page="+page+"&category="+category+"&search="+search;
	}
	
	//삭제
	@RequestMapping("login/delete")
	public String comDelete(int id,int no,int page,String category,String search) throws Exception{
		service.comDelete(id);
		return "redirect:/free/seleteDetail.do?no="+no+"&page="+page+"&category="+URLEncoder.encode(category, "UTF-8")+"&search="+search;
	}
	
	
	
	
}
