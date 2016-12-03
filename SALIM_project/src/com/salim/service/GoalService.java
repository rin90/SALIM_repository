package com.salim.service;

import java.util.Map;

import com.salim.vo.Goal;

public interface GoalService {
	Goal applyDB(Goal goal);
	/**
	 * 목표 한개를 가지고 오는 역할
	 * @param goal	month과 memberId.
	 * @return		조회된 Goal객체
	 */
	Goal getGoal(Map map);
}
