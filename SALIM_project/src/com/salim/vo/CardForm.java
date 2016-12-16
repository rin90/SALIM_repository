package com.salim.vo;

import java.util.ArrayList;

public class CardForm {

	
	private ArrayList<Card> cardList;

	public ArrayList<Card> getCardList() {
		return cardList;
	}

	public void setCardList(ArrayList<Card> cardList) {
		this.cardList = cardList;
	}

	@Override
	public String toString() {
		return "CardForm [cardList=" + cardList + "]";
	}

	
	
	
}
