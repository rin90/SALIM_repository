package com.salim.service;

import java.util.List;

import com.salim.vo.Bank;

public interface BankService {

	//추가
	public void addBank(Bank bank);
	
	//삭제
	public void deleteBank(List<Integer> bankId);
	
	//수정
	public void modify(Bank bank);
	
	//조회
	List findBankByMemberId(String memberId);
	
}
