package com.salim.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

import page.page;

public interface TipBoardService {
	// 글등록
	void tipInsert(TipBoard tipboard);

	// 글수정
	void tipUpdate(TipBoard tipboard);

	// 조회수증가
	TipBoard clickUpdateint(int no);

	// 글삭제
	void tipDelete(int no);

	// no로 글 찾기(상세화면)
	TipBoard selectByNo(int no);

	// 글에대한 댓글 총개수
	int selectCommentTotal(int no);

	// 좋아요증가
	void goodUpdate(int no, int num);

	// 글목록 페이징처리
	Map getTipListBoard(int page);

	// 제목으로검색과작성자검색총페이지
	Map getTermsTipListBoard(int page, String category, String content);

	TipBoard ModelAndselectByNo(int no);
	
	 Map selectTitleTotal(int no ,int page);
}
