package com.salim.dao;

import java.util.Map;

import com.salim.vo.Notes;

public interface NotesDao {
	
	//메모 작성
	int insertNotes(Notes notes);
	
	//메모 수정
	int updateNotes(Notes notes);
	
	//메모 조회
	Notes selectNotes(Map map);
	
	//메모 삭제
	int deleteNotes(int no);

}
