package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.FreeBoard;

public interface FreeBoardService {
	
	//글 등록
	void insertFree(FreeBoard freeBoard);
	
	//글 수정
	void updateFree(FreeBoard freeBoard);
	
	//좋아요 수정
	void updateGood(int no,int num);
	
	//글 삭제
	void deleteFree(int no);
	
	//글 번호로 글 찾기(상세화면)+조회수 증가
	FreeBoard selectByNoAndClickUpdate(int no);
	
	//새로고침 방지해서 새로고침시 조회수 증가 안함
	FreeBoard selectByNo(int no);
	
	//글의 총 댓글 갯수
	int selectCommentTotal(int no);

	//page처리를 위한 PagingBean객체와 list를 반환 - 토탈
	Map getFreeBoardList(int page);
	
	//page처리를 위한 PagingBean객체와 list를 반환  - 제목으로 검색과 작성자로 검색 처리
	Map getTermsFreeBoardList(int page,String category,String content);
	
	
	
	int selectSeq();
	
	
}
