package com.salim.dao;

import com.salim.vo.FreeComment;

public interface TipCommentDao {
	
	//댓글 등록
	void comRegister(FreeComment comment);
	
	//댓글 수정
	void comUpdate(FreeComment comment);
	
	//댓글 삭제
	void comDelete(int id);
	
	//commentGroup증가
	int comGroupUp();
	
	//글의 총 댓글 갯수
	int selectCommentTotal(int no);
}
