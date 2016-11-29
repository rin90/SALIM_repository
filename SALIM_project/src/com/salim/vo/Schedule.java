package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Schedule implements Serializable{
	
	private int no;
	private String memberId;
	private String schedule;
	private Date scheduleDate;
	private String content;
	
	public Schedule() {
		super();
	}

	public Schedule(int no, String memberId, String schedule, Date scheduleDate, String content) {
		super();
		this.no = no;
		this.memberId = memberId;
		this.schedule = schedule;
		this.scheduleDate = scheduleDate;
		this.content = content;
	}

	@Override
	public String toString() {
		return "Schedule [no=" + no + ", memberId=" + memberId + ", schedule=" + schedule + ", scheduleDate="
				+ scheduleDate + ", content=" + content + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + no;
		result = prime * result + ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result + ((scheduleDate == null) ? 0 : scheduleDate.hashCode());
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
		Schedule other = (Schedule) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (no != other.no)
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (scheduleDate == null) {
			if (other.scheduleDate != null)
				return false;
		} else if (!scheduleDate.equals(other.scheduleDate))
			return false;
		return true;
	}
	
}
