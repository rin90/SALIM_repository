package com.salim.service;

import com.salim.vo.FreeComment;

public interface TipCommentService {
		
		//댓글 등록
		void comRegister(FreeComment comment);
		
		//댓글 수정
		void comUpdate(FreeComment comment);
		
		//그룹 증가
		int comGroupUp();
		
		//댓글 삭제
		void comDelete(int id);
		
		//글의 총 댓글 갯수
		int selectCommentTotal(int no);
}
