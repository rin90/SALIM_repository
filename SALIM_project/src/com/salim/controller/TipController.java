package com.salim.controller;

import java.io.File;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.salim.service.CodeService;
import com.salim.service.TipBoardService;
import com.salim.service.TipCommentService;
import com.salim.util.PagingBean;
import com.salim.vo.TipBoard;
import com.salim.vo.TipComment;

@Controller
@RequestMapping("/tip/login/")
public class TipController {

	@Autowired
	private TipBoardService tipBoardService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private TipCommentService tipCommentService;

	// 기본 리스트 목록
	@RequestMapping("list") // /tip/login/list
	public ModelAndView list(int page) {
		Map map = null;

		map = tipBoardService.getTipListBoard(page);

		List list = (List) map.get("list");

		if (list.size() == 0) {
			page = page - 1;
			map = tipBoardService.getTipListBoard(page);
		}

		map.put("codes", codeService.findCode("tip"));
		if (page == 0) {
			return new ModelAndView("body/tipboard/tip_non_view.tiles", map);
		} else {
			return new ModelAndView("body/tipboard/tipboard_list.tiles", map);
		}
	}

	// 조회 리스트 목록 ( 분류, 작성자, 제목 )
	@RequestMapping("keyword")
	public ModelAndView selectByTitle(int page, String search, String category) {
		System.out.println("keyword: " + page + " " + category + " " + search);
		Map map = null;

		map = tipBoardService.getTermsTipListBoard(page, category, search);

		List list = (List) map.get("list");

		if (list.size() == 0) {

			page = page - 1;

			map = tipBoardService.getTermsTipListBoard(page, category, search);
		}

		map.put("codes", codeService.findCode("tip"));

		map.put("category", category);

		map.put("search", search);

		PagingBean p = (PagingBean) map.get("pageBean");

		if (p.getTotalPage() == 0) {
			return new ModelAndView("body/tipboard/tip_non_view.tiles", map);
		} else {

			return new ModelAndView("body/tipboard/tip_board_search.tiles", map);
		}

	}

	// 글 등록 form 이동 메소드 V - 로그인해야 가능
	@RequestMapping("form")
	public String fromMove(int page, ModelMap map) {
		map.addAttribute("codes", codeService.findCode("분류"));
		map.addAttribute("page", page);
		return "body/tipboard/tip_board_form.tiles";
	}

	// 글등록하는기능
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insert(ModelMap map,int page, @ModelAttribute @Valid TipBoard tipboard,BindingResult result, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		if (result.hasErrors()) // 에러가 있는 경우 전달
		{
			map.addAttribute("page", page);
			map.addAttribute("codes", codeService.findCode("분류"));
			return "body/tipboard/tip_board_form.tiles";
		}
		
		
		MultipartFile file = tipboard.getFileRoot();

		if (file != null && !file.isEmpty()) {

			tipboard.setFileName(file.getOriginalFilename());

			String dir = request.getServletContext().getRealPath("/tipFileRoute");

			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);
		}
		tipBoardService.tipInsert(tipboard);
		return "redirect:/tip/login/seleteDetail.do?no=" + tipboard.getNo() + "&page=" + page;
	}

	// 글 수정 폼 이동
	@RequestMapping("updateForm")
	public ModelAndView updatemove(int no, int page, String category, String search) {
		
		Map map = new HashMap();
		
		map.put("codes", codeService.findCode("tip"));
		
		map.put("tipBoard", tipBoardService.ModelAndselectByNo(no));
		
		map.put("page", page);
		
		map.put("category", category);
		
		map.put("search", search);
		
		return new ModelAndView("body/tipboard/tip_board_modify.tiles", map);

	}

	// 글수정파일이저장되는곳
	@RequestMapping("update")
	public String update(@ModelAttribute TipBoard tipBoard, String category, String search, int page,
			HttpServletRequest request, ModelMap map) throws IllegalStateException, IOException {
		
			MultipartFile file = tipBoard.getFileRoot();
		
			if (file != null && !file.isEmpty()) {// 업로드 된 파일이 있다면
			
			tipBoard.setFileName(file.getOriginalFilename());// 파일명

			String dir = request.getServletContext().getRealPath("/tipFileRoute");// 파일
																					// 저장되는
																					// 곳


			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);// 파일이동
		}
		tipBoardService.tipUpdate(tipBoard);

		return "redirect:/tip/login/seleteDetail.do?no=" + tipBoard.getNo() + "&page=" + page + "&category="
				+ URLEncoder.encode(category, "UTF-8") + "&search=" + URLEncoder.encode(search, "UTF-8");

	}

	// 글삭제
	@RequestMapping("delete")
	public String delete(int no, int page, ModelMap map) {
		tipBoardService.tipDelete(no);

		return "redirect:/tip/login/list.do?page=" + page;
	}

	// 상세화면
	@RequestMapping("seleteDetail")
	public String detail(int no, int page, String category, String search,
			@CookieValue(required = false, defaultValue = "0") String read, HttpServletResponse response,
			ModelMap map) {
		
		System.out.println("쿠키값:"+read);
		
		TipBoard tip = tipBoardService.ModelAndselectByNo(no);
		
		List<TipComment> list = tip.getTipComment();
	
		if (read.equals(String.valueOf(no))) { 

			map.addAttribute("tipBoard", tipBoardService.ModelAndselectByNo(no)); // 조회만함
		} else {

			map.addAttribute("tipBoard",tipBoardService.selectByNo(no)); // 조회및
																					// 조회수
																					// 증가
		}

		map.addAttribute("commentTotal", tipCommentService.selectCommentTotal(no));
		map.addAttribute("page", page);
		map.addAttribute("category", category);
		map.addAttribute("search", search);
		map.addAttribute("tipComment", list);

		response.addCookie(new Cookie("read", String.valueOf(no)));// 새로고침 조회수 증가를 막기 위해 쿠키값 전달.
																	
		
		return "body/tipboard/tip_board_detail.tiles";
	}


}
