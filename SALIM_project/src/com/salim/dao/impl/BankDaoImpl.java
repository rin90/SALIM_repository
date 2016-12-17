package com.salim.dao.impl;

import java.util.List;

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
		return "bankMapper."+tagId;
	}
	
	@Override
	public int insertBank(Bank bank) {
		return session.insert(makeSql("insertBank"), bank);
	}

	@Override
	public int updateBankByMemberId(Bank bank) {
		return session.update(makeSql("updateBankByMemberId"), bank);
	}

	@Override
	public int deleteBankByMemberId(int bankId) {
		return session.delete(makeSql("deleteBankByMemberId"), bankId);
	}

	@Override
	public List<Bank> selectBankByMemberId(String memberId) {
		return session.selectList(makeSql("selectBankByMemberId"), memberId);
	}
	
}
