package com.salim.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.GoalService;
import com.salim.service.ScheduleService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private GoalService gservice;
	
	@Autowired
	private ScheduleService sservice;
	
	@RequestMapping("/load.do")
	public String loadCalendar(String memberId, String month, ModelMap map){
		Map param = new HashMap();
		param.put("month", month);
		param.put("memberId", memberId);

		map.addAttribute("goal", gservice.getGoal(param));	// 
		map.addAttribute("monthScheduleList", sservice.selectScheduleByMonth(param));
		
		return "";
	}
	
}
