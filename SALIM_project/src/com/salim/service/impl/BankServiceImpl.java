package com.salim.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.BankDao;
import com.salim.service.BankService;
import com.salim.vo.Bank;

@Service
public class BankServiceImpl implements BankService{
	
	@Autowired
	private BankDao dao;

	@Override
	public void addBank(Bank bank) {
		dao.insertBank(bank);
	}

	@Override
	public void deleteBank(List<Integer> bankIdList) {
		System.out.println("통장 삭제 서비스로 들어오  - "+bankIdList);
		for(int i=0; i<bankIdList.size(); i++){
			dao.deleteBankByMemberId(bankIdList.get(i));
		}
	}

	@Override
	public void modify(Bank bank) {
		dao.updateBankByMemberId(bank);
		
	}

	@Override
	public List findBankByMemberId(String memberId) {
		
		return dao.selectBankByMemberId(memberId);
	}
	
	
}
