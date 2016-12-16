package com.salim.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.CardDao;
import com.salim.vo.Card;

@Repository
public class CardDaoImpl implements CardDao{

   @Autowired
   private SqlSessionTemplate session;
   
   
   private String makeSql(String tagId){
      return "cardMapper."+tagId;
   }
   
   @Override
   public int addCard(Card card) {
      return session.insert(makeSql("insertCard"), card);
   }

   @Override
   public int updateCardByMemberId(Card card) {
	   System.out.println("디에이오에서 받은 카드객체 - "+card);
      return session.update(makeSql("updateCardByMemberId"), card);
   }

   @Override
   public int deleteCardByMemberId(int cardId) {
      return session.delete(makeSql("deleteCardByMemberId"), cardId);
   }

   @Override
   public List<Card> selectCardByMemberId(String memberId) {
      return session.selectList(makeSql("selectCardByMemberId"), memberId);
   }
   
   
}