package com.salim.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.FreeBoardService;

@Controller
@RequestMapping("/free/")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService service;
	
	//게시판 목록 뿌려주는 메소드
	@RequestMapping("list")
	public ModelAndView list(int page){
		Map map =service.getFreeBoardList(page);
		return new ModelAndView("body/free_board_list.tiles",map);
	}
	
	/*//글 등록 메소드
	@RequestMapping(value="register",method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute FreeBoard freeBoard){
		service.insertFree(freeBoard);
		return  new ModelAndView("/");
	}*/
	
	//글 수정 메소드
	
	//조회 수정 메소드
	
	//좋아요 수정 메소드
	
	//글 삭제 메소드
	
	//조회 -제목으로 검색 메소드
	
	//no로 조회하는 메소드(상세화면) + 댓글 수
	
	

	
	
}
