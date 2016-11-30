package com.salim.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.NotesDao;
import com.salim.vo.Notes;

@Repository
public class NotesDaoImpl implements NotesDao{
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertNotes(Notes notes) {
		return session.insert("notesMapper.insertNotes", notes);
	}

	@Override
	public int updateNotes(Notes notes) {
		return session.update("notesMapper.updateNotes", notes);
	}

	@Override
	public Notes selectNotes(Map map) {
		return session.selectOne("notesMapper.selectNotes", map);
	}
	
	
}
