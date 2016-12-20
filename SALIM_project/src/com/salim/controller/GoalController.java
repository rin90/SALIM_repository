package com.salim.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.GoalService;
import com.salim.vo.Collect;
import com.salim.vo.Goal;
import com.salim.vo.Member;

@Controller
@RequestMapping("/goal/login")
public class GoalController {
	@Autowired
	private GoalService service;
	
	//그룹인지 개인인지 판별
	public String checkMemberId(HttpSession session){
		String memberId = null;
		Collect collect = (Collect) session.getAttribute("group_info");
		if(collect != null){
			memberId = collect.getCollectionId();
		}else{
			memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		}
		System.out.println(memberId);
		return memberId;
	}

	@RequestMapping("/applyDB.do")
	@ResponseBody
	public Goal applyDB(Goal goal, HttpSession session){
		goal.setMemberId(checkMemberId(session));
		
		goal = service.applyDB(goal);
		return goal;
	}
	
}
