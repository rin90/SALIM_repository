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
	public FreeBoard selectByNo(int no) {
		return session.selectOne(make("selectByNo"),no);
	}

	@Override
	public int selectCommentTotal(int no) {
		return session.selectOne(make("selectCommentTotal"),no);
	}
	
	@Override
	public List<FreeBoard> selectCurrentPage(int page) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page",page);
		return  session.selectList(make("selectCurrentPage"),map);
	}
	
	@Override
	public List<FreeBoard> selectByMemberId(int page,String content) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page", page);
		map.put("memberId", content);
		return session.selectList(make("selectByMemberid"),map);
	}
	
	@Override
	public List<FreeBoard> selectByTitle(int page,String content) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page", page);
		map.put("title", content);
		return session.selectList(make("selectByTitle"),map);
	}
	
	@Override
	public int selectTotal() {
		return session.selectOne(make("selectTotal"));
	}
	
	@Override
	public int selectTitleTotal() {
		return session.selectOne(make("selectTitleTotal"));
	}
	
	@Override
	public int selectMemberIdTotal() {
		return session.selectOne(make("selectMemberIdTotal"));
	}
	
	
	
}
