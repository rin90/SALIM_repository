package com.salim.service;

import java.util.Date;
import java.util.Map;

import com.salim.vo.Budget;

public interface BudgetService {
	
	/*
	 * 로그인했으면 예산 작성하게 만들기.
	 * 예산 삭제는 불가능 하나의 로직으로 만들어보자
	 * 특정 월에 예산 작성을 신청하면, 예산을 생성 - 아무 내용이 없어도 디폴트값 0을 넣는다고 생각하자.
	 * 예산을 작성할 떄 처음 그 달을 클릭하면 예산을 생성. 해당월이 이후의 월이 아니면 클릭해서 수정 불가능. - 저장버튼을 눌러서 저장하게 만들자
	 * 리턴 값은 boolean으로 성공했는지 여부 체크하고, 매개변수는 예산 여러달을 작성해서 저장할 수 있으므로 List로 받자
	 */
	
	//예산 저장 & 수정
	void saveBudget(Budget budget);
	
	//예산 조회
	Map findBudget(String memberId, Date budgetDate);//memberId, 해당 월
	
}
