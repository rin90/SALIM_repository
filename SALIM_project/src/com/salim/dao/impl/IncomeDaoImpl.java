package com.salim.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.IncomeDao;
import com.salim.vo.Income;

@Repository
public class IncomeDaoImpl implements IncomeDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	//삽입
	public int insertIncome(Income income) {
		return session.insert("incomeMapper.insertIncome", income);
	}

	//수정
	public int updateIncome(Income income) {
		return session.update("incomeMapper.updateIncome", income);
	}

	//삭제
	public int deleteIncome(Map map) { //map => memberId와 incomeId
		return session.delete("incomeMapper.deleteIncome", map);
	}

	//조회
	public List<Income> selectIncomeList(Map map) { // map => memberId 와 incomeDate
		return session.selectList("incomeMapper.selectIncomeDate", map);
	}

	@Override
	public List selectImportEachMonth(Map map) {
		return session.selectList("incomeMapper.selectImportEachMonth", map);
	}

	@Override
	public List selectImportEachCategory(Map map) {
		return session.selectList("incomeMapper.selectImportEachCategory", map);
	}
	
}
