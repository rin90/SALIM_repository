package com.salim.service.impl;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.BudgetDao;
import com.salim.dao.ExpenseDao;
import com.salim.dao.IncomeDao;
import com.salim.service.BudgetService;
import com.salim.vo.Budget;

@Service
public class BudgetServiceImpl implements BudgetService{
	
	@Autowired
	private BudgetDao dao;
	@Autowired
	private ExpenseDao expenseDao;
	@Autowired
	private IncomeDao incomeDao;

	//예산 저장 & 수정    - 수정가능한 이번달고 미래달, 수정불가한 과거달 조회만 가능
	public void saveBudget(Budget budget) {
		
		int sumbmit = budget.getFoodExpenses()+budget.getDwellingCommunication()+budget.getHouseholdgoods()
					 +budget.getClothBeauty()+budget.getHealthCulture()+budget.getEducationParenting()
					 +budget.getTrafficVehicle()+budget.getHolidayDues()+budget.getTaxInterest()
					 +budget.getPinmoneyEtc()+budget.getSavingInsurance()+budget.getCreditCard()
					 +budget.getUnclassified();
		budget.setBudget(sumbmit);
		
		if(budget.getNum()==0){
			dao.insertBudget(budget);			
		}else{
			dao.updateBudget(budget);
		}
		
	}

	//예산 조회
	public Map findBudget(String memberId, Date budgetDate) {	
		
		//예산조회 - map -> memberId, 조회할 년도와 월 budgetDate
		Map param = new HashMap();
		param.put("memberId", memberId);
		param.put("budgetDate", budgetDate);
		param.put("month", new SimpleDateFormat("yyyy-MM").format(budgetDate));
		param.put("monthday", new SimpleDateFormat("yyyy-MM").format(new Date(budgetDate.getTime() - 2629800000L)));
		
		Budget budget = dao.selectBudget(param);
		
		int budgetNum=0;
		if(budget != null){
			budgetNum = budget.getNum();
		}
		
		//지출조회 - map -> memberId, month -> 대분류 기준별 금액
		List categoryExpense  = expenseDao.selectSpendEachCategory(param);
		//전달 수입 조회
		int monthIncome = incomeDao.selectForOneMonthIncome(param);
		//한달 총 지출 조회
		List monthExpense = expenseDao.selectSpendDuringMonth(param);
		
		Map result = new HashMap();
		result.put("budget", budget);
		result.put("categoryExpense", categoryExpense);
		result.put("monthExpense", monthExpense);
		result.put("budgetNum", budgetNum);
		result.put("monthIncome", monthIncome);
		
		result.put("monthIncomeFormat", new DecimalFormat("#,###").format(monthIncome));
		//result.put("budgetFormat", new DecimalFormat("#,###").format((budget==null? 0:budget.getBudget())));
		
		//NumberUtil.getCurrencyNationNumber(123456.123, 3) 
		
		System.out.println("전달 수입 - "+monthIncome);
		
		
		return result;
	}
	
	
	
}
