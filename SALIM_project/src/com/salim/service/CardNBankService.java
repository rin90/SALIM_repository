package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.Bank;
import com.salim.vo.BankForm;
import com.salim.vo.Card;
import com.salim.vo.CardForm;

public interface CardNBankService {
	
	//카드 & 통장 같이 조회
	Map findCardNBankbook(String memberId);
	
	//카드 등록 후 조회
	void addCard(Card card);
	
	//카드 수정 후 조회
	Map modifyCard(CardForm cardForm, String memberId);
	
	//카드 삭제 후 조회
	Map deleteCard(List<Integer> cardIdList, String memberId);
	
	//통장 등록 후 조회
	void addBankbook(Bank bank);
	
	//통장 수정 후 조회
	Map modifyBankbook(BankForm bankForm, String memberId);
	
	//통장 삭제 후 조회
	Map deleteBankbook(List<Integer> bankIdList, String memberId);
	
	//해당 회원id로 등록한 카드/통장 조회
	List findCardType(String memberId);

}
