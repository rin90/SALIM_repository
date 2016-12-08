package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@RequestMapping("/loadMonth.do")
	public String loadMonth(String memberId){
		Map<String, String> param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(new Date()));
		param.put("memberId", memberId);
		
		
		
		return "body/report/month_report.tiles";
	}
}
