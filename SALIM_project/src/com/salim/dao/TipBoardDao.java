package com.salim.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.salim.vo.FreeBoard;
import com.salim.vo.TipBoard;

public interface TipBoardDao {
	void tipInsert(TipBoard tipboard);// 글쓰기완료

	void tipUpdate(TipBoard tipboard);// 글수정완료

	void clickUpdateint(TipBoard tipboard);// 조회수증가

	int goodUpdate(int no);// 좋아용 증가완료

	void tipDelete(int no);// 글삭제완료

	Map getTipBoardList(int page); //

	int selectTotal(int no);// page처리를 우한 글총 개수

	List<TipBoard> selectCurrentPage(Map map);// page처리를 위한 현재페이지완료

	int selectByNo(int no);// no로 글 찾기(상세화면)

	int selectCommentTotal(int no);// 글에대한 댓글 총개수

	void goodUpdate(TipBoard tipboard);
}
