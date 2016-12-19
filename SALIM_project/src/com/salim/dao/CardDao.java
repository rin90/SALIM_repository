package com.salim.dao;

import java.util.List;

import com.salim.vo.Card;

public interface CardDao {
   
   /**
    * 카드 추가
    * 
    * @param card
    * @return
    */
   int addCard(Card card);
   
   /**
    * 카드 수정
    * 
    * @param card
    * @return
    */
   int updateCardByMemberId(Card card);
   
   /**
    * 카드 삭제
    * @param CardId
    * @return
    */
   int deleteCardByMemberId(int cardId);
   
   /**
    * 카드 선택(select)
    * @param CardId
    * @return
    */
   List selectCardByMemberId(String memberId);

}