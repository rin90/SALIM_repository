package com.salim.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.salim.vo.TipBoard;

import page.page;

public interface TipBoardService {

void tipInsert(TipBoard tipboard );//글쓰기
	
	void tipUpdate(TipBoard tipboard );//글수정
	
	TipBoard clickUpdateint(TipBoard tipboard );//조회수증가
	
	void goodUpdate(TipBoard tipboard);//좋아용 증가
	
	void tipDelete(int no);//글삭제
	

	
	int  selectTotal( int no);//page처리를 우한 글총 개수
	
	List<TipBoard> selectCurrentPage(int no,Map map);//page처리를 위한 현재페이지
	

	
	int selectByNo(int no);//no로 글 찾기(상세화면)
	
	int selectCommentTotal(int value);//글에대한 댓글 총개수

	Map getTipBoardList(int page);



	List<TipBoard> selectCurrentPage(Map map);

	Map getTipListBoard(int page);

	



	

	

	

	

	

	
	

}

	

	

	

	

	

	


		
	

	







