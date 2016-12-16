package com.salim.service;

import java.util.List;

import com.salim.vo.Card;


public interface CardService {
   
   /**
    * 멤버에 카드를 추가하는 메소드..?
    * 
    * @param MemberId
    * @return
    */
   public void addCard(Card card);
   
   //삭제
   public void deleteCard(List<Integer> cardId);
   
   //수정
   public void modifyCard(Card card);
   
   /**
    * 멤버에 저장된 카드를 찾아주는 메서드.
    * 
    * @paradm MemberId
    * @return
    */
   List findCardByMemberId(String memberId); 

}