package com.salim.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.TipBoardDao;
import com.salim.vo.FreeBoard;
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
	public void clickUpdateint(TipBoard tipboard) {
		session.update("tipUpdate",tipboard);
		
	}

	@Override
	public int goodUpdate(int no) {
		return session.update("tipUpdate",no);
		
	}

	@Override
	public void tipDelete(int no) {
		session.delete("tipDelete",no);
		
		
	}

	@Override
	public int selectTotal(int no) {
		
		return session.selectOne("selectTotal" ,no);
	}

	@Override
	public List<TipBoard> selectCurrentPage( Map map) {
		
		return session.selectList("selectCurrentPage",map);
	}

	@Override
	public int selectByNo(int no) {

		return 		session.selectOne("selectByNo",no);
	}

	@Override
	public int selectCommentTotal(int value) {
		
		return session.selectOne("selectCommentTotal",value);
	}

	@Override
	public void tipInsert(TipBoard tipboard) {
		session.insert("tipInsert",tipboard);
		
	}

	@Override
	public Map getTipBoardList(int page) {
		Map map = new HashMap<>();
		return map;
	

}




	@Override
	public void goodUpdate(TipBoard tipboard) {
		// TODO Auto-generated method stub
		
	}

	
	




	

	}



	



	





