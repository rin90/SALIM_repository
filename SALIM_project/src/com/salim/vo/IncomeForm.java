package com.salim.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

public class IncomeForm {
	
	@NotNull
	private Date incomeDate;
	List<Income> list;
	public IncomeForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IncomeForm(Date incomeDate, List<Income> list) {
		super();
		this.incomeDate = incomeDate;
		this.list = list;
	}
	@Override
	public String toString() {
		return "IncomeForm [incomeDate=" + incomeDate + ", list=" + list + "]";
	}
	public Date getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(Date incomeDate) {
		this.incomeDate = incomeDate;
	}
	public List<Income> getList() {
		return list;
	}
	public void setList(List<Income> list) {
		this.list = list;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((incomeDate == null) ? 0 : incomeDate.hashCode());
		result = prime * result + ((list == null) ? 0 : list.hashCode());
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
		IncomeForm other = (IncomeForm) obj;
		if (incomeDate == null) {
			if (other.incomeDate != null)
				return false;
		} else if (!incomeDate.equals(other.incomeDate))
			return false;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		return true;
	}
	
	
	
	

}
