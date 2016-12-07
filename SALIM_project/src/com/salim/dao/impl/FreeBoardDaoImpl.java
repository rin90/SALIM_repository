package com.salim.dao.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.FreeBoardDao;
import com.salim.util.Constants;
import com.salim.vo.FreeBoard;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	public String make(String id){
		return "freeMapper."+id;
	}
	@Override
	public void insertFree(FreeBoard freeBoard) {
		session.insert(make("freeInsert"),freeBoard);
	}

	@Override
	public void updateFree(FreeBoard freeBoard) {
		session.update(make("freeUpdate"),freeBoard);
	}

	@Override
	public void updateClick(int no) {
		session.update(make("clickUpdate"),no);
	}

	@Override
	public void updateGood(int no) {
		session.update(make("goodUpdate"),no);
	}

	@Override
	public void deleteFree(int no) {
		session.delete(make("freeDelete"),no);
	}

	@Override
	public int selectTotal() {
		return session.selectOne(make("selectTotal"));
	}

	@Override
	public List<FreeBoard> selectCurrentPage(int page) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page",page);
		return  session.selectList(make("selectCurrentPage"),map);
	}

	@Override
	public List<FreeBoard> selectByTitle(String title) {
		return session.selectList(make("selectTitle"),title);
	}

	@Override
	public FreeBoard selectByNo(int no) {
		return session.selectOne(make("selectByNo"),no);
	}

	@Override
	public int selectCommentTotal(int no) {
		return session.selectOne(make("selectCommentTotal"),no);
	}
	
	
}
