package com.salim.service.impl;

import com.salim.vo.Bank;

public interface BankService {

	/**
	 * 멤버에 저장된 통장을 찾아주는 메서드.
	 * 
	 * @param MemberId
	 * @return
	 */
	Bank findBankByMemberId(String MemberId);
}
