package com.salim.service;

import java.util.Date;

import com.salim.vo.Goal;

public interface GoalService {
	
	// 추가
	int insertGoal(Goal goal);
	
	// 수정
	int updateGoal(Goal goal);
	
	// 삭제
	int deleteGoal(int num);
	
	// 조회
	Goal selectGoal(Date date, String memberId);
	
	
}
