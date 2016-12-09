package com.salim.service.impl;

import com.salim.vo.Card;


public interface CardService {

	/**
	 * 멤버에 저장된 카드를 찾아주는 메소오드.
	 * 
	 * @param MemberId
	 * @return
	 */
	Card findCardByMemberId(String MemberId); 
}
