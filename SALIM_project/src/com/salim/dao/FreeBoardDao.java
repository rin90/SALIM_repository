package com.salim.dao;

import java.util.List;

import com.salim.vo.FreeBoard;

public interface FreeBoardDao {
	
	//글 등록
	void insertFree(FreeBoard freeBoard);
	
	//글 수정
	void updateFree(FreeBoard freeBoard);
	
	//글 조회수 증가
	void updateClick(int no);
	
	//글 좋아요 증가
	void updateGood(int no);
	
	//글 삭제
	void deleteFree(int no); 
	
	//page처리를 위한 글 토탈
	int selectTotal();
	
	//page처리를 위한 글 토탈(기준 memberId)
	int selectByMemberIdTotal();
	
	//page처리를 위한 글 토탈( 기준 제목 )
	int selectByTitleTotal();
	
	//page처리를 위한 현재 페이지
	List<FreeBoard> selectCurrentPage(int page);
	
	//조회 제목으로 검색
	List<FreeBoard> selectByTitle(String title);
	
	// 글 번호로 글 찾기(상세화면)
	FreeBoard selectByNo(int no);
	
	//글의 총 댓글 갯수
	int selectCommentTotal(int no);
	
	//작성자로 검색
	List<FreeBoard> selectByMemberId(String memberId);
	


}
