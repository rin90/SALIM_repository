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
public class FreeBoardServiceImpl implements FreeBoardService{
	
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
	public void updateClick(int no) {
		dao.updateClick(no);
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
	public List<FreeBoard> selectByTitle(String title) {
		return dao.selectByTitle(title);
	}

	@Override
	public FreeBoard selectByNo(int no) {
		return dao.selectByNo(no);
	}

	@Override
	public int selectCommentTotal(int no) {
		return dao.selectCommentTotal(no);
	}

	@Override
	public Map getFreeBoardList(int page) {
		HashMap<String,Object> map = new HashMap();
		List<FreeBoard> list = dao.selectCurrentPage(page);
		map.put("list", list);
		PagingBean pageBean = new PagingBean(page, dao.selectTotal());
		map.put("pageBean", pageBean);
		return map;
	}
}
