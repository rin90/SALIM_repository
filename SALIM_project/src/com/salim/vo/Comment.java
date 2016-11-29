package com.salim.vo;

import java.util.Date;

public class Comment {

	private int id;
	private String content;
	private Date register_time;
	private String title;
	private String memberId;
	
	
	public Comment() {
		super();
	}


	public Comment(int id, String content, Date register_time, String title, String memberId) {
		super();
		this.id = id;
		this.content = content;
		this.register_time = register_time;
		this.title = title;
		this.memberId = memberId;
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


	public Date getRegister_time() {
		return register_time;
	}


	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", register_time=" + register_time + ", title=" + title
				+ ", memberId=" + memberId + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + id;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((register_time == null) ? 0 : register_time.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Comment other = (Comment) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (id != other.id)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (register_time == null) {
			if (other.register_time != null)
				return false;
		} else if (!register_time.equals(other.register_time))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
	
	
}
