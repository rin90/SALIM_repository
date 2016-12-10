package com.salim.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.BudgetDao;
import com.salim.service.BudgetService;
import com.salim.vo.Budget;

@Service
public class BudgetServiceImpl implements BudgetService{
	
	@Autowired
	private BudgetDao dao;

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
	public Budget findBudget(Map map) {	//map -> memberId, 조회할 년도와 월
		return dao.selectBudget(map);
	}
	
	
	
}
