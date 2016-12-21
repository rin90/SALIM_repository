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



	// 조회수 증가
	void clickUpdateint(int no);

	// 조회 제목으로 검색
	List<TipBoard> selectByTitle(int page, String content);

	// 조회 작성자로 검색
	List<TipBoard> selectByMemberId(int no, String content);

	// 글에대한 댓글 총개수
	int selectTitleTotal(String content);

	// 글수정
	void tipUpdate(TipBoard tipboard);

	// tip게시판 글등록 (글쓰기)
	void tipInsert(TipBoard tipboard);
	
	//작성자로 검색시 총 조회된 수
	int selectByMemberIdTotal(String memberId);

	//분류로 검색시 총 조회된 글의 수
	int selectClassificationTotal(String content);
	
	//분류로 검색 - 현재 페이지
	List<TipBoard> selectByClassification(String content,int page);
	

}
