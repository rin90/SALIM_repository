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
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		map.addAttribute("result", str);
		map.addAttribute("month", new SimpleDateFormat("yyyy-MM").format(today));
		return "body/report/month_report.tiles";
	}
	
	@RequestMapping("/updateMonth.do")
	@ResponseBody
	public List<Map> updateMonth(String memberId, String month){
		Map<String, String> param = new HashMap();
		param.put("month", month);
		param.put("memberId", memberId);
		return service.selectSpendEachCategory(param);
	}
	
	@RequestMapping("/loadYear.do")
	public String loadYear(String memberId, String year, ModelMap map){
		if(year==null){
			year = new SimpleDateFormat("yyyy").format(new Date());
		}
		Map<String, String> param = new HashMap();
		param.put("year", year);
		param.put("memberId", memberId);
		param.put("converter", "true");	// 수정부분
		
		Map result = service.selectYearReport(param);
		result.replace("total", result.get("total").toString().replaceAll("=", ":"));
		map.addAllAttributes(result);
		map.addAttribute("year", year);
		return "body/report/year_report.tiles";
	}
	
	@RequestMapping("/updateYear.do")
	@ResponseBody
	public Map updateYear(String year, String memberId){
		Map<String, String> param = new HashMap();
		param.put("year", year);
		param.put("memberId", memberId);
		param.put("converter", "false");// 수정부분

		return service.selectYearReport(param);
	}
	
}
