package com.salim.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.TipBoardDao;
import com.salim.service.TipBoardService;
import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

import page.page;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	@Autowired
	private TipBoardDao dao;
	


	@Override
	public void tipUpdate(TipBoard tipboard) {
		dao.tipUpdate(tipboard);
	
	}

	@Override
	public void clickUpdateint(TipBoard tipboard) {
		dao.tipUpdate(tipboard);
		
	}

	@Override
	public void goodUpdate(TipBoard tipboard) {
		dao.tipUpdate(tipboard);
		
	}

	@Override
	public int tipDelete(int no) {
		dao.tipDelete(no);
		return tipDelete(no);
		
	}

	@Override
	public int selectTotal(int no) {
		dao.selectByNo(no);
		return selectTotal(no);
	}

	

	@Override
	public int selectByNo(int no) {
		dao.selectByNo(no);
		return selectByNo(no);
	}

	@Override
	public int selectCommentTotal(int value) {
		dao.selectCommentTotal(value);
		return selectCommentTotal(value);
	}

	@Override
	public List<TipBoard> selectCurrentPage(int no,Map map) {
		dao.selectCurrentPage(map);
		return selectCurrentPage(no, map);
	}




	@Override
	public Map getTipListBoard(int page) {
		dao.getTipBoardList(page);
		return getTipListBoard(page);
	}

	@Override
	public void tipinsert(TipBoard tipboard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void tipInsert(TipBoard tipboard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodUpdate(int no, int i) {
		// TODO Auto-generated method stub
		
	}




	

	
	


	


	



	



	



	


}
	