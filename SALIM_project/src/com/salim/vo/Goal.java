package com.salim.vo;

import java.io.Serializable;
import java.util.Date;


public class Goal implements Serializable{
	
	private int num;
	private Date yM;
	private String goal;
	private String memberId;
	public Goal(int num, Date yM, String goal, String memberId) {
		super();
		this.num = num;
		this.yM = yM;
		this.goal = goal;
		this.memberId = memberId;
	}
	public Goal() {
		super();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getyM() {
		return yM;
	}
	public void setyM(Date yM) {
		this.yM = yM;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
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
		result = prime * result + ((goal == null) ? 0 : goal.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + num;
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
		Goal other = (Goal) obj;
		if (goal == null) {
			if (other.goal != null)
				return false;
		} else if (!goal.equals(other.goal))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (num != other.num)
			return false;
		if (yM == null) {
			if (other.yM != null)
				return false;
		} else if (!yM.equals(other.yM))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Goal [num=" + num + ", yM=" + yM + ", goal=" + goal + ", memberId=" + memberId + "]";
	}

		
}
