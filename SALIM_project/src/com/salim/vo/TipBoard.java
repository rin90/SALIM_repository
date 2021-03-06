package com.salim.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class TipBoard implements Serializable{
	private int no;
	@NotEmpty(message="제목을 입력해주세요")
	private String title;
	@NotEmpty(message="내용을 입력해주세요")
	private String content;
	private MultipartFile fileRoot;
	private String fileName;
	private int click =0;
	private String classification;//분류
	private Date registerTime =new Date(); //작성일
	private String memberId;
	
	//join연산을 위한 instance변수
	private List<TipComment> tipComment;
	
	public TipBoard() {
		super();
	}

	public TipBoard(int no, String title, String content, MultipartFile fileRoot, String fileName, int click,
			String classification, Date registerTime, String memberId, List<TipComment> tipComment) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.fileRoot = fileRoot;
		this.fileName = fileName;
		this.click = click;
		this.classification = classification;
		this.registerTime = registerTime;
		this.memberId = memberId;
		this.tipComment = tipComment;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public List<TipComment> getTipComment() {
		return tipComment;
	}

	public void setTipComment(List<TipComment> tipComment) {
		this.tipComment = tipComment;
	}

	@Override
	public String toString() {
		return "TipBoard [no=" + no + ", title=" + title + ", content=" + content + ", fileRoot=" + fileRoot
				+ ", fileName=" + fileName + ", click=" + click + ", classification=" + classification
				+ ", registerTime=" + registerTime + ", memberId=" + memberId + ", tipComment=" + tipComment + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((classification == null) ? 0 : classification.hashCode());
		result = prime * result + click;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((fileRoot == null) ? 0 : fileRoot.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + no;
		result = prime * result + ((registerTime == null) ? 0 : registerTime.hashCode());
		result = prime * result + ((tipComment == null) ? 0 : tipComment.hashCode());
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
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (fileRoot == null) {
			if (other.fileRoot != null)
				return false;
		} else if (!fileRoot.equals(other.fileRoot))
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
		if (tipComment == null) {
			if (other.tipComment != null)
				return false;
		} else if (!tipComment.equals(other.tipComment))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	


	
	
	
}
