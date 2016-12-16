package com.salim.service;

import java.util.Map;

import com.salim.vo.Notes;

public interface NotesService {
	
	
	//저장&수정
	void saveNotes(Notes notes);
	
	//조회
	Notes findNotes(Map map);//memberId, dayDate
	
	//삭제
	void deleteNotes(int no);

}
