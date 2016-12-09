package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
		Date today = new Date();
		Map<String, String> param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(today));
		param.put("memberId", memberId);
		
		List<Map> result = service.selectSpendEachCategory(param);
		for(Map temp: result){
			temp.replace("CATEGORY", "'"+temp.get("CATEGORY")+"'");
		}
		String str = result.toString().replaceAll("=", ":");
		System.out.println(str);
		/*
		Map<String, Integer> result = service.selectSpendEachCategory(param);
		System.out.println(result.size());
		for(String key:result.keySet()){
			System.out.println(result.get(key));
		}*/
		map.addAttribute("result", str);
		map.addAttribute("month", new SimpleDateFormat("yyyy년도 MM월").format(today));
		return "body/report/month_report.tiles";
	}
}
