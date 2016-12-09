package com.salim.vo;

import java.io.Serializable;

public class Card implements Serializable{
	private String memberId;
	private int cardId;
	private String cardType;
	private String cardDescription;
	
	public Card(String memberId, int cardId, String cardType, String cardDescription) {
		super();
		this.memberId = memberId;
		this.cardId = cardId;
		this.cardType = cardType;
		this.cardDescription = cardDescription;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardDescription() {
		return cardDescription;
	}

	public void setCardDescription(String cardDescription) {
		this.cardDescription = cardDescription;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cardDescription == null) ? 0 : cardDescription.hashCode());
		result = prime * result + cardId;
		result = prime * result + ((cardType == null) ? 0 : cardType.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Card other = (Card) obj;
		if (cardDescription == null) {
			if (other.cardDescription != null)
				return false;
		} else if (!cardDescription.equals(other.cardDescription))
			return false;
		if (cardId != other.cardId)
			return false;
		if (cardType == null) {
			if (other.cardType != null)
				return false;
		} else if (!cardType.equals(other.cardType))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Card [memberId=" + memberId + ", cardId=" + cardId + ", cardType=" + cardType + ", cardDescription="
				+ cardDescription + "]";
	}
	
}
