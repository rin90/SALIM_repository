package com.salim.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.ScheduleDao;
import com.salim.service.ScheduleService;
import com.salim.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDao dao;
	
	@Override
	public List<Schedule> selectScheduleByMonth(Map map) {	
		return  dao.selectScheduleByMonth(map);
	}

	@Override
	public List<Schedule> selectScheduleByDay(Map map) {	
		return dao.selectScheduleByDay(map);
	}

}
