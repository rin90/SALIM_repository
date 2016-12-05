package com.salim.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.TipBoardDao;
import com.salim.service.TipBoardService;
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
	public TipBoard clickUpdateint(TipBoard tipboard) {
		dao.tipUpdate(tipboard);
		return null;
	}

	@Override
	public void goodUpdate(TipBoard tipboard) {
		dao.tipUpdate(tipboard);
		
	}

	@Override
	public void tipDelete(int no) {
		dao.tipDelete(no);
		
	}

	@Override
	public int selectTotal(int no) {
		dao.selectByNo(no);
		return 0;
	}

	@Override
	public List<TipBoard> selectCurrentPage(int no, Map map) {
		dao.selectCurrentPage(no, map);
		return null;
	}

	@Override
	public int selectByNo(int no) {
		dao.selectByNo(no);
		return 0;
	}

	@Override
	public int selectCommentTotal(int value) {
		dao.selectCommentTotal(value);
		return 0;
	}

	@Override
	public int updateBoard(TipBoard board, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TipBoard findBySeq(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteView(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int BoardDelete(int seq, String storPass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertTipBoard(TipBoard tipboard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TipBoard> tipboardList(String keyField, String keyWord) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TipBoard pagingProc(int i, int j, int size) {
		// TODO Auto-generated method stub
		return null;
	}
}