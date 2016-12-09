package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class Expense implements Serializable{
	
	@NotNull
	private int expenseId;
	@NotNull
	private String memberId;
	private int codeId;
	
	@NotNull
	@DateTimeFormat(pattern="yy-MM-dd")
	private Date expenseDate;
	private String expenseExplain;
	private int cashExpense;
	private int cardExpense;
	private String cardType;

	public Expense() {
		super();
	}

	public Expense(int expenseId, String memberId, int codeId, Date expenseDate, String expenseExplain, int cashExpense,
			int cardExpense, String cardType) {
		super();
		this.expenseId = expenseId;
		this.memberId = memberId;
		this.codeId = codeId;
		this.expenseDate = expenseDate;
		this.expenseExplain = expenseExplain;
		this.cashExpense = cashExpense;
		this.cardExpense = cardExpense;
		this.cardType = cardType;
	}

	@Override
	public String toString() {
		return "Expense [expenseId=" + expenseId + ", memberId=" + memberId + ", codeId=" + codeId + ", expenseDate="
				+ expenseDate + ", expenseExplain=" + expenseExplain + ", cashExpense=" + cashExpense + ", cardExpense="
				+ cardExpense + ", cardType=" + cardType + "]";
	}

	public int getExpenseId() {
		return expenseId;
	}

	public void setExpenseId(int expenseId) {
		this.expenseId = expenseId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCodeId() {
		return codeId;
	}

	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}

	public Date getExpenseDate() {
		return expenseDate;
	}

	public void setExpenseDate(Date expenseDate) {
		this.expenseDate = expenseDate;
	}

	public String getExpenseExplain() {
		return expenseExplain;
	}

	public void setExpenseExplain(String expenseExplain) {
		this.expenseExplain = expenseExplain;
	}

	public int getCashExpense() {
		return cashExpense;
	}

	public void setCashExpense(int cashExpense) {
		this.cashExpense = cashExpense;
	}

	public int getCardExpense() {
		return cardExpense;
	}

	public void setCardExpense(int cardExpense) {
		this.cardExpense = cardExpense;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cardExpense;
		result = prime * result + ((cardType == null) ? 0 : cardType.hashCode());
		result = prime * result + cashExpense;
		result = prime * result + codeId;
		result = prime * result + ((expenseDate == null) ? 0 : expenseDate.hashCode());
		result = prime * result + ((expenseExplain == null) ? 0 : expenseExplain.hashCode());
		result = prime * result + expenseId;
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
		Expense other = (Expense) obj;
		if (cardExpense != other.cardExpense)
			return false;
		if (cardType == null) {
			if (other.cardType != null)
				return false;
		} else if (!cardType.equals(other.cardType))
			return false;
		if (cashExpense != other.cashExpense)
			return false;
		if (codeId != other.codeId)
			return false;
		if (expenseDate == null) {
			if (other.expenseDate != null)
				return false;
		} else if (!expenseDate.equals(other.expenseDate))
			return false;
		if (expenseExplain == null) {
			if (other.expenseExplain != null)
				return false;
		} else if (!expenseExplain.equals(other.expenseExplain))
			return false;
		if (expenseId != other.expenseId)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}
	
}
