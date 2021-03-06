package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.ReportService;
import com.salim.vo.Collect;
import com.salim.vo.Member;

@Controller
@RequestMapping("/report/login")
public class ReportController {
	
	@Autowired
	private ReportService service;
	
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

	
	@RequestMapping("/loadMonth.do")
//	public String loadMonth(String memberId, ModelMap map){
	public String loadMonth(HttpSession session, ModelMap map){
		Date today = new Date();
		Map<String, String> param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(today));
		param.put("memberId", checkMemberId(session));
		
		// Graph에 뿌릴 내용 조회
		List<Map> result = service.selectSpendEachCategory(param);
		for(Map temp: result){
			temp.replace("CATEGORY", "'"+temp.get("CATEGORY")+"'");
		}
		String str = result.toString().replaceAll("=", ":");
		System.out.println(str);
		
		// 실제 카테고리에 값이 있는 경우만 조회 - 사용금액 많은 순서대로.
		List<Map> alignMoney = service.selectSpendOrderByMoney(param);
		for(Map temp: alignMoney){
			temp.replace("BIG_CONTENT", "'"+temp.get("BIG_CONTENT")+"'");
		}
		String str2 = alignMoney.toString().replaceAll("=", ":");
		System.out.println("Controller : " + alignMoney);
		
		// 전달값을 Request로 담기
		map.addAttribute("result", str);
		map.addAttribute("month", new SimpleDateFormat("yyyy-MM").format(today));
		map.addAttribute("top5", str2);
		
		return "body/report/month_report.tiles";
	}
	
	@RequestMapping("/updateMonth.do")
	@ResponseBody
//	public List<Map> updateMonth(String memberId, String month){
	public Map updateMonth(HttpSession session, String month){
		Map<String, String> param = new HashMap();
		param.put("month", month);
		param.put("memberId", checkMemberId(session));
		
		Map result = new HashMap();
		result.put("list", service.selectSpendEachCategory(param));
		result.put("top5", service.selectSpendOrderByMoney(param));
		return result;
	}
	
	@RequestMapping("/loadYear.do")
//	public String loadYear(String memberId, String year, ModelMap map){
	public String loadYear(HttpSession session, String year, ModelMap map){
		if(year==null){
			year = new SimpleDateFormat("yyyy").format(new Date());
		}
		Map<String, String> param = new HashMap();
		param.put("year", year);
		param.put("memberId", checkMemberId(session));
		param.put("converter", "true");	// 수정부분
		
		Map result = service.selectYearReport(param);
		result.replace("total", result.get("total").toString().replaceAll("=", ":"));
		map.addAllAttributes(result);
		map.addAttribute("year", year);
		return "body/report/year_report.tiles";
	}
	
	@RequestMapping("/updateYear.do")
	@ResponseBody
//	public Map updateYear(String year, String memberId){
	public Map updateYear(String year, HttpSession session){
		Map<String, String> param = new HashMap();
		param.put("year", year);
		param.put("memberId", checkMemberId(session));
		param.put("converter", "false");// 수정부분

		return service.selectYearReport(param);
	}
	
}
