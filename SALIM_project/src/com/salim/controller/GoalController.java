package com.salim.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.GoalService;
import com.salim.vo.Goal;

@Controller
@RequestMapping("/goal")
public class GoalController {
	@Autowired
	private GoalService service;
	
	@RequestMapping("/applyDB.do")
	@ResponseBody
	public Goal applyDB(Goal goal){
		goal = service.applyDB(goal);
		return goal;
	}
	
}
