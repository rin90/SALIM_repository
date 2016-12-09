package com.salim.dao;



import java.util.List;
import java.util.Map;

import com.salim.vo.Income;

public interface IncomeDao {
	
	//수입을 작성
	int insertIncome(Income income);
	
	//수입을 수정
	int updateIncome(Income income);
	
	//수입을 삭제
	int deleteIncome(Map map);
	
	//수입을 조회
	List<Income> selectIncomeList(Map map);
}
