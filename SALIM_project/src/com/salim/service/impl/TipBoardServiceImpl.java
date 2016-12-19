package com.salim.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.TipBoardDao;
import com.salim.service.TipBoardService;
import com.salim.util.PagingBean;
import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

import page.page;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	@Autowired
	private TipBoardDao dao;

	@Override
	public void tipInsert(TipBoard tipboard) {
		dao.tipInsert(tipboard);
	}

	@Override
	public void tipUpdate(TipBoard tipboard) {
		dao.tipUpdate(tipboard);

	}

	@Override
	public TipBoard clickUpdateint(int no) {

		dao.clickUpdateint(no);
		return dao.selectByNo(no);
	}

	@Override
	public void goodUpdate(int no, int num) {

		dao.goodUpdate(no, num);
	}

	@Override
	public void tipDelete(int no) {
		dao.tipDelete(no);

	}

	public TipBoard ModelAndselectByNo(int no) {

		return dao.selectByNo(no);
	}

	@Override
	public TipBoard selectByNo(int no) {
		dao.clickUpdateint(no);
		return dao.selectByNo(no);
	}

	@Override // 글목록 페이징처리
	public Map getTipListBoard(int page) {
		HashMap<String, Object> map = new HashMap();
		List<TipBoard> list = dao.selectCurrentPage(page);
		map.put("list", list);
		PagingBean pageBean = new PagingBean(page, dao.selectTotal());
		map.put("pageBean", pageBean);
		return map;
	}

	public Map getTermsTipListBoard(int page, String category, String content) {
		HashMap<String, Object> map = new HashMap();
		List<TipBoard> list = null;
		PagingBean pageBean = null;

		// category는 검색 기준입니다.
		if (category.equals("제목")) {
			
			System.out.println("제목 실행");
			
			list = dao.selectByTitle(page, content);
			
			pageBean = new PagingBean(page, dao.selectTitleTotal(content));
		

		} else if (category.equals("작성자")) {
			
			System.out.println("if 작성자 실행");
			
			list = dao.selectByMemberId(page, content);
			
			pageBean = new PagingBean(page, dao.selectByMemberIdTotal(content));

		} else if (category.equals("분류")) {
			
			System.out.println("분류 실행");
			
			list = dao.selectByClassification(content, page);
			
			pageBean = new PagingBean(page,dao.selectClassificationTotal(content));
			
		}

		map.put("list", list);
		map.put("pageBean", pageBean);

		return map;
	}

}
