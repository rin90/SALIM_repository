package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Notes implements Serializable{
	
	private int no;
	private Date dayDate;
	private String content;
	private String memberId;
	
	public Notes(){
		super();
	};

	public Notes(int no, Date dayDate, String content, String memberId) {
		super();
		this.no = no;
		this.dayDate = dayDate;
		this.content = content;
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Memo [no=" + no + ", dayDate=" + dayDate + ", content=" + content + ", memberId=" + memberId + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getDayDate() {
		return dayDate;
	}

	public void setDayDate(Date dayDate) {
		this.dayDate = dayDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((dayDate == null) ? 0 : dayDate.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + no;
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
		Notes other = (Notes) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (dayDate == null) {
			if (other.dayDate != null)
				return false;
		} else if (!dayDate.equals(other.dayDate))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (no != other.no)
			return false;
		return true;
	};
	
	
}
