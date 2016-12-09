package com.salim.dao;

import java.util.List;
import java.util.Map;

import com.salim.vo.Expense;

public interface ExpenseDao {
	
	//지출 작성
	int insertExpense(Expense expense);
	
	//지출수정
	int updateExpense(Expense expense);
	
	//지출 삭제
	int deleteExpense(Map map);
	
	//지출 조회 - 조회해야하는 회원id, 지출일을 조회
	List<Expense> selectExpenseList(Map map);
	
	
	// 보고서용 - 대분류기준 지출 내역 가져오기. 
	List selectSpendEachCategory(Map map);
}

