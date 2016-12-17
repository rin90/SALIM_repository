package com.salim.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.salim.vo.Income;

public interface IncomeService {

	//수입을 저장 및 수정
	//Map saveIncome(List<Income> incomeList);
	void saveIncome(String memberId,
				   ArrayList<Integer> incomeId, 
				   ArrayList<String> explanation, 
				   ArrayList<Integer> incomeMoney,
				   ArrayList<Integer> codeId,
				   Date incomeDate,
				   String content,
				   int no);
	
	//수입을 삭제
	void deleteIncome(List<Integer> incomeIdList, String memberId);
	
	//수입 조회
	//List<Income> selectIncome(String memberId, Date incomeDate);
	Map selectIncome(String memberId, Date incomeDate);
	
	
	
	/*=================== << 일일 일정관련 부분용 >> ======================*/
	int selectDayIncome(Map map);
	
}
