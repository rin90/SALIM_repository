package com.salim.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.salim.service.ExpenseService;
import com.salim.service.GoalService;
import com.salim.service.IncomeService;
import com.salim.service.NotesService;
import com.salim.service.ScheduleService;
import com.salim.vo.Collect;
import com.salim.vo.Goal;
import com.salim.vo.Member;
import com.salim.vo.Notes;
import com.salim.vo.Schedule;
import com.salim.vo.ScheduleSet;

// [참고] HttpSession session 을 매개변수로 가지고 있는 부분은 String memberId, 으로 변경해서 사용 가능
// 		단, 변경하는 경우 무조건 memberId를 tester2로 지정하게됨.

@Controller
@RequestMapping("/calendar/login")
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

	
	@RequestMapping("/load.do")
	public String loadCalendar(HttpSession session, ModelMap map){	// ModelAttribute의 경우 자동으로 request scope속성으로 등록됨
		Map param = new HashMap();
		param.put("month", new SimpleDateFormat("yyyy-MM").format(new Date()));
		param.put("memberId", checkMemberId(session));
		
		Goal goal = gservice.getGoal(param);
		System.out.println(goal);
		map.addAttribute("goal", goal);
		
		return "body/calendar/calendar.tiles";
	}
	
	@RequestMapping("/reload.do")
	@ResponseBody
	public List<Schedule> reLoadCalendar(HttpSession session, String date, ModelMap map, HttpServletResponse res){
		// 캐시를 사용하고 있는 경우 그냥 ajax로 데이터를 불러오는 script부분은 계속 남아있기 때문에 캐쉬를 날려줌
		// 근본적인 해결 방법은 아니며 ajax를 많이 사용하는 경우 cache를 페이지 열 때마다 없애는 형태로 만들어 두는 것이 좋음.
		res.setHeader("cache-control", "no-cache");	
		
		Map<String,Object> param = new HashMap();
		param.put("month", date);
		param.put("memberId", checkMemberId(session));
		
		Goal goal = gservice.getGoal(param);
		map.addAttribute("goal", goal);

		List<Schedule> result = sservice.selectScheduleByMonth(param);
		System.out.println("총 갯수("+result.size()+"). 조회결과 : " + result);
		return result;
	}

	
	@RequestMapping("/loadSchedule")
	@ResponseBody
	Map loadSchedule(HttpSession session, String startDate){		// 일자를 클릭하는 경우 해당 일자의 일정을 받아오는 것.
		Map<String, Object> param = new HashMap();
		param.put("day", startDate);
		param.put("memberId", checkMemberId(session));
		param.put("dayDate", startDate);		// note용
		
		System.out.println("loadSchedule");
		
		Map<String, Object> result = new HashMap<>();
		result.put("daySchedule", sservice.selectScheduleByDay(param));
		result.put("dayNote", nservice.findNotes(param));
		
		result.put("dayExpense", (Integer)eservice.selectDayExpense(param));
		result.put("dayIncome", (Integer)iservice.selectDayIncome(param));
		
		return result;
	}
	
	@RequestMapping("/updateSchedule")
	@ResponseBody 
	Map updateSchedule(@ModelAttribute ScheduleSet list, String memo, HttpSession session) throws Exception{
		Map map = new HashMap();
		list.setMemberId(checkMemberId(session));
		
		//메모 관련 처리 -> 다시 작업해야함.
		Map<String, Object> param = new HashMap();
		param.put("memberId", list.getMemberId());
		System.out.println(list.getStart());
		Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(list.getStart());
		param.put("dayDate", startDate);		// note용
		Notes note = nservice.findNotes(param);		// 객체가 있는지 여부를 확인하고
		if(note==null)								// 없으면 만듬
			note = new Notes(0, java.sql.Date.valueOf(list.getStart()), memo, list.getMemberId());
		else										// 있는 경우 memo부분 갱신
			note.setContent(memo);
		nservice.saveNotes(note);					// 저장하고

		note = nservice.findNotes(param);			// 어떤일을 수행했는지 여부를 판단
		System.out.println(note);
		map.put("memo", note);
		
		
		// 일정 관련 처리
		if(list.getDetail()!=null){
			System.out.println(list.settingSchedule());
			List<Schedule> slist = list.settingSchedule();
			sservice.updateSchedule(slist);
			System.out.println(slist);
			map.put("list", slist);
		}
		return map;
	}
	
	@RequestMapping("/deleteSchedule")
	@ResponseBody
	int[] deleteSchedule(int[] no){
		sservice.deleteSchedule(no);
		return no;
	}
}
