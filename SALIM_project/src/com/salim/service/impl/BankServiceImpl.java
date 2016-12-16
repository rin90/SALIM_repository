package com.salim.service.impl;

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
	public void deleteBank(List<Integer> bankId) {
		
	}

	@Override
	public void modify(Bank bank) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List findBankByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
