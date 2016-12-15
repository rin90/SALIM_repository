package com.salim.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.salim.vo.Expense;

public interface ExpenseDao {
	
	//지출 작성
	int insertExpense(Expense expense);
	
	//지출수정
	int updateExpense(Expense expense);
	
	//지출 삭제
	int deleteExpense(Map map);
	
	//지출 조회 - 조회해야하는 회원id, 지출일을 조회
	List<Expense> selectExpenseList(Map map);//memberId, expenseDate
	
	/*=================== << 일일 일정관련 부분용 >> ======================*/
	int selectDayExpense(Map map);
	
	/*=================== << 보고서용 >> ======================*/
	/**
	 * 1달동안의 대분류기준 지출 내역 가져오기 
	 * @param map		대상ID(memberId), 
	 * 					해당하는 달(month - 형식예: 2016-12)
	 * @return
	 */
	List selectSpendEachCategory(Map map);
	
	/**
	 * 1달동안 사용한 지출금액 (특정달, 특정ID 기준 )
	 * @param map		대상ID(memberId), 
	 * 					해당하는 달(month - 형식예: 2016-12)
	 * @return
	 */
	List selectSpendDuringMonth(Map map);
	
	/**
	 * 1년동안 각각의 달에 지출한 금액의 총합(특정 년도, 특정 ID 기준 )
	 * @param map		대상ID(memberId), 
	 * 					해당하는 년도(year - 형식예 : 2016)
	 * @return	
	 */
	List selectSpendEachMonth(Map map);
	
	/**
	 * 특정 계정의 1년동안의 수입&지출 내역
	 * @param map		대상ID(memberId), 
	 * 					해당하는 년도(year - 형식예 : 2016)
	 * @return	
	 */
	List selectTotalMonthReport(Map map);
}

