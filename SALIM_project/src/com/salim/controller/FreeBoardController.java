package com.salim.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CodeService;
import com.salim.service.FreeBoardService;
import com.salim.util.PagingBean;
import com.salim.vo.FreeBoard;

@Controller
@RequestMapping("/free/")
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;

	@Autowired
	private CodeService codeService;

	// 게시판 목록 뿌려주는 메소드                        기본                           V    -로그인 없이 가능
	@RequestMapping("list")
	public ModelAndView list(int page) {
	
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		return new ModelAndView("body/board/free_board_list.tiles", map);
	}
	
	
	// 게시판 목록 뿌려주는 메소드 ---  >>>> 검색  -제목 또는 제목으로 검색시            V                  -로그인 없이 가능
	@RequestMapping("keyword")
	public ModelAndView selectByTitle(int page,String search,String category){
		Map map =null;
		map=service.getTermsFreeBoardList(page, category, search);
		List list =(List) map.get("list");
		if(list.size() == 0){ //12/6일 내일 해야함
			page =page-1;
			map=service.getTermsFreeBoardList(page, category, search);
		}
		map.put("codes", codeService.findCode("조회"));
		map.put("category", category);
		map.put("search", search);
		PagingBean p = (PagingBean) map.get("pageBean");
		if(p.getTotalPage()==0){
			return new ModelAndView("body/board/non_view.tiles",map);
		}else{
		return new ModelAndView("body/board/free_board_terms_list.tiles",map);
		}
	}
	
	
	
	// 글 등록 form 이동 메소드                                                       V         - 로그인해야 가능
	@RequestMapping("form")
	public String fromMove(int page,ModelMap map){
		map.addAttribute("page", page);
		return "body/board/free_board_form.tiles";
	}

	
	/*
	@ModelAttribute는 requestScope에도 넣어준다. 키값을 지정 안할 시 클래스의 첫글자를 소문자로 변환후에 들어간다. 값은 그 객체 키:freeBoard 값 객체
	그래서 밑에 글 수정 메소드에서 따로 requestScope에 저장하는 방식을 취하지않음(ModelMap넣는다던가 ModelAndView에 넣는다던가
	 단. 주의할점 ModelAttribute는 객체를 새로 생성하는 것이기 때문에 update를 할 경우에는 매개변수로 받는 것은 부적절하다. (새로 생성하므로 기존 것이 수정되는 것이 아니고 새로운 객체가
	 그 값이 되는 것이다.)
		밑에 form에서 fileName를 안주고 컨트롤러에서 fileName을 vo객체에 넣어주기 때문에 ModelMap에  다시 객체를 넣었음
	 */	
	
	
	// 글 등록 메소드                                   V  -로그인해야 가능
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insert(@ModelAttribute FreeBoard freeBoard, BindingResult errors, ModelMap map,int page,HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile file = freeBoard.getFileRoot();

		if(file != null&& !file.isEmpty()){//업로드 된 파일이 있다면
			
			freeBoard.setFileName(file.getOriginalFilename());//파일명
			
			String dir =request.getServletContext().getRealPath("/fileroute");//파일 저장되는 곳
			
			File dest = new File(dir,file.getOriginalFilename());
			
			file.transferTo(dest);//파일이동
		}
		service.insertFree(freeBoard);
		System.out.println(freeBoard);
		map.addAttribute("commentTotal",service.selectCommentTotal(freeBoard.getNo()));
		map.addAttribute("page",page);
		map.addAttribute("freeBoard",freeBoard);
		return "body/board/free_board_detail.tiles";
	}
	
	// 글 수정 form이동 메소드                  V                   -로그인해야 가능
	@RequestMapping("updateForm")
	public String updateMove(int page,int no,String category,String search,ModelMap map){
		map.addAttribute("page", page);
		map.addAttribute("freeBoard",service.selectByNo(no));
		map.addAttribute("category",category);
		map.addAttribute("search",search);
		return "body/board/free_board_modify.tiles";
	}
	

	//글 수정 메소드                                          V               - 로그인해야 가능
	@RequestMapping("update")
	public String update(@ModelAttribute FreeBoard freeBoard,int page,String category,String search,HttpServletRequest request,ModelMap map) throws IllegalStateException, IOException{
		MultipartFile file = freeBoard.getFileRoot();
		
		if(file != null&& !file.isEmpty()){//업로드 된 파일이 있다면
			
			freeBoard.setFileName(file.getOriginalFilename());//파일명
			
			String dir =request.getServletContext().getRealPath("/fileroute");//파일 저장되는 곳
			
			System.out.println("진짜 파일 경로::"+dir);
			
			File dest = new File(dir,file.getOriginalFilename());
			
			file.transferTo(dest);//파일이동
		}
		service.updateFree(freeBoard);
		map.addAttribute("page",page);
		map.addAttribute("commentTotal",service.selectCommentTotal(freeBoard.getNo()));
		map.addAttribute("category",category);
		map.addAttribute("search",search);
		System.out.println("updateController:"+category);
		return "body/board/free_board_detail.tiles";
	}
	
	// 글 삭제 메소드                                                                 V       -로그인해야 가능
	@RequestMapping("delete")
	public ModelAndView delete(int no,int page){
		service.deleteFree(no);
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		return new ModelAndView("body/board/free_board_list.tiles", map);
	}
	
	// no로 조회하는 메소드(상세화면) + 댓글 수                            V  member_id가 같을 경우 조회수 증가를 하면 안됨 serviceImple에서 수정해야 할 부분(즉, 자기 자신의 글)
	// -로그인 해야 가능
	@RequestMapping("seleteDetail")
	public String detail(int no,int page,String category,String search,ModelMap map){
		map.addAttribute("freeBoard",service.selectByNo(no));
		map.addAttribute("commentTotal",service.selectCommentTotal(no));
		map.addAttribute("page",page);
		map.addAttribute("category",category);
		map.addAttribute("search",search);
		return "body/board/free_board_detail.tiles";
	}
	

	
	// 좋아요 수정 메소드           V         view에서 ajax처리하기     -로그인 해야 가능   한 글에 대해 member_id는 한번만 좋아요 가능 즉, 글에 한 번씩만 좋아요 가능, member_id로 체크
	@RequestMapping("good")
	@ResponseBody
	public void goodUpdate(int no,String whether,HttpServletRequest request){
		System.out.println("왓??");
		if(whether.isEmpty()){
			service.updateGood(no,-1);			
		}else{
			service.updateGood(no,1);
		}
		
	}
	//물어볼 것!! -> detail화면에서 좋아요 숫자를 보여줄 것인지 , 아니면 좋아요 버튼만 

}
