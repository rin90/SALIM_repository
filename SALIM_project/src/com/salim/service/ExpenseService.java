package com.salim.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ExpenseService {

	//지출 저장, 수정
	void saveExpense(String memberId, 
					 ArrayList<Integer> expenseId, 
					 ArrayList<String> expenseExplain, 
					 ArrayList<Integer> cashExpense, 
					 ArrayList<Integer> cardExpense, 
					 ArrayList<Integer> codeId, 
					 Date expenseDate, 
					 String content, 
					 int no);
	
	//지출 조회
	Map selectExpense(String memberId, Date expenseDate);
	
	//지출 삭제
	void deleteExpense(List<Integer> expenseIdList, String memberId);//List<Integer> expenseIdList, memberId
	
	
}
