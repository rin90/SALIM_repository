package com.salim.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.GoalDao;
import com.salim.service.GoalService;
import com.salim.vo.Goal;

@Service
public class GoalServiceImpl implements GoalService{
	@Autowired
	private GoalDao dao;
	
	
	@Override
	public int insertGoal(Goal goal) {
		return dao.insertGoal(goal);
	}

	@Override
	public int updateGoal(Goal goal) {
		// TODO Auto-generated method stub
		return dao.updateGoal(goal);
	}

	@Override
	public int deleteGoal(int num) {
		// TODO Auto-generated method stub
		return dao.deleteGoal(num);
	}

	@Override
	public Goal selectGoal(Date date, String memberId) {
		// TODO Auto-generated method stub
		return dao.selectGoal(date, memberId);
	}

}
