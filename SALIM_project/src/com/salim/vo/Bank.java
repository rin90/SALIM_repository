package com.salim.vo;

import java.io.Serializable;

public class Bank implements Serializable{
	private String memberId;
	private int bankId;
	private String bankType;
	private String bankDescription;
	
	
	public Bank() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bank(String memberId, int bankId, String bankType, String bankDescription) {
		super();
		this.memberId = memberId;
		this.bankId = bankId;
		this.bankType = bankType;
		this.bankDescription = bankDescription;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBankId() {
		return bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBankType() {
		return bankType;
	}

	public void setBankType(String bankType) {
		this.bankType = bankType;
	}

	public String getBankDescription() {
		return bankDescription;
	}

	public void setBankDescription(String bankDescription) {
		this.bankDescription = bankDescription;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bankDescription == null) ? 0 : bankDescription.hashCode());
		result = prime * result + bankId;
		result = prime * result + ((bankType == null) ? 0 : bankType.hashCode());
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
		Bank other = (Bank) obj;
		if (bankDescription == null) {
			if (other.bankDescription != null)
				return false;
		} else if (!bankDescription.equals(other.bankDescription))
			return false;
		if (bankId != other.bankId)
			return false;
		if (bankType == null) {
			if (other.bankType != null)
				return false;
		} else if (!bankType.equals(other.bankType))
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
		return "Bank [memberId=" + memberId + ", bankId=" + bankId + ", bankType=" + bankType + ", bankDescription="
				+ bankDescription + "]";
	}
	
}