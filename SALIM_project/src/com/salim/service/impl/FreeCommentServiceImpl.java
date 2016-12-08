package com.salim.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.FreeCommentDao;
import com.salim.service.FreeCommentService;
import com.salim.vo.FreeComment;

@Service
public class FreeCommentServiceImpl implements FreeCommentService{
	@Autowired
	private FreeCommentDao dao;
	
	@Override
	public void comRegister(FreeComment comment) {
		dao.comRegister(comment);
	}

	@Override
	public void comUpdate(FreeComment comment) {
		dao.comUpdate(comment);
	}

	@Override
	public void comDelete(int id) {
		dao.comDelete(id);
	}

}
