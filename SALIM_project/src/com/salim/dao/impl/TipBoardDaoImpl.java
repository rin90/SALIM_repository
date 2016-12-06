package com.salim.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.TipBoardDao;
import com.salim.vo.TipBoard;

@Repository
public class TipBoardDaoImpl implements TipBoardDao{
	
	@Autowired
	private SqlSessionTemplate session;
   
	

	@Override
	public void tipUpdate(TipBoard tipboard) {
		session.update("tipUpdate",tipboard);
		
	}

	@Override
	public TipBoard clickUpdateint(TipBoard tipboard) {
		session.update("tipUpdate",tipboard);
		return tipboard;
	}

	@Override
	public void goodUpdate(TipBoard tipboard) {
		session.update("tipUpdate",tipboard);
		
	}

	@Override
	public void tipDelete(int no) {
		session.delete("tipDelete",no);
		
		
	}

	@Override
	public int selectTotal(int no) {
		session.selectOne("selectTotal" ,no);
		return selectTotal(no);
	}

	@Override
	public List<TipBoard> selectCurrentPage( Map map) {
		session.selectList("selectCurrentPage",map);
		return selectCurrentPage(map);
	}

	@Override
	public int selectByNo(int no) {
		session.selectOne("selectByNo",no);
		return selectByNo(no);
	}

	@Override
	public int selectCommentTotal(int value) {
		session.selectOne("selectCommentTotal",value);
		return selectCommentTotal(value);
	}

	@Override
	public void tipInsert(TipBoard tipboard) {
		session.insert("tipInsert",tipboard);
		
	}

	@Override
	public Map getTipBoardList(int page) {
		session.selectList("TipBoardList",page);
		return null;
	}

	



	



	





	
}
