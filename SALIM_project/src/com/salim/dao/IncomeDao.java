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
	
	
	
	/*=================== << 보고서용 >> ======================*/
	/**
	 * 1년동안 각각의 달의 수입 금액의 총합 (특정 년도, 특정 ID 기준 )
	 * @param map		대상ID(memberId), 
	 * 					해당하는 년도(year - 형식예 : 2016)
	 * @return
	 */
	List selectImportEachMonth(Map map);
	
	/**
	 * 1달동안 벌어들인 대분류별 지출금액 (특정 달, 특정ID 기준)
	 * @param map 		대상ID(memberId), 
	 * 					해당하는 달(month - 형식예: 2016-12)
	 * @return
	 */
	List selectImportEachCategory(Map map);
	
}
