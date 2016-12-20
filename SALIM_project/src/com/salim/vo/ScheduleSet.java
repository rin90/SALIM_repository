package com.salim.vo;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ScheduleSet implements Serializable{	// Schudule부분에서 사용하기 위해 만든 클래스. VO는 아님. 
	private String memberId;
	private String start;
	private Integer[] no;
	private String[] end;
	private String[] title;
	private String[] detail;
	
	public List<Schedule> settingSchedule(){
		List<Schedule> list = new ArrayList<Schedule>();
		for(int i=0; i<no.length; i++){
			list.add(new Schedule(no[i], title[i], detail[i], Date.valueOf(start), Date.valueOf(end[i]), memberId));
		}
		return list;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public Integer[] getNo() {
		return no;
	}

	public void setNo(Integer[] no) {
		this.no = no;
	}

	public String[] getEnd() {
		return end;
	}

	public void setEnd(String[] end) {
		this.end = end;
	}

	public String[] getTitle(){
		return title;
	}

	public void setTitle(String[] title){
		this.title = title;
	}

	public String[] getDetail() {
		return detail;
	}

	public void setDetail(String[] detail) {
		this.detail = detail;
	}

}
