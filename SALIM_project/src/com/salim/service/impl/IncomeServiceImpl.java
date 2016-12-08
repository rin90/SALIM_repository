package com.salim.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.IncomeDao;
import com.salim.service.IncomeService;
import com.salim.vo.Income;

@Service
public class IncomeServiceImpl implements IncomeService{
	
	@Autowired
	private IncomeDao dao;

	
	//저장 & 수정
	public void saveIncome(List<Income> incomeList) {
		for(int i=0; i<incomeList.size(); i++){
			Income income = incomeList.get(i);
			if(income.getIncomeId() == 0){
				dao.insertIncome(income);
			}else{
				dao.updateIncome(income);
			}
		}	
	}


	//조회
	public List<Income> selectIncome(Map map) {//map으로 memberId와 incomeDate를 받음.
		return dao.selectIncomeList(map);
	}

	//삭제
	public void deleteIncome(List<Integer> incomeIdList, String memberId) {
		Map map = new HashMap();
		for(int i=0; i<incomeIdList.size(); i++){
			if(incomeIdList.get(i) == 0 || incomeIdList.get(i) == null){
				incomeIdList.remove(i);
			}
			map.put("incomeId", incomeIdList.get(i));
			map.put("memberId", memberId);
			dao.deleteIncome(map);
		}
	}


	
}
