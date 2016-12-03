package com.salim.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.GoalDao;
import com.salim.vo.Goal;

@Repository
public class GoalDaoImpl implements GoalDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertGoal(Goal goal) {
		return session.insert("goalsMapper.insertGoal", goal);
	}

	@Override
	public int updateGoal(Goal goal) {
		return session.update("goalsMapper.updateGoal", goal);
	}

	@Override
	public int deleteGoal(int num) {
		return session.delete("goalsMapper.deleteGoal", num);
	}

	@Override
	public Goal selectGoal(Goal goal) {	// goal객체의 일부 내용 사용 : yM, memberId 
		return session.selectOne("goalsMapper.selectGoal", goal);
	}
	 
}
