package com.salim.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.BudgetDao;
import com.salim.vo.Budget;

@Repository
public class BudgetDaoImpl implements BudgetDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertBudget(Budget budget) {
		return session.insert("budgetMapper.insertBudget", budget);
	}

	@Override
	public int updateBudget(Budget budget) {
		return session.update("budgetMapper.updateBudget", budget);
	}

	@Override
	public Budget selectBudget(Map map) {
		return session.selectOne("budgetMapper.selectBudget", map);
	}

	@Override
	public int deleteBudgetBymemberId(String memberId) {
		return session.delete("budgetMapper.deleteBudgetBymemberId", memberId);
	}
	
	
	
}
