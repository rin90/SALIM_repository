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

	public int insertIncome(Income income) {
		System.out.println("DAO까지 왔다감");
		return session.insert("incomeMapper.insertIncome", income);
	}

	@Override
	public int updateIncome(Income income) {
		return session.update("incomeMapper.updateIncome", income);
	}

	@Override
	public int deleteIncome(int incomeId) {
		return session.delete("incomeMapper.deleteIncome", incomeId);
	}

	@Override
	public List<Income> selectIncomeList(Map map) { // map => memberId 와 incomeDate
		return session.selectList("incomeMapper.selectIncomeDate", map);
	}
	
}
