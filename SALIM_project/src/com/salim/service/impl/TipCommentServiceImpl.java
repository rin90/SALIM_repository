package com.salim.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.TipCommentDao;
import com.salim.service.TipCommentService;
import com.salim.vo.FreeComment;

@Service
public class TipCommentServiceImpl implements TipCommentService{
	
	@Autowired
	private TipCommentDao dao;
	
	@Override
	public void comRegister(FreeComment comment) {
		dao.comRegister(comment);
	}

	@Override
	public void comUpdate(FreeComment comment) {
		dao.comUpdate(comment);
	}

	@Override
	public int comGroupUp() {
		return dao.comGroupUp();
	}

	@Override
	public void comDelete(int id) {
		dao.comDelete(id);
	}

	@Override
	public int selectCommentTotal(int no) {
		return dao.selectCommentTotal(no);
	}


}
