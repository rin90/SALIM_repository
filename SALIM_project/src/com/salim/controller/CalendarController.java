package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.ExpenseService;
import com.salim.service.GoalService;
import com.salim.service.IncomeService;
import com.salim.service.NotesService;
import com.salim.service.ScheduleService;
import com.salim.vo.Goal;
import com.salim.vo.Schedule;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private GoalService gservice;
	@Autowired
	private ScheduleService sservice;
	
	// Dialog에 일 단위로 정보 가지고 오기 위한 Service들
	@Autowired
	private NotesService nservice;	// 클릭시 받아오려구.
	@Autowired
	private ExpenseService eservice;
	@Autowired
	private IncomeService iservice;
	
	@RequestMapping("/load.do")
	public String loadCalendar(String memberId, ModelMap map){	// ModelAttribute의 경우 자동으로 request scope속성으로 등록됨
//		String month = new SimpleDateFormat("yyyy-MM").format(new Date());
//		System.out.println("캘린더 컨트롤러 - memberId : "+memberId+", month : "+month);
		
		Map param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(new Date()));
		param.put("memberId", memberId);
		
		Goal goal = gservice.getGoal(param);
		System.out.println(goal);
		map.addAttribute("goal", goal);
		//map.addAttribute("goal", gservice.getGoal(param));
		
// ajax로 데이터를 받아오기 때문에 굳이 필요 없음. 
//		List<Schedule> list = sservice.selectScheduleByMonth(param);
//		System.out.println(list);
//		map.addAttribute("monthScheduleList", list);
		//map.addAttribute("monthScheduleList", sservice.selectScheduleByMonth(param));
		
		return "body/calendar/calendar.tiles";
	}
	
	@RequestMapping("/reload.do")
	@ResponseBody
	public List<Schedule> reLoadCalendar(String memberId, String date, ModelMap map){
//	public List<Schedule> reLoadCalendar(String memberId, String date, ModelMap map, HttpServletResponse res){
//		res.setContentType("application/json;charset=utf-8");
//		System.out.println("---------------------------------------------------");
//		System.out.println(memberId + " , " + date);
		
		Map<String,Object> param = new HashMap();
		param.put("month", date);
		param.put("memberId", memberId);
		Goal goal = gservice.getGoal(param);
		map.addAttribute("goal", goal);
		
//		map.addAttribute("goal", gservice.getGoal(param));
		
		List<Schedule> result = sservice.selectScheduleByMonth(param);
		System.out.println("총 갯수("+result.size()+"). 조회결과 : " + result);
		return result;
//		return sservice.selectScheduleByMonth(param);
	}

	
	@RequestMapping("/loadSchedule")
	@ResponseBody
	Map loadSchedule(String memberId, String startDate){		// 일자를 클릭하는 경우 해당 일자의 일정을 받아오는 것.
		Map<String, Object> param = new HashMap();
		param.put("day", startDate);
		param.put("memberId", memberId);
		param.put("dayDate", startDate);		// note용
		
		System.out.println("loadSchedule");
		
		Map<String, Object> result = new HashMap<>();
		result.put("daySchedule", sservice.selectScheduleByDay(param));
		result.put("dayNote", nservice.findNotes(param));
		
//		result.put("dayIncome", iservice.selectDayIncome(param));
//		result.put("dayExpense", eservice.selectDayExpense(param));
		
		
		return result;
	}
	
	
}
