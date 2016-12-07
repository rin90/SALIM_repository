package com.salim.service;

import java.util.List;

import com.salim.vo.Expense;

public interface ExpenseService {

	/*
	 * 회원이 로그인되어있으면 수행가능하게 로그인 여부 체크, 기존의 로우에 값이 있으면 수정, 없으면 삽입, 삭제는 버튼으로 수정과 삽입의 저장은 저장버튼으로, 
	 * 리턴 타입은 성공했는지 boolean으로 받기, 실패했으면 오류로 인해 저장에 실패했다고 띄우고 처음으로 돌아간 화면 띄워주기, 
	 * 매개변수는 expense를 여러개 받는 것으로..
	 */
	boolean saveExpense(List<Expense> expenseList);
	
	
}
