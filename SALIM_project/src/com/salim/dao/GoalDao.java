package com.salim.dao;

import java.util.Date;

import com.salim.vo.Goal;

public interface GoalDao {
	// 목표 등록
	public abstract int insertGoal(Goal goal);
	
	// 목표 수정
	public abstract int updateGoal(Goal goal);
	
	// 목표 삭제
	public abstract int deleteGoal(int num);
	
	// 목표 조회
	public abstract Goal selectGoal(Date date, String memberId);
	
	
}
