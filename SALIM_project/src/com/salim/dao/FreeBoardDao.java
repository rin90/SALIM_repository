package com.salim.dao;

import java.util.List;

import com.salim.vo.FreeBoard;

public interface FreeBoardDao {

	// 글 등록
	void insertFree(FreeBoard freeBoard);

	// 글 수정
	void updateFree(FreeBoard freeBoard);

	// 글 조회수 증가
	void updateClick(int no);

	// 글 삭제
	void deleteFree(int no);

	// 글 번호로 글 찾기(상세화면)
	FreeBoard selectByNo(int no);

	// page처리를 위한 현재 페이지
	List<FreeBoard> selectCurrentPage(int page);

	// page처리를 위한 글 토탈
	int selectTotal();

	// 검색 - 제목으로 검색 -현재페이지 리턴
	List<FreeBoard> selectByTitle(int page, String content);

	// 제목으로 검색 글 토탈
	int selectTitleTotal(String content);

	// 검색 - 작성자로 검색 -현재페이지 리턴
	List<FreeBoard> selectByMemberId(int page, String content);

	// 작성자로 검색 글 토탈
	int selectMemberIdTotal(String content);

	int selectSeq();

}
