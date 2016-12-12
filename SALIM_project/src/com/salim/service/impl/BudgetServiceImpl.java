package com.salim.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.BudgetDao;
import com.salim.dao.ExpenseDao;
import com.salim.service.BudgetService;
import com.salim.vo.Budget;

@Service
public class BudgetServiceImpl implements BudgetService{
	
	@Autowired
	private BudgetDao dao;
	
	@Autowired
	private ExpenseDao expenseDao;

	//예산 저장 & 수정    - 수정가능한 이번달고 미래달, 수정불가한 과거달 조회만 가능
	public void saveBudget(Budget budget) {
		
		if(budget.getNum()==0){
			System.out.println("=======서비스에 서  인설트 num을 찍어보자"+budget.getNum()+" ========");
			
			dao.insertBudget(budget);			
		}else{
			
			System.out.println("=======서비스에 서 수정 num을 찍어보자"+budget.getNum()+" ========");
			
			dao.updateBudget(budget);
		}
		
	}

	//예산 조회
	public Map findBudget(Map map) {	
		
	
		
		//예산조회 - map -> memberId, 조회할 년도와 월 budgetDate
		Budget budget = dao.selectBudget(map);
		
		//지출조회 - map -> memberId, month -> 대분류 기준별 금액
		Map emap = new HashMap();
		emap.put("memberId", (String) map.get("memberId"));
		emap.put("month", new SimpleDateFormat("yyyy-MM").format((Date) map.get("budgetDate")));
		
		List categoryExpense  = expenseDao.selectSpendEachCategory(emap);
		
		//한달 총 지출 조회
		List monthExpense = expenseDao.selectSpendDuringMonth(emap);
		
		
		Map result = new HashMap();
		result.put("budget", budget);
		result.put("categoryExpense", categoryExpense);
		result.put("monthExpense", monthExpense);
		
		return result;
	}
	
	
	
}
