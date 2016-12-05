package com.salim.service;

import com.salim.vo.Notes;

public interface NotesService {
	/*
	 * 메모는 매일 가계부 입력시 생성. - 저장버튼을 누르면 메모도 삽입 및 수정 가능.
	 * 조회는 회원id와 해당 날짜로 조회. 저장시는 메모의 id로 저장
	 * 확인 여부는 boolean으로, 매개변수는 메모는 하루에 하나이므로 메모 객체 받기
	 */
	boolean saveNotes(Notes notes);
	

}
