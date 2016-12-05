package com.salim.service.impl;

import java.util.ArrayList;
import java.util.Date;
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

	
	
	/*
	 * 로그인 했는지 여부는 interceptor로 따로 빼서 controller메소드 실행 전에 로그인 했는지 체크하기.
	 * 로그인이 되었다는 가정하에... 새로 생성, 수정 가능하게 만들기. - 금액을 입력하지않으면 디폴트 값으로 0을 입력.
	 * 리턴을 새로 저장된 값 저장, 삭제된 후 조회한 list값 조회해서 다시 리턴 -> 나중에 활용하라고.
	 * 회원이 로그인해있으면, 삽입, 수정, 삭제 가능. - 저장 버튼을 누르면 기존에 없으면 삽입, 있으면 수정, 체크박스로 삭제 가능(선택삭제 버튼 별도 존재),
	 성공했는지 여부 boolean으로 리턴, 매개변수는 작성된 하나의 로우단위로 값이 있는지 체크해서 저장할 것인지 수정할 것인지 선택하기, 
	 커밋은 버튼 누르는 것을 기준으로 하기. 매개변수는 하나의 로우 단위로 리스트를 받기 - 하나의 income*/
	
	public void saveIncome(List<Income> incomeList) {
		
		//로그인 확인을 interceptor로 체크한 후
		
		//받은 list에서 수입을 빼와서 저장하자
		for(int i=0; i<incomeList.size(); i++){
			Income income = incomeList.get(i);
			if(income.getIncomeId() == 0){
				dao.insertIncome(income);
			}else{
				dao.updateIncome(income);
			}
		}
	}


	@Override
	public List<Income> selectIncome(Map map) {//map으로 memberId와 incomeDate를 받음.

		//로그인 했는지 interceptor로 확인
		
		//조회해서 나온 incoem list를 리턴 - 화면에 뿌려주기
		return dao.selectIncomeList(map);
		
	}

	@Override
	public void deleteIncome(List<Income> incomeList) {
		
		//로그인 했는지 interceptor로 확인
		
		//income id를 뽑아서 dao의 delete 실행시키기
		for(int i=0; i<incomeList.size(); i++){
			dao.deleteIncome(incomeList.get(i).getIncomeId());
		}
	}
	
}
