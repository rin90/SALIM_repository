package com.salim.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CardDao;
import com.salim.vo.Card;

@Repository
public class CardDaoImpl implements CardDao{

	@Autowired
	private SqlSessionTemplate session;
	
	public CardDaoImpl(){}
	
	private String makeSql(String tagId){
		return "card."+tagId;
	}
	
	@Override
	public int insertCard(Card card) {
		return session.insert(makeSql("insertCard"), card);
	}

	@Override
	public int updateCardByMemberId(Card card) {
		return session.update(makeSql("updateCard"), card);
	}

	@Override
	public int deleteCardByMemberId(String cardId) {
		return session.delete(makeSql("deleteCardByMemberId"), cardId);
	}

	@Override
	public Card selectCardByMemberId(String cardId) {
		return session.selectOne(makeSql("selectCardByMemberId"), cardId);
	}
	
}
