package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class TipBoard implements Serializable{
	private int no;
	private String title;
	private String content;
	private MultipartFile fileRoot;
	private String fileName;
	private String category;
	private int click =0;
	private int good =0;
	private String classification;//분류
	private Date registerTime =new Date(); //작성일
	private String memberId;
	
	
	public TipBoard() {
		super();
	}


	public TipBoard(int no, String title, String content, MultipartFile fileRoot, String category, int click, int good,
			String classification, String memberId) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.fileRoot = fileRoot;
		this.category = category;
		this.click = click;
		this.good = good;
		this.classification = classification;
		this.memberId = memberId;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public MultipartFile getFileRoot() {
		return fileRoot;
	}


	public void setFileRoot(MultipartFile fileRoot) {
		this.fileRoot = fileRoot;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getClick() {
		return click;
	}


	public void setClick(int click) {
		this.click = click;
	}


	public int getGood() {
		return good;
	}


	public void setGood(int good) {
		this.good = good;
	}


	public String getClassification() {
		return classification;
	}


	public void setClassification(String classification) {
		this.classification = classification;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "TipBoard [no=" + no + ", title=" + title + ", content=" + content + ", fileRoot=" + fileRoot
				+ ", category=" + category + ", click=" + click + ", good=" + good + ", classification="
				+ classification + ", memberId=" + memberId + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((classification == null) ? 0 : classification.hashCode());
		result = prime * result + click;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((fileRoot == null) ? 0 : fileRoot.hashCode());
		result = prime * result + good;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + no;
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
		TipBoard other = (TipBoard) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (classification == null) {
			if (other.classification != null)
				return false;
		} else if (!classification.equals(other.classification))
			return false;
		if (click != other.click)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (fileRoot == null) {
			if (other.fileRoot != null)
				return false;
		} else if (!fileRoot.equals(other.fileRoot))
			return false;
		if (good != other.good)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (no != other.no)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}


	


	public void setFileName(String originalFilename) {
		this.fileName=fileName;
		
	}
	
	
	
	
	
}
