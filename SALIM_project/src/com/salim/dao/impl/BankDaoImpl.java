package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.BankDao;
import com.salim.vo.Bank;

@Repository
public class BankDaoImpl implements BankDao{

	@Autowired
	private SqlSessionTemplate session;
	
	
	private String makeSql(String tagId){
		return "bank."+tagId;
	}
	
	@Override
	public int insertBank(Bank bank) {
		return session.insert(makeSql("insertBank"), bank);
	}

	@Override
	public int updateBankByMemberId(Bank bank) {
		return session.update(makeSql("updateBank"), bank);
	}

	@Override
	public int deleteBankByMemberId(String bankId) {
		return session.delete(makeSql("deleteBankByMemberId"), bankId);
	}

	@Override
	public Bank selectBankByMemberId(String bankId) {
		return session.selectOne(makeSql("selectBankByMemberId"), bankId);
	}
	
}
