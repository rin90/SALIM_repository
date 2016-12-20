package com.salim.controller;

import java.net.URLEncoder;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.TipCommentService;
import com.salim.vo.FreeComment;

@Controller
@RequestMapping("/tip/comment/login/")
public class TipCommentController {
	
	@Autowired
	private TipCommentService service;
	
	//댓글 등록  -> 답글 도 이 Controller를 통해 처리 --월요일에 ajax처리하기 쿼리랑 dao,service,controller정상 작동
 	@RequestMapping("insert")
	public String commentRegister(@ModelAttribute @Valid FreeComment comment,BindingResult result,int page,String category,String search,ModelMap map) throws Exception{
 
 		if(comment.getCommentGroup() ==0){
 			
 			comment.setCommentGroup(service.comGroupUp()); 			
 		
 		}
		service.comRegister(comment);
	
		return "redirect:/tip/login/seleteDetail.do?no="+comment.getNo()+"&page="+page+"&search="+search+"&category="+URLEncoder.encode(category, "UTF-8");
		//URLEncoder.encode -> 한글이 보낼때 encoding이 되지 않아서 해준 것임
 	}
	
 	
 	
 	
 	//수정  ->모든 댓글
	@RequestMapping("update")
	public String comUpdate(@ModelAttribute FreeComment comment,int page,String category,String search){
		service.comUpdate(comment);
		return "redirect:/tip/login/seleteDetail.do?no="+comment.getNo()+"&page="+page+"&category="+category+"&search="+search;
	}
	
	//삭제 
	@RequestMapping("delete")
	public String comDelete(int id,int no,int page,String category,String search) throws Exception{
		service.comDelete(id);
		return "redirect:/tip/login/seleteDetail.do?no="+no+"&page="+page+"&category="+URLEncoder.encode(category, "UTF-8")+"&search="+search;
	}
	
	
}
