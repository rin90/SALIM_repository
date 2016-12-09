package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class FreeComment implements Serializable{

	private int id;
	@NotEmpty(message="내용을 입력해주세요")
	private String content;
	private String memberId;
	private int no; //FreeBoard의 글번호  
	private int commentGroup;
	private int groupLevel;
	private Date registerTime=new Date();
		
	public FreeComment() {
		super();
	}

	public FreeComment(int id, String content, String memberId, int no, int commentGroup, int groupLevel,
			Date registerTime) {
		super();
		this.id = id;
		this.content = content;
		this.memberId = memberId;
		this.no = no;
		this.commentGroup = commentGroup;
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommentGroup() {
		return commentGroup;
	}

	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
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
		return "FreeComment [id=" + id + ", content=" + content + ", memberId=" + memberId + ", no=" + no
				+ ", commentGroup=" + commentGroup + ", groupLevel=" + groupLevel + ", registerTime=" + registerTime
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + commentGroup;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + groupLevel;
		result = prime * result + id;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + no;
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
		if (commentGroup != other.commentGroup)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
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
		if (no != other.no)
			return false;
		if (registerTime == null) {
			if (other.registerTime != null)
				return false;
		} else if (!registerTime.equals(other.registerTime))
			return false;
		return true;
	}

	
	

	
	
}