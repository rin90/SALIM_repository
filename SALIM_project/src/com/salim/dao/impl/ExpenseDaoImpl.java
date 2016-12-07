package com.salim.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.ExpenseDao;
import com.salim.vo.Expense;

@Repository
public class ExpenseDaoImpl implements ExpenseDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertExpense(Expense expense) {
		return session.insert("expenseMapper.insertExpense", expense);
	}

	@Override
	public int updateExpense(Expense expense) {
		return session.update("expenseMapper.updateExpense", expense);
	}

	@Override
	public int deleteExpense(int expenseId) {
		return session.delete("expenseMapper.deleteExpense", expenseId);
	}

	@Override
	public List<Expense> selectExpenseList(Map map) {
		return session.selectList("expenseMapper.selectExpenseDate", map);
	}
	
	
}
