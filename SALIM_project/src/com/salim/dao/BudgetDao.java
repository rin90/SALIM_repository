package com.salim.dao;

import java.util.Map;

import com.salim.vo.Budget;

public interface BudgetDao {
	
	//예산 작성
	int insertBudget(Budget budget);
	
	//예산 수정
	int updateBudget(Budget budget);
	
	//예산 조회
	Budget selectBudget(Map map);
	
}
