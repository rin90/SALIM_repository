package com.salim.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CodeService;
import com.salim.service.FreeBoardService;
import com.salim.vo.FreeBoard;

@Controller
@RequestMapping("/free/")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;

	@Autowired
	private CodeService codeService;

	// 게시판 목록 뿌려주는 메소드                                                   V
	@RequestMapping("list")
	public ModelAndView list(int page,HttpServletRequest request) {
		page=Integer.parseInt(request.getParameter("page"));
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		return new ModelAndView("body/free_board_list.tiles", map);
	}

	// 글 등록 form 이동 메소드                                                       V
	@RequestMapping("form")
	public String fromMove(int page,ModelMap map){
		map.addAttribute("page", page);
		return "body/free_board_form.tiles";
	}

	// 글 등록 메소드                                   V 파일부분 나중에
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insert(@ModelAttribute FreeBoard freeBoard,ModelMap map,int page) {
		
/*		MultipartFile file =freeBoard.getFileRoot();
		if(file != null&& !file.isEmpty()){//업로드 된 파일이 있다면
			String fileName = file.getOriginalFilename();//파일명
			
			String dir =request.getServletContext().getRealPath("/file");//파일 저장되는 곳
			File dest = new File(dir,fileName);
			file.transferTo(dest);//파일이동
		}*/
		service.insertFree(freeBoard);
		FreeBoard board =service.selectByNo(freeBoard.getNo());
		map.addAttribute("freeboard",board);
		map.addAttribute("page",page);
		return "body/free_board_detail.tiles";
	}
	
	// 글 수정 form이동 메소드                  V
	@RequestMapping("updateForm")
	public String updateMove(int page,int no,ModelMap map){
		map.addAttribute("page", page);
		map.addAttribute("freeboard",service.selectByNo(no));
		System.out.println(no);
		return "body/free_board_modify.tiles";
	}
	
	//글 수정 메소드
	@RequestMapping("update")
	public ModelAndView update(@ModelAttribute FreeBoard freeBoard){
		service.updateFree(freeBoard);
		FreeBoard board = service.selectByNo(freeBoard.getNo());
		return new ModelAndView("body/free_board_modify.tiles","freeBoard",board);
	}
	
	// 글 삭제 메소드
	@RequestMapping("delete")
	public String delete(int page,int no,ModelMap map){
		service.deleteFree(no);
		map.addAttribute("page",page);
		return "list.do";
	}
	
	/*// no로 조회하는 메소드(상세화면) + 댓글 수
	@RequestMapping("seleteDetail")
	public ModelAndView detail(int no,int fontNo){
		
		return new ModelAndView();
	}*/
	
	/*// 조회 수정 메소드
	public 
	// 좋아요 수정 메소드

	
	// 조회 -제목,작성자 조회 메소드
	@RequestMapping("keyword")
	@ResponseBody
	public void selectByTitle(@RequestParam String keyword,@RequestParam String category,ModelMap map){
		int page =1;
		List<FreeBoard> list =null;
		System.out.println("왔다.");
		if(category.equals("제목")){
			list = service.selectByTitle(keyword);			
		}else if(category.equals("작성자")){
			list = service.selectByMemberId(keyword);
		}
		Map p=service.getFreeBoardList(page);
		map.put("pageBean", p);
		map.put("list", list);
	}
	*/

}
