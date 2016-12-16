package com.salim.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.salim.dao.TipBoardDao;
import com.salim.util.Constants;
import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

@Repository
public class TipBoardDaoImpl implements TipBoardDao{
	
	@Autowired
	private SqlSessionTemplate session;

	public String make(String id) {
		return "tipMapper."+id;
	}
	

	

	@Override
	public void clickUpdateint(int no) {
		session.update(make("clickUpdate"),no);
	}
	

	@Override
	public int goodUpdate(int no ,int  num) {
		HashMap map = new HashMap();
		map.put("no", no);
		map.put("num", num);
		return session.update("goodUpdate",map);
		
	}

	@Override
	public void tipDelete(int no) {
		session.delete(make("tipDelete"),no);
	}

	@Override
	public int selectTotal() {
		
		return session.selectOne(make("selectTotal"));
	}

	@Override
	public List<TipBoard> selectCurrentPage(int page) {
		HashMap map = new HashMap();
		map.put("currentPage", Constants.ITEMS);
		map.put("page",page);
		return session.selectList(make("selectCurrentPage"),map);
	}

	

	

	@Override
	public TipBoard selectByNo(int no) {

		return 	session.selectOne(make("selectByNo"),no);
	}

	@Override
	public int selectCommentTotal(int content) {
		return session.selectOne("selectTitleTotal",content);
	}



	



	



	@Override
	public List<TipBoard> selectByTitle(int page, String content) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page", page);
		map.put("title", content);
		return session.selectList(make("selectByTitle"),map);
	}


	@Override
	public int selectCommentTotal(String content) {
		return session.selectOne(make("selectTotal"));
	}
		

	


	@Override
	public int selectMemberIdTotal(String content) {
		return session.selectOne(make("selectTitleTotal"),content);
	
	}




	@Override
	public void tipUpdate(TipBoard tipboard) {
		session.update(make("tipUpdate"),tipboard);
		
	}




	

	@Override
	public void tipInsert(TipBoard tipboard) {
		session.insert(make("tipInsert"),tipboard);
	}

	@Override
	public List<TipBoard> selectByMemberId(int page,String content) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page", page);
		map.put("memberId", content);
		System.out.println("DAO내용 ::::"+ content);
		System.out.println("DAO페이지::::"+page);
		System.out.println("DAO 작성자 실행");
		System.out.println("DAO::::::::::"+session.selectList(make("selectByMemberid"),map));
		return session.selectList(make("selectByMemberid"),map);
	}




	@Override
	public List<TipBoard> selectTitleTotal(int no ,int page){
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("no", no);
		map.put("page", page);
		return session.selectList(make("selectTitleTotal"),map);
	}






	

    









	

	}



	



	





