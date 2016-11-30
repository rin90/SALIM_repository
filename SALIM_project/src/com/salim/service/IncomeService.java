package com.salim.service;

import java.util.List;

import com.salim.vo.Income;

public interface IncomeService {

	/*회원이 로그인해있으면, 삽입, 수정, 삭제 가능. - 저장 버튼을 누르면 기존에 없으면 삽입, 있으면 수정, 체크박스로 삭제 가능(선택삭제 버튼 별도 존재),
	 성공했는지 여부 boolean으로 리턴, 매개변수는 작성된 하나의 로우단위로 값이 있는지 체크해서 저장할 것인지 수정할 것인지 선택하기, 
	 커밋은 버튼 누르는 것을 기준으로 하기. 매개변수는 하나의 로우 단위로 리스트를 받기 - 하나의 income*/
		
	boolean saveIncome(List<Income> incomeList);
		
	
}
