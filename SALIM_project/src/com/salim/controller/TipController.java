package com.salim.controller;

import java.io.File;
import java.io.IOException;
import java.text.AttributedCharacterIterator.Attribute;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CodeService;
import com.salim.service.TipBoardService;
import com.salim.util.PagingBean;
import com.salim.vo.TipBoard;

@Controller
public class TipController {
	@Autowired
	private TipBoardService tipBoardService;

	@Autowired
	private CodeService codeService;

	// 리스트목록뿌려주는거
	@RequestMapping("/list")
	public ModelAndView list(int page) {
		Map map = tipBoardService.getTipListBoard(page);
		map.put("codes", codeService.findCode("tip"));
		return new ModelAndView("body/tipboard/tipboard_list.tiles", map);
	}

	// 조회회하는것 검색기능과페이지카테고리기능
	@RequestMapping("/keyword")
	public ModelAndView selectByTitle(int page, String search, String category) {
		Map map = null;
		map = tipBoardService.getTermsTipListBoard(page, category, search);
		List list = (List) map.get("list");
		System.out.println(list);
		if (list.size() != 0) { // 12/6일 내일 해야함
			page = page - 1;
			map = tipBoardService.getTermsTipListBoard(page, category, search);
		}
		map.put("codes", codeService.findCode("조회"));
		map.put("category", category);
		map.put("search", search);
		PagingBean p = (PagingBean) map.get("pageBean");
		
			return new ModelAndView("body/tipboard/tipboard_list.tiles", map);
		}
	

	// 아작스처리
	@RequestMapping(value = "/boardAjax")
	public void ajaxlist(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		res.setHeader("Cache-Control", "no-cache");

	}

	// 글 수정 폼 이동
	@RequestMapping("move")
	public ModelAndView updatemove(int no ,int page) {
		Map map = new HashMap();
		map.put("codes", codeService.findCode("tip"));
		map.put("tipBoard", tipBoardService.ModelAndselectByNo(no));
        map.put("page",page);
		System.out.println(tipBoardService.ModelAndselectByNo(no));
		return new ModelAndView("body/tipboard/tip_board_modify.tiles", map);

	}

	// 글수정파일이저장되는곳
	@RequestMapping(value = "boardUpdate")
	public String update(@ModelAttribute TipBoard tipBoard, HttpServletRequest request, ModelMap map ,int page)
			throws IllegalStateException, IOException {
		MultipartFile file = tipBoard.getFileRoot();
		if (file != null && !file.isEmpty()) {// 업로드 된 파일이 있다면
			System.out.println("dsadasd"+file.getOriginalFilename());
			tipBoard.setFileName(file.getOriginalFilename());// 파일명
			System.out.println("파일이름:"+tipBoard.getFileName());

			String dir = request.getServletContext().getRealPath("/tipFileRoute");// 파일
																				// 저장되는
																				// 곳

			System.out.println("진짜 파일 경로::" + dir);

			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);// 파일이동
		}
		tipBoardService.tipUpdate(tipBoard);

		return "redirect:/selectByNo.do?no=" + tipBoard.getNo()+"&page="+page;
		

	}
	


	// 글삭제
	@RequestMapping("delete")
	public String delete(int no ,int page ,ModelMap map) {
		tipBoardService.tipDelete(no);
       
		return "redirect:/list.do?page="+page;
	}

	// 글등록하는기능
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String insert(int page,@ModelAttribute TipBoard tipboard, HttpServletRequest request) throws IllegalStateException, IOException {
		
		MultipartFile file = tipboard.getFileRoot();
	
		if (file != null && !file.isEmpty()) {
			
			tipboard.setFileName(file.getOriginalFilename());
			
			String dir = request.getServletContext().getRealPath("/tipFileRoute");
			
			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);
		}
		tipBoardService.tipInsert(tipboard);
		return "redirect:/selectByNo.do?no=" + tipboard.getNo()+"&page="+page;
	}

	// 좋아요 증가
	@RequestMapping("good")
	@ResponseBody
	public void goodUpdate(int no, String whether, HttpServletRequest request) {
		System.out.println("왓??");
		if (whether.isEmpty()) {
			tipBoardService.goodUpdate(no, -1);
		} else {
			tipBoardService.goodUpdate(no, 1);
		}

	}

	@RequestMapping("selectByNo")
	public String selectByNo(int no, ModelMap map,int page) {
		map.addAttribute("tipBoard", tipBoardService.selectByNo(no));
		map.addAttribute("page",page);
		System.out.println("dd");
		return "body/tipboard/tip_board_detail.tiles";
	}

	// 글 등록 form 이동 메소드 V - 로그인해야 가능
	@RequestMapping("form")
	public String fromMove(int page, ModelMap map) {
		map.addAttribute("codes", codeService.findCode("분류"));
		map.addAttribute("page", page);
		return "body/tipboard/tip_board_form.tiles";
	}
@RequestMapping("search")
public String selectTitleTotal(int no,int page ,ModelMap map){
	map.addAttribute("codes", codeService.findCode("tip"));
	map.addAttribute("page",page);
	map.addAttribute("tipBoard", tipBoardService.selectTitleTotal(no, page));
		
	return "body/tipboard/tip_board_search.tiles";
	
}
	
}
