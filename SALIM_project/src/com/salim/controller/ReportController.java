package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	ReportService service;
	
	@RequestMapping("/loadMonth.do")
	public String loadMonth(String memberId, ModelMap map){
		Map<String, String> param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(new Date()));
		param.put("memberId", memberId);
		
		Map<String, Integer> result = service.selectSpendEachCategory(param);
		System.out.println(result);
		map.addAttribute("result", result);
		return "body/report/month_report.tiles";
	}
}
