package com.salim.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.salim.service.FreeBoardService;
import com.salim.service.FreeCommentService;
import com.salim.util.PagingBean;
import com.salim.vo.FreeBoard;
import com.salim.vo.FreeComment;
import com.salim.vo.Member;

@Controller
@RequestMapping("/free/login/")
public class FreeBoardController {
	/*
	 * 나중에 시간 남으면 처리할 것들 1. 좋아요 F5처리 못함 -db생성해서 하기 ,쿠키로 할 경우에 사용자가 쿠키를 삭제할 수도
	 * 있어서 db는 영구적 2. file을 입력 받으면 내 디렉토리에(fleroute) 파일을 저장하기 -이거는 고민 된다. 서버가 계속
	 * on되 있을 경우 3. 검색 기준을 보여주기 - 지금은 작성자로 검색했을 경우 검색기준이 제목으로 되있음 작성자로 표현해주기 -아마
	 * ajax하면 되지 않을까? - 댓글하고 바로 하기
	 */
	@Autowired
	private FreeBoardService service;

	@Autowired
	private CodeService codeService;

	@Autowired
	private FreeCommentService commentService;

	// 게시판 목록 뿌려주는 메소드 기본 V -로그인 없이 가능
	@RequestMapping("list")
	public ModelAndView list(int page) {
		Map map = service.getFreeBoardList(page);
		map.put("codes", codeService.findCode("조회"));
		List<FreeBoard> list = (List<FreeBoard>) map.get("list");
		if (list.size() != 0) {
			return new ModelAndView("body/board/free_board_list.tiles", map);
		} else {
			return new ModelAndView("body/board/non_view.tiles", map);
		}
	}

	// 게시판 목록 뿌려주는 메소드 --- >>>> 검색 -제목 또는 제목으로 검색시 V -로그인 없이 가능
	@RequestMapping("keyword")
	public ModelAndView selectByTitle(int page, String search, String category) {
		Map map = null;
		map = service.getTermsFreeBoardList(page, category, search);
		List list = (List) map.get("list");
		if (list.size() == 0) {
			page = page - 1;
			map = service.getTermsFreeBoardList(page, category, search);
		}
		map.put("codes", codeService.findCode("조회"));
		map.put("category", category);
		map.put("search", search);
		PagingBean p = (PagingBean) map.get("pageBean");
		if (p.getTotalPage() == 0) {
			return new ModelAndView("body/board/non_view.tiles", map);
		} else {
			return new ModelAndView("body/board/free_board_terms_list.tiles", map);
		}
	}

	// 글 등록 form 이동 메소드 V - 로그인해야 가능
	@RequestMapping("form")
	public String fromMove(int page, ModelMap map) {
		map.addAttribute("page", page);
		return "body/board/free_board_form.tiles";
	}

	/*
	 * @ModelAttribute는 requestScope에도 넣어준다. 키값을 지정 안할 시 클래스의 첫글자를 소문자로 변환후에
	 * 들어간다. 값은 그 객체 키:freeBoard 값 객체 그래서 밑에 글 수정 메소드에서 따로 requestScope에 저장하는
	 * 방식을 취하지않음(ModelMap넣는다던가 ModelAndView에 넣는다던가 단. 주의할점 ModelAttribute는 객체를
	 * 새로 생성하는 것이기 때문에 update를 할 경우에는 매개변수로 받는 것은 부적절하다. (새로 생성하므로 기존 것이 수정되는 것이
	 * 아니고 새로운 객체가 그 값이 되는 것이다.) 밑에 form에서 fileName를 안주고 컨트롤러에서 fileName을 vo객체에
	 * 넣어주기 때문에 ModelMap에 다시 객체를 넣었음
	 */

	/*
	 * @Valid -> Spring MVC에서 지원하는 검증할 때 유용 해당 bean객체에 제공하는 기능을 @으로 달아주면 그것을
	 * spring에서 검증하여 에러를 내고 그것을 BindingResult로 리턴한다. 그래서 그것을 받아다 쓰면 좋음 이거 말고 다른
	 * 방법은 Validator클래스를 만드는 방법이 있지만 이것이 더 유용
	 */
	// 글 등록 메소드 V -로그인해야 가능
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String insert(@ModelAttribute @Valid FreeBoard freeBoard, BindingResult errors, ModelMap map, int page,
			HttpServletRequest request) throws IllegalStateException, IOException {
		if (errors.hasErrors()) // 에러가 있는 경우 전달
		{
			map.addAttribute("page", page);
			return "body/board/free_board_form.tiles";
		}
		System.out.println("요청파라미터 number값:" + freeBoard.getNo());

		System.out.println("123" + freeBoard.getFileRoot());
		MultipartFile file = freeBoard.getFileRoot();

		if (file != null && !file.isEmpty()) {// 업로드 된 파일이 있다면
			System.out.println("파일");
			freeBoard.setFileName(file.getOriginalFilename());// 파일명
			System.out.println("이름" + freeBoard.getFileName());
			String dir = request.getServletContext().getRealPath("/fileroute");// 파일
																				// 저장되는
																				// 곳

			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);// 파일이동
		}

		service.insertFree(freeBoard);
		return "redirect:/free/login/seleteDetail.do?no=" + freeBoard.getNo() + "&page=" + page;
	}

	// 글 수정 form이동 메소드 V -로그인해야 가능
	@RequestMapping("updateForm")
	public String updateMove(int page, int no, String category, String search, ModelMap map) {
		map.addAttribute("page", page);
		map.addAttribute("freeBoard", service.selectByNo(no));
		map.addAttribute("category", category);
		map.addAttribute("search", search);
		return "body/board/free_board_modify.tiles";
	}

	// 글 수정 메소드 V - 로그인해야 가능
	@RequestMapping("update")
	public String update(@ModelAttribute FreeBoard freeBoard, int page, String category, String search,
			HttpServletRequest request, ModelMap map) throws IllegalStateException, IOException {
		System.out.println("수정");
		MultipartFile file = freeBoard.getFileRoot();
		if (file != null && !file.isEmpty()) {// 업로드 된 파일이 있다면

			freeBoard.setFileName(file.getOriginalFilename());// 파일명

			String dir = request.getServletContext().getRealPath("/fileroute");// 파일
																				// 저장되는
																				// 곳

			System.out.println("진짜 파일 경로::" + dir);

			File dest = new File(dir, file.getOriginalFilename());

			file.transferTo(dest);// 파일이동
		}
		service.updateFree(freeBoard);
		if (category != null && !category.isEmpty() && search != null && !search.isEmpty()) {
			return "redirect:/free/login/seleteDetail.do?no=" + freeBoard.getNo() + "&page=" + page + "category=" + category
					+ "search=" + search;
		} else {
			return "redirect:/free/login/seleteDetail.do?no=" + freeBoard.getNo() + "&page=" + page;
		}
	}

	// 글 삭제 메소드 V -로그인해야 가능
	@RequestMapping("delete")
	public String delete(int no, int page) {
		System.out.println("삭제");
		service.deleteFree(no);
		return "redirect:/free/login/list.do?page=" + page;// redirect방식으로 처리해야함 안그러면
														// 새로고침하면 계속 브라우저가 url을
														// 그대로 가지고 있어서 계속 처리됨
		// redirect로 값을 유지하기 위해서 controller를 호출하면서 값을 붙여줌
	}

	// no로 조회하는 메소드(상세화면) + 댓글 수 +조회수 +댓글 V member_id가 같을 경우 조회수 증가를 하면 안됨
	// serviceImple에서 수정해야 할 부분(즉, 자기 자신의 글)
	// -로그인 해야 가능
	@RequestMapping("seleteDetail")
	public String detail(int no, int page, String category, String search,
			@CookieValue(required = false, defaultValue = "0") String read, HttpServletResponse response,
			ModelMap map) {

		FreeBoard free = service.selectByNo(no);
		List<FreeComment> list = free.getFreeComment();

		if (read.equals(String.valueOf(no))) {

			map.addAttribute("freeBoard", service.selectByNo(no)); // 조회만함
		} else {

			map.addAttribute("freeBoard", service.selectByNoAndClickUpdate(no)); // 조회및
																					// 조회수
																					// 증가
		}

		map.addAttribute("commentTotal", commentService.selectCommentTotal(no));
		map.addAttribute("page", page);
		map.addAttribute("category", category);
		map.addAttribute("search", search);
		map.addAttribute("freeComment", list);

		response.addCookie(new Cookie("read", String.valueOf(no)));// 새로고침 조회수 증가를 막기 위해 쿠키값 전달.
																	

		return "body/board/free_board_detail.tiles";
	}

	// 좋아요 수정 메소드 V view에서 ajax처리하기 -로그인 해야 가능 한 글에 대해 member_id는 한번만 좋아요 가능 즉,
	// 글에 한 번씩만 좋아요 가능, member_id로 체크
	@RequestMapping("good")
	@ResponseBody
	public void goodUpdate(int no, String whether, HttpServletRequest request) {
		System.out.println("좋아요");
		if (whether.isEmpty()) {
			service.updateGood(no, -1);
		} else {
			service.updateGood(no, 1);
		}

	}

}
