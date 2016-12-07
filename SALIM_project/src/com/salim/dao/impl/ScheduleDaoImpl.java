package com.salim.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salim.dao.ScheduleDao;
import com.salim.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertSchedule(Schedule schedule) {
		return session.insert("scheduleMapper.insertSchedule", schedule);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return session.update("scheduleMapper.updateSchedule", schedule);
	}

	@Override
	public int deleteSchedule(int no) {
		return session.delete("scheduleMapper.deleteSchedule", no);
	}

	@Override
	public List<Schedule> selectScheduleByMonth(Map map) {
		return session.selectList("scheduleMapper.selectScheduleByMonth", map);
	}

	@Override
	public List<Schedule> selectScheduleByDay(Map map) {
		return session.selectList("scheduleMapper.selectScheduleByDay", map);
	}

}
