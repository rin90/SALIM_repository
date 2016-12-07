package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.FreeBoard;

public interface FreeBoardService {
	
	//글 등록
	void insertFree(FreeBoard freeBoard);
	
	//글 수정
	void updateFree(FreeBoard freeBoard);
	
	//조회수정
	void updateClick(int no);
	
	//좋아요 수정
	void updateGood(int no);
	
	//글 삭제
	void deleteFree(int no);
	
	//page처리를 위한 PagingBean객체와 list를 반환 -map
	Map getFreeBoardList(int page);
	
	//조회 - 제목으로 검색
	List<FreeBoard> selectByTitle(String title);
	
	//글 번호로 글 찾기(상세화면)
	FreeBoard selectByNo(int no);
	
	//글의 총 댓글 갯수
	int selectCommentTotal(int no);
}
