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
		return session.insert("goalsMapper.insertGoal");
	}

	@Override
	public int updateGoal(Goal goal) {
		return 0;
	}

	@Override
	public int deleteGoal(int num) {
		return 0;
	}

	@Override
	public Goal selectGoal(Date date, String memberId) {
		Map map = new HashMap();
		map.put("memberId", memberId);
		SimpleDateFormat form = new SimpleDateFormat("yyyymm");
		map.put("month", form.format(date));
		return session.selectOne("goalsMapper.selectGoal", map);
	}
	 
}
