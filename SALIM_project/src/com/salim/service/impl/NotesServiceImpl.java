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
		if(notes.getNo() != 0){
			if(notes.getContent().trim().isEmpty()){
				System.out.println("메모 삭제"+notes);
				dao.deleteNotes(notes.getNo());
			}else{
				System.out.println("메모 수정"+notes);
				dao.updateNotes(notes);
			}
		}else if(notes.getNo() == 0 && !notes.getContent().trim().isEmpty()){
			System.out.println("저장한 객체.. - "+notes);
			dao.insertNotes(notes);
		}
	}
	
	//조회
	public Notes findNotes(Map map) {//memberId와 dayDate
		return dao.selectNotes(map);	
	}
	
	//삭제
	public void deleteNotes(int no) {
		dao.deleteNotes(no);
	}
	
}
