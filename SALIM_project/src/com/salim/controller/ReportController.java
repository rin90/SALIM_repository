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
	private ReportService service;
	
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
	
	@RequestMapping("/loadYear.do")
	public String loadYear(String memberId, ModelMap map){
		String year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> param = new HashMap();
		param.put("year", year);
		param.put("memberId", memberId);
		
		Map result = service.selectYearReport(param);
		map.addAllAttributes(result);
		map.addAttribute("total2", result.get("total").toString().replaceAll("=", ":"));
		System.out.println(map.get("total2"));
//		map.addAttribute("totalSpend2", result.get("totalSpend").toString().replaceAll("=", ":"));
		map.addAttribute("year", year);
		return "body/report/year_report.tiles";
	}
	
	
}
