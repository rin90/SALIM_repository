package com.salim.dao;

import com.salim.vo.Card;

public interface CardDao {
	
	/**
	 * 카드 추가
	 * 
	 * @param card
	 * @return
	 */
	int insertCard(Card card);
	
	/**
	 * 카드 업데이트
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
	int deleteCardByMemberId(String cardId);
	
	/**
	 * 카드 선택(select)
	 * @param CardId
	 * @return
	 */
	Card selectCardByMemberId(String cardId);
}
