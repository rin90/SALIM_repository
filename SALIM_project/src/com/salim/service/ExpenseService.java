package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.Expense;

public interface ExpenseService {

	//지출 저장, 수정
	void saveExpense(List<Expense> expenseList);
	
	//지출 조회
	List<Expense> selectExpense(Map map);
	
	//지출 삭제
	void deleteExpense(List<Integer> expenseIdList, String memberId);//List<Integer> expenseIdList, memberId
	
	
}
