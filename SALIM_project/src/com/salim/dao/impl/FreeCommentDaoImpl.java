package com.salim.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.FreeCommentDao;
import com.salim.vo.FreeComment;

@Repository
public class FreeCommentDaoImpl  implements FreeCommentDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private String make(String tagId){
		return "freeCommentMapper."+tagId;
	}
	
	@Override
	public void comRegister(FreeComment comment) {
		session.insert(make("comRegister"),comment);
	}

	@Override
	public void comUpdate(FreeComment comment) {
		session.update(make("comUpdate"),comment);
	}

	@Override
	public int comGroupUp() {
		return session.selectOne(make("comGroupUpdate"));
	}
	
	@Override
	public void comDelete(int id) {
		session.delete(make("comDelete"),id);
	}
	
	@Override
	public int selectCommentTotal(int no) {
		return session.selectOne(make("selectCommentTotal"),no);
	}

	

}
