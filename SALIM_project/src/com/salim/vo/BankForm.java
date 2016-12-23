package com.salim.vo;

import java.util.ArrayList;

public class BankForm {

	private ArrayList<Bank> bankList;

	public BankForm() {
		super();
	}

	public BankForm(ArrayList<Bank> bankList) {
		super();
		this.bankList = bankList;
	}

	@Override
	public String toString() {
		return "BankForm [bankList=" + bankList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bankList == null) ? 0 : bankList.hashCode());
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
		BankForm other = (BankForm) obj;
		if (bankList == null) {
			if (other.bankList != null)
				return false;
		} else if (!bankList.equals(other.bankList))
			return false;
		return true;
	}

	public ArrayList<Bank> getBankList() {
		return bankList;
	}

	public void setBankList(ArrayList<Bank> bankList) {
		this.bankList = bankList;
	}
	
	
}
