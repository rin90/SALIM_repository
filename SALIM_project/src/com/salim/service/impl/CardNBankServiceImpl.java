package com.salim.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.BankDao;
import com.salim.dao.CardDao;
import com.salim.dao.CodeDao;
import com.salim.service.CardNBankService;
import com.salim.vo.Bank;
import com.salim.vo.BankForm;
import com.salim.vo.Card;
import com.salim.vo.CardForm;

@Service
public class CardNBankServiceImpl implements CardNBankService{
	
	@Autowired
	private CardDao cardDao;
	@Autowired
	private BankDao bankDao;
	@Autowired
	private CodeDao codeDao;
	
	//카드 & 통장 같이 조회
	public Map findCardNBankbook(String memberId) {
		Map result = new HashMap();
		result.put("cardList", cardDao.selectCardByMemberId(memberId));
		result.put("bankBookList", bankDao.selectBankByMemberId(memberId));
		result.put("bankList", codeDao.selectCode("은행"));
		return result;
	}
	
	//카드 등록
	public void addCard(Card card) {
		cardDao.addCard(card);
	}
	
	//카드 수정 후 조회
	public Map modifyCard(CardForm cardForm, String memberId) {
		List<Card> cardList = cardForm.getCardList();
		for(int i =0; i<cardList.size(); i++){
			cardDao.updateCardByMemberId(cardList.get(i));
		   }
		return findCardNBankbook(memberId);
	}
	
	//카드 삭제 후 조회
	public Map deleteCard(List<Integer> cardIdList, String memberId) {
		for(int i=0; i<cardIdList.size(); i++){  
			cardDao.deleteCardByMemberId(cardIdList.get(i));
	    }
		return findCardNBankbook(memberId);
	}
	
	//통장 등록
	public void addBankbook(Bank bank) {
		bankDao.insertBank(bank);
	}
	
	//통장 수정 후 조회
	public Map modifyBankbook(BankForm bankForm, String memberId) {
		List<Bank> bankList = bankForm.getBankList();
		for(int i=0; i<bankList.size(); i++){
			bankDao.updateBankByMemberId(bankList.get(i));
		}
		return findCardNBankbook(memberId);
	}
	
	//통장 삭제 후 조회
	public Map deleteBankbook(List<Integer> bankIdList, String memberId) {
		for(int i=0; i<bankIdList.size(); i++){
			bankDao.deleteBankByMemberId(bankIdList.get(i));
		}
		return findCardNBankbook(memberId);
	}
	
	//지출에 뿌려줄 카드&통장 memberId로 조회
	public List findCardType(String memberId){
		List<String> cardTypeList = new ArrayList();
		List<Card> cardList =  cardDao.selectCardByMemberId(memberId);
		List<Bank> bankList = bankDao.selectBankByMemberId(memberId);
		String cardNBank = null;
		for(int i=0; i<cardList.size(); i++){
			cardNBank = "<카드/"+cardList.get(i).getCardType()+">"+cardList.get(i).getCardDescription();
			cardTypeList.add(cardNBank);
		}
		for(int i=0; i<bankList.size(); i++){
			cardNBank = "<통장/"+bankList.get(i).getBankType()+">"+bankList.get(i).getBankDescription();
			cardTypeList.add(cardNBank);
		}
		return cardTypeList;
	}

}
