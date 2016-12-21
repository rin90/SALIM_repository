package com.salim.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.TipBoardDao;
import com.salim.util.Constants;
import com.salim.vo.TipBoard;

@Repository
public class TipBoardDaoImpl implements TipBoardDao{
	
	@Autowired
	private SqlSessionTemplate session;

	public String make(String id) {
		return "tipMapper."+id;
	}
	

	@Override
	public void tipInsert(TipBoard tipboard) {
		session.insert(make("tipInsert"),tipboard);
	}


	@Override
	public void tipUpdate(TipBoard tipboard) {
		session.update(make("tipUpdate"),tipboard);
		
	}
	
	@Override
	public void clickUpdateint(int no) {
		session.update(make("clickUpdate"),no);
	}

	@Override
	public void tipDelete(int no) {
		session.delete(make("tipDelete"),no);
	}

	
	@Override
	public TipBoard selectByNo(int no) {
		return 	session.selectOne(make("selectByNo"),no);
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
	public int selectTitleTotal(String content) {
		System.out.println("dao에서 확인 제목:"+session.selectOne(make("selectTitleTotal"),content));
		return session.selectOne(make("selectTitleTotal"),content);
	
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
	public int selectByMemberIdTotal(String memberId) {
		return session.selectOne(make("selectMemberIdTotal"),memberId);
	}
	
	@Override
	public List<TipBoard> selectByMemberId(int page,String content) {
		HashMap map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("page", page);
		map.put("memberId", content);
		return session.selectList(make("selectByMemberId"),map);
	}


	


	@Override
	public int selectClassificationTotal(String content) {
		return session.selectOne(make("selectByClassificationTotal"),content);
	}


	@Override
	public List<TipBoard> selectByClassification(String content, int page) {
		Map map = new HashMap();
		map.put("current", Constants.ITEMS);
		map.put("classification", content);
		map.put("page", page);
		return session.selectList(make("selectByClassification"),map);
	}










	

    









	

	}



	



	





