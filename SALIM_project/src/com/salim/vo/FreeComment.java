package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class FreeComment implements Serializable{

	private int id;
	@NotEmpty(message="내용을 입력해주세요")
	private String content;
	private String memberId;
	private int fontNo;
	private int fontGroup;
	private int groupLevel;
	private Date registerTime=new Date();
		
	public FreeComment() {
		super();
	}

	public FreeComment(int id, String content, String memberId, int fontNo, int fontGroup, int groupLevel,
			Date registerTime) {
		super();
		this.id = id;
		this.content = content;
		this.memberId = memberId;
		this.fontNo = fontNo;
		this.fontGroup = fontGroup;
		this.groupLevel = groupLevel;
		this.registerTime = registerTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getFontNo() {
		return fontNo;
	}

	public void setFontNo(int fontNo) {
		this.fontNo = fontNo;
	}

	public int getFontGroup() {
		return fontGroup;
	}

	public void setFontGroup(int fontGroup) {
		this.fontGroup = fontGroup;
	}

	public int getGroupLevel() {
		return groupLevel;
	}

	public void setGroupLevel(int groupLevel) {
		this.groupLevel = groupLevel;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", memberId=" + memberId + ", fontNo=" + fontNo
				+ ", fontGroup=" + fontGroup + ", groupLevel=" + groupLevel + ", registerTime=" + registerTime + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + fontGroup;
		result = prime * result + fontNo;
		result = prime * result + groupLevel;
		result = prime * result + id;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((registerTime == null) ? 0 : registerTime.hashCode());
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
		FreeComment other = (FreeComment) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (fontGroup != other.fontGroup)
			return false;
		if (fontNo != other.fontNo)
			return false;
		if (groupLevel != other.groupLevel)
			return false;
		if (id != other.id)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (registerTime == null) {
			if (other.registerTime != null)
				return false;
		} else if (!registerTime.equals(other.registerTime))
			return false;
		return true;
	}
	
	

	
	
}