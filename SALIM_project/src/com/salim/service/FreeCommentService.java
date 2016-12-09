package com.salim.service;

import java.util.List;

import com.salim.vo.FreeComment;

public interface FreeCommentService {
	
	//댓글 등록
	void comRegister(FreeComment comment);
	//댓글 수정
	void comUpdate(FreeComment comment);
	//댓글 삭제
	void comDelete(int id);
	
	
}
