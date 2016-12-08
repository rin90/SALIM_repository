package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.Income;

public interface IncomeService {

	//수입을 저장 및 수정
	void saveIncome(List<Income> incomeList);
	
	//수입을 삭제
	void deleteIncome(List<Integer> incomeIdList, String memberId);
	
	//수입 조회
	List<Income> selectIncome(Map map);
		
	
}
