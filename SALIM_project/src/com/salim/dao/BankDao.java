package com.salim.dao;

import java.util.List;

import com.salim.vo.Bank;

public interface BankDao {
	
	/**
	 * 카드 추가
	 * 
	 * @param bank
	 * @return
	 */
	int insertBank(Bank bank);
	
	/**
	 * 카드 업데이트
	 * 
	 * @param bank
	 * @return
	 */
	int updateBankByMemberId(Bank bank);
	
	/**
	 * 카드 삭제
	 * @param BankId
	 * @return
	 */
	int deleteBankByBankId(int bankId);
	
	/**
	 * 카드 선택(select)
	 * @param BankId
	 * @return
	 */
	List selectBankByMemberId(String memberId);
	
	//memberId로 삭제
	int deleteBankByMemberId(String memberId);
}
