package com.salim.service;

import java.util.Date;
import java.util.Map;

import com.salim.vo.Budget;

public interface BudgetService {
	
	//예산 저장 & 수정
	void saveBudget(Budget budget);
	
	//예산 조회
	Map findBudget(String memberId, Date budgetDate);//memberId, 해당 월
	
}
