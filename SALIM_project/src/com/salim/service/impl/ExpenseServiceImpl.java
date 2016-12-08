package com.salim.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.ExpenseDao;
import com.salim.service.ExpenseService;
import com.salim.vo.Expense;

@Service
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	private ExpenseDao dao;

	//저장 및 수정
	public void saveExpense(List<Expense> expenseList) {

		//expenseId가 기존에 있으면 update, expenseId가 없으면 insert를 실행
		for(int i=0; i<expenseList.size(); i++){
			Expense expense = expenseList.get(i);
			if(expense.getExpenseId()!=0){
				dao.updateExpense(expense);
			}else{
				dao.insertExpense(expense);
			}
		}
	}

	//조회
	public List<Expense> selectExpense(Map map) {
		return dao.selectExpenseList(map);
	}

	//삭제
	public void deleteExpense(List<Integer> expenseIdList) {

		for(int i=0; i<expenseIdList.size(); i++){
			if(expenseIdList.get(i)==0){//null을 넣어줄까 말까??? 생각좀
				expenseIdList.remove(i);
			}
			dao.deleteExpense(expenseIdList.get(i));
		}
	}
	
	
}
