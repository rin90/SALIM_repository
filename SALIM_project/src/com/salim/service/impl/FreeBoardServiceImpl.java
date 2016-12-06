package com.salim.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.FreeBoardDao;
import com.salim.service.FreeBoardService;
import com.salim.util.PagingBean;
import com.salim.vo.FreeBoard;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	FreeBoardDao dao;

	@Override
	public void insertFree(FreeBoard freeBoard) {
		dao.insertFree(freeBoard);
	}

	@Override
	public void updateFree(FreeBoard freeBoard) {
		dao.updateFree(freeBoard);
	}

	@Override
	public void updateGood(int no) {
		dao.updateGood(no);
	}

	@Override
	public void deleteFree(int no) {
		dao.deleteFree(no);
	}

	@Override
	public FreeBoard selectByNo(int no) {
		// 여기서 member_id가 글 등록한 member_id가 같은 id인지 판별해서 같으면 클릭업데이트 하지 않기 다르면
		// 클릭업데이트 하기
		dao.updateClick(no);

		return dao.selectByNo(no);
	}

	@Override
	public int selectCommentTotal(int no) {
		return dao.selectCommentTotal(no);
	}

	@Override
	public Map getFreeBoardList(int page) {
		HashMap<String, Object> map = new HashMap();
		List<FreeBoard> list = dao.selectCurrentPage(page);
		map.put("list", list);
		PagingBean pageBean = new PagingBean(page, dao.selectTotal());
		map.put("pageBean", pageBean);
		return map;
	}

	@Override
	public Map getTermsFreeBoardList(int page, String category, String content) {
		HashMap<String, Object> map = new HashMap();
		List<FreeBoard> list = null;
		PagingBean pageBean = null;
		
		// category는 검색 기준입니다.
		if (category.equals("제목")) {
			System.out.println("if 제목 실행");
			list = dao.selectByTitle(page, content);
			pageBean = new PagingBean(page, dao.selectTitleTotal(content));
			
		} else if (category.equals("작성자")) {
			System.out.println("if 작성자 실행");
			list = dao.selectByMemberId(page, content);
			System.out.println("Service내용 ::::"+ content);
			System.out.println("Service페이지::::"+page);
			System.out.println("if 작성자 list"+dao.selectByMemberId(page, content));
			pageBean = new PagingBean(page, dao.selectMemberIdTotal(content));
		
		}
		
		map.put("list", list);
		map.put("pageBean", pageBean);
		System.out.println("Service카테고리:"+category);
		System.out.println("총페이지:"+pageBean.getTotalPage());
		System.out.println("작성자"+dao.selectMemberIdTotal(content));
		System.out.println("제목:"+dao.selectTitleTotal(content));
		return map;
	}

}
