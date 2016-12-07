package com.salim.dao;

import java.util.List;
import java.util.Map;

import com.salim.vo.Schedule;

public interface ScheduleDao {
	int insertSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	int deleteSchedule(int no);
	
	List<Schedule> selectScheduleByMonth(Map map);
	List<Schedule> selectScheduleByDay(Map map);
}
