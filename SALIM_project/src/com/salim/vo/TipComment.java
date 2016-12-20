package com.salim.vo;

import java.util.Date;

public class TipComment {
	private int id;
	private String commentContent;
	private String commentMemberId;
	private int no;
	private int commentGroup;
	private int groupLevel;
	private Date commentRegisterTime = new Date();

	public TipComment() {
		super();
	}

	public TipComment(int id, String commentContent, String commentMemberId, int no, int commentGroup, int groupLevel,
			Date commentRegisterTime) {
		super();
		this.id = id;
		this.commentContent = commentContent;
		this.commentMemberId = commentMemberId;
		this.no = no;
		this.commentGroup = commentGroup;
		this.groupLevel = groupLevel;
		this.commentRegisterTime = commentRegisterTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentMemberId() {
		return commentMemberId;
	}

	public void setCommentMemberId(String commentMemberId) {
		this.commentMemberId = commentMemberId;
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

	public Date getCommentRegisterTime() {
		return commentRegisterTime;
	}

	public void setCommentRegisterTime(Date commentRegisterTime) {
		this.commentRegisterTime = commentRegisterTime;
	}

	@Override
	public String toString() {
		return "TipComment [id=" + id + ", commentContent=" + commentContent + ", commentMemberId=" + commentMemberId
				+ ", no=" + no + ", commentGroup=" + commentGroup + ", groupLevel=" + groupLevel
				+ ", commentRegisterTime=" + commentRegisterTime + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentContent == null) ? 0 : commentContent.hashCode());
		result = prime * result + commentGroup;
		result = prime * result + ((commentMemberId == null) ? 0 : commentMemberId.hashCode());
		result = prime * result + ((commentRegisterTime == null) ? 0 : commentRegisterTime.hashCode());
		result = prime * result + groupLevel;
		result = prime * result + id;
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
		TipComment other = (TipComment) obj;
		if (commentContent == null) {
			if (other.commentContent != null)
				return false;
		} else if (!commentContent.equals(other.commentContent))
			return false;
		if (commentGroup != other.commentGroup)
			return false;
		if (commentMemberId == null) {
			if (other.commentMemberId != null)
				return false;
		} else if (!commentMemberId.equals(other.commentMemberId))
			return false;
		if (commentRegisterTime == null) {
			if (other.commentRegisterTime != null)
				return false;
		} else if (!commentRegisterTime.equals(other.commentRegisterTime))
			return false;
		if (groupLevel != other.groupLevel)
			return false;
		if (id != other.id)
			return false;
		if (no != other.no)
			return false;
		return true;
	}

}
