package com.salim.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.CardDao;
import com.salim.service.CardService;
import com.salim.vo.Card;

@Service("cardService")
public class CardServiceImpl implements CardService{
   
   @Autowired
   private CardDao dao;

   //카드 조회
   @Override
   public List findCardByMemberId(String memberId) {
      List<Card> cardList = new ArrayList();
      cardList = dao.selectCardByMemberId(memberId);
      return cardList;
   }
   
   //카드추가
   public void addCard(Card card){
      dao.addCard(card);
   }
   
   //카드수정
   public void modifyCard(Card card){
	   
	   System.out.println("서비스에서받은 카드 객체 - "+card);
      dao.updateCardByMemberId(card);
   }
   
   //카드 삭제
   public void deleteCard(List<Integer> cardIdList){
      for(int i=0; i<cardIdList.size(); i++){  
    	  dao.deleteCardByMemberId(cardIdList.get(i));
      }
   }
  
   
}