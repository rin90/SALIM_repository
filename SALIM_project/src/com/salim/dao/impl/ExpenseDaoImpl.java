package com.salim.dao.impl;

import java.util.Date;
import java.util.HashMap;
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

	// 월 보고서용	- 대분류 기준 조회
	public List selectSpendEachCategory(Map map) {
		return session.selectList("expenseMapper.selectSpendEachCategory", map);
	}

	@Override	// 한 달 동안
	public List selectSpendDuringMonth(Map map) {
		return session.selectList("expenseMapper.selectSpendDuringMonth", map);
	}

	@Override	// 일 년
	public List selectSpendEachMonth(Map map) {
		return session.selectList("expenseMapper.selectSpendEachMonth", map);
	}

	@Override
	public List selectTotalMonthReport(Map map) {
		return session.selectList("expenseMapper.selectTotalMonthReport", map);
	}

	
	/*============================================
		일일 사용 내역 총액
	  ============================================*/
	@Override	
	public int selectDayExpense(Map map) {
		Object result = session.selectOne("expenseMapper.selectDayExpense", map);
		return (result==null)?0:(Integer)result;
	}
	/*========================================
 		한달 동안 지출 누계
 	=========================================*/
	@Override
	public int selectForOneMonthExpense(Map map) {
		return session.selectOne("expenseMapper.selectForOneMonthExpense", map);
	}

	//memberId로 지출 삭제
	@Override
	public int deleteExpenseByMemberId(String memberId) {
		return session.delete("expenseMapper.deleteExpenseByMemberId", memberId);
	}
	
	
	
}
