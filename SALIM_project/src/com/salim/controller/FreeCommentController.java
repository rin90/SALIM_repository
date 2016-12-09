package com.salim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.FreeCommentService;
import com.salim.vo.FreeComment;

@Controller
@RequestMapping("/comment/")
public class FreeCommentController {
	
	@Autowired
	private FreeCommentService service;
	
	//댓글 등록  -> 답글 도 이 Controller를 통해 처리
 	@RequestMapping("insert")
	public void commentRegister(FreeComment comment){
		service.comRegister(comment);
	}
	
 	//수정  ->모든 댓글
	@RequestMapping("update")
	public void comUpdate(FreeComment comment){
		service.comUpdate(comment);
	}
	
	//삭제
	@RequestMapping("delete")
	public void comDelete(int id){
		service.comDelete(id);
	}
	

	
	
}
