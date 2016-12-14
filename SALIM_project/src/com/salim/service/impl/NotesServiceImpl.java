package com.salim.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.NotesDao;
import com.salim.service.NotesService;
import com.salim.vo.Notes;

@Service
public class NotesServiceImpl implements NotesService{
	
	@Autowired
	private NotesDao dao;

	//저장 & 수정
	public void saveNotes(Notes notes) {
		
		if(notes.getNo() == 0){
			System.out.println("저장한 객체.. - "+notes);
			dao.insertNotes(notes);
		}else{
			System.out.println("수정한 객체 - "+notes);
			System.out.println(notes.getDayDate()+"메모의 날짜");
			System.out.println(notes.getMemberId()+"회원 아이디");
			dao.updateNotes(notes);
		}
	}
	
	//조회
	public Notes findNotes(Map map) {//memberId와 dayDate
		
		Notes notes = dao.selectNotes(map);
		
		return dao.selectNotes(map);	
	}
	
	
	
}
