package com.salim.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 게시판 목록 뿌려주는 메소드                                                   V    -로그인 없이 가능
	@RequestMapping("list")
	public ModelAndView list(int page) {
		System.out.println("list");
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		return new ModelAndView("board/body/free_board_list.tiles", map);
	}

	// 글 등록 form 이동 메소드                                                       V         - 로그인해야 가능
	@RequestMapping("form")
	public String fromMove(int page,ModelMap map){
		map.addAttribute("page", page);
		return "board/body/free_board_form.tiles";
	}

	
	/*
	@ModelAttribute는 requestScope에도 넣어준다. 키값을 지정 안할 시 클래스의 첫글자를 소문자로 변환후에 들어간다. 값은 그 객체 키:freeBoard 값 객체
	그래서 밑에 글 수정 메소드에서 따로 requestScope에 저장하는 방식을 취하지않음(ModelMap넣는다던가 ModelAndView에 넣는다던가
	 단. 주의할점 ModelAttribute는 객체를 새로 생성하는 것이기 때문에 update를 할 경우에는 매개변수로 받는 것은 부적절하다. (새로 생성하므로 기존 것이 수정되는 것이 아니고 새로운 객체가
	 그 값이 되는 것이다.)
	 */	
	
	
	// 글 등록 메소드                                   V 파일부분 나중에                    -로그인해야 가능
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
		map.addAttribute("commentTotal",service.selectCommentTotal(freeBoard.getNo()));
		map.addAttribute("page",page);
		return "board/body/free_board_detail.tiles";
	}
	
	// 글 수정 form이동 메소드                  V                   -로그인해야 가능
	@RequestMapping("updateForm")
	public String updateMove(int page,int no,ModelMap map){
		map.addAttribute("page", page);
		map.addAttribute("freeBoard",service.selectByNo(no));
		return "board/body/free_board_modify.tiles";
	}
	

	//글 수정 메소드                                          V               - 로그인해야 가능
	@RequestMapping("update")
	public String update(@ModelAttribute FreeBoard freeBoard,int page,ModelMap map){		
		service.updateFree(freeBoard);
		map.addAttribute("page",page);
		map.addAttribute("commentTotal",service.selectCommentTotal(freeBoard.getNo()));
		return "board/body/free_board_detail.tiles";
	}
	
	// 글 삭제 메소드                                                                 V       -로그인해야 가능
	@RequestMapping("delete")
	public ModelAndView delete(int no,int page){
		service.deleteFree(no);
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		return new ModelAndView("board/body/free_board_list.tiles",map);
	}
	
	// no로 조회하는 메소드(상세화면) + 댓글 수                            V  member_id가 같을 경우 조회수 증가를 하면 안됨 serviceImple에서 수정해야 할 부분(즉, 자기 자신의 글)
	// -로그인 해야 가능
	@RequestMapping("seleteDetail")
	public String detail(int no,int page,ModelMap map){
		map.addAttribute("freeBoard",service.selectByNo(no));
		map.addAttribute("commentTotal",service.selectCommentTotal(no));
		map.addAttribute("page",page);
		return "board/body/free_board_detail.tiles";
	}
	

	
	// 좋아요 수정 메소드                     V   view에서 ajax처리하기     -로그인 해야 가능
	@RequestMapping("good")
	@ResponseBody
	public void goodUpdate(int no){
		service.updateGood(no);
	}
	
	
	

	
	// 조회 -제목,작성자 조회 메소드                        V ajax처리      -로그인 없이 가능
	@RequestMapping("keyword")
	@ResponseBody
	public void selectByTitle( String keyword,String category,ModelMap map){
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
	

}
