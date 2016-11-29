package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Income implements Serializable{
	
	private int incomeId;
	private String memberId;
	private int codeId;
	private Date incomeDate;
	private String explanation;
	private int incomeMoney;
	
	public Income() {
		super();
	}
	public Income(int incomeId, String memberId, int codeId, Date incomeDate, String explanation, int incomeMoney) {
		super();
		this.incomeId = incomeId;
		this.memberId = memberId;
		this.codeId = codeId;
		this.incomeDate = incomeDate;
		this.explanation = explanation;
		this.incomeMoney = incomeMoney;
	}
	@Override
	public String toString() {
		return "Income [incomeId=" + incomeId + ", memberId=" + memberId + ", codeId=" + codeId + ", incomeDate="
				+ incomeDate + ", explanation=" + explanation + ", incomeMoney=" + incomeMoney + "]";
	}
	public int getIncomeId() {
		return incomeId;
	}
	public void setIncomeId(int incomeId) {
		this.incomeId = incomeId;
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
	public Date getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(Date incomeDate) {
		this.incomeDate = incomeDate;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public int getIncomeMoney() {
		return incomeMoney;
	}
	public void setIncomeMoney(int incomeMoney) {
		this.incomeMoney = incomeMoney;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + codeId;
		result = prime * result + ((explanation == null) ? 0 : explanation.hashCode());
		result = prime * result + ((incomeDate == null) ? 0 : incomeDate.hashCode());
		result = prime * result + incomeId;
		result = prime * result + incomeMoney;
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
		Income other = (Income) obj;
		if (codeId != other.codeId)
			return false;
		if (explanation == null) {
			if (other.explanation != null)
				return false;
		} else if (!explanation.equals(other.explanation))
			return false;
		if (incomeDate == null) {
			if (other.incomeDate != null)
				return false;
		} else if (!incomeDate.equals(other.incomeDate))
			return false;
		if (incomeId != other.incomeId)
			return false;
		if (incomeMoney != other.incomeMoney)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}
	
}
