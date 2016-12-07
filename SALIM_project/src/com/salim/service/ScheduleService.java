package com.salim.service;

import java.util.List;
import java.util.Map;

import com.salim.vo.Schedule;

public interface ScheduleService {
	
	
	// 우선 조회먼저. CUD는 다음에
	
	/**
	 * 특정한 달에 대한 일정 조회 
	 * @param map	memberId와 month('2016-12'형식)
	 * @return		조회 내역
	 */
	List<Schedule> selectScheduleByMonth(Map map);
	/**
	 * 특정한 날에 대한 일정 조회
	 * @param map	memberId(등록자)와 day('2016-12-01'형식)
	 * @return		조회 내역
	 */
	List<Schedule> selectScheduleByDay(Map map);
}
