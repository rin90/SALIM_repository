package com.salim.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

public interface TipBoardDao {
	// 글삭제완료
	void tipDelete(int no);

	// page처리를 우한 글총 개수
	int selectTotal();

	// page처리를 위한 현재페이지완료
	List<TipBoard> selectCurrentPage(int page);

	// no로 글 찾기(상세화면)
	TipBoard selectByNo(int no);

	// 글에대한 댓글 총개수
	int selectCommentTotal(int no);
	// 좋아요 증가

	int goodUpdate(int no, int num);

	// 조회수 증가
	void clickUpdateint(int no);

	// 조회 제목으로 검색
	List<TipBoard> selectByTitle(int page, String content);

	// page처리를 위한 글 총 개수
	int selectCommentTotal(String content);

	// 조회 제목으로 검색
	List<TipBoard> selectByMemberId(int no, String content);

	// 글에대한 댓글 총개수
	int selectMemberIdTotal(String content);

	// 글수정
	void tipUpdate(TipBoard tipboard);

	// tip게시판 글등록 (글쓰기)
	void tipInsert(TipBoard tipboard);

	

	List<TipBoard> selectTitleTotal(int no, int page);
	

}
