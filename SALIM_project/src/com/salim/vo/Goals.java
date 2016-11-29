package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Goals implements Serializable{
	
	private int target;
	private Date yM;
	private String gool;
	private String memberId;
	
	public Goals() {
		super();
	}

	public Goals(int target, Date yM, String gool, String memberId) {
		super();
		this.target = target;
		this.yM = yM;
		this.gool = gool;
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Goals [target=" + target + ", yM=" + yM + ", gool=" + gool + ", memberId=" + memberId + "]";
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}

	public Date getyM() {
		return yM;
	}

	public void setyM(Date yM) {
		this.yM = yM;
	}

	public String getGool() {
		return gool;
	}

	public void setGool(String gool) {
		this.gool = gool;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gool == null) ? 0 : gool.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + target;
		result = prime * result + ((yM == null) ? 0 : yM.hashCode());
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
		Goals other = (Goals) obj;
		if (gool == null) {
			if (other.gool != null)
				return false;
		} else if (!gool.equals(other.gool))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (target != other.target)
			return false;
		if (yM == null) {
			if (other.yM != null)
				return false;
		} else if (!yM.equals(other.yM))
			return false;
		return true;
	}
	
}
