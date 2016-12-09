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
	
	//삽입
	public int insertExpense(Expense expense) {
		return session.insert("expenseMapper.insertExpense", expense);
	}

	//수정
	public int updateExpense(Expense expense) {
		return session.update("expenseMapper.updateExpense", expense);
	}

	//삭제
	public int deleteExpense(Map map) {	//int expenseId, memberId
		return session.delete("expenseMapper.deleteExpense", map);
	}

	//조회
	public List<Expense> selectExpenseList(Map map) {
		return session.selectList("expenseMapper.selectExpenseDate", map);
	}

	// 월 보고서용	-> selectMap사용법 확인 요망
	@Override
	public Map<String, Integer> selectSpendEachCategory(Map map) {
		return session.selectMap("expenseMapper.selectSpendEachCategory", map, "category");
	}
	
	
}
