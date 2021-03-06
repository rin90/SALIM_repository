package com.salim.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class FreeBoard  implements Serializable{
 private int no;
@NotEmpty(message="제목을 입력해주세요")
 private String title;
@NotEmpty(message="내용을 입력해주세요")
 private String content;
 private MultipartFile fileRoot;
 private String fileName;
 private int click =0;
 private Date registerTime = new Date();
 private String memberId;
 /*
 글 하나에 댓글은 여러개 가지고 있고 글을 보여줄때 동시에 해당 글에 대한 댓글도 보여줘야 한다.
 (지금은) 반대로 댓글은 글의 번호만 가지고 있으면 된다. 그리고 댓글은 글에 대해 어떤 정보를 가져올 이유가 없다.
 */
 private List<FreeComment> freeComment;//조인 연산을 위해 
 


public FreeBoard() {
	super();
}



public FreeBoard(int no, String title, String content, MultipartFile fileRoot, String fileName, int click,
		Date registerTime, String memberId, List<FreeComment> freeComment) {
	super();
	this.no = no;
	this.title = title;
	this.content = content;
	this.fileRoot = fileRoot;
	this.fileName = fileName;
	this.click = click;
	this.registerTime = registerTime;
	this.memberId = memberId;
	this.freeComment = freeComment;
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



public List<FreeComment> getFreeComment() {
	return freeComment;
}



public void setFreeComment(List<FreeComment> freeComment) {
	this.freeComment = freeComment;
}



@Override
public String toString() {
	return "FreeBoard [no=" + no + ", title=" + title + ", content=" + content + ", fileRoot=" + fileRoot
			+ ", fileName=" + fileName + ", click=" + click + ", registerTime=" + registerTime + ", memberId="
			+ memberId + ", freeComment=" + freeComment + "]";
}



@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + click;
	result = prime * result + ((content == null) ? 0 : content.hashCode());
	result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
	result = prime * result + ((fileRoot == null) ? 0 : fileRoot.hashCode());
	result = prime * result + ((freeComment == null) ? 0 : freeComment.hashCode());
	result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
	result = prime * result + no;
	result = prime * result + ((registerTime == null) ? 0 : registerTime.hashCode());
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
	FreeBoard other = (FreeBoard) obj;
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
	if (freeComment == null) {
		if (other.freeComment != null)
			return false;
	} else if (!freeComment.equals(other.freeComment))
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
	if (title == null) {
		if (other.title != null)
			return false;
	} else if (!title.equals(other.title))
		return false;
	return true;
}


 

 
}
