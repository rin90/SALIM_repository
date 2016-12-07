package com.salim.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import com.salim.service.CategoryService;
import com.salim.service.IncomeService;
import com.salim.vo.Income;
import com.salim.vo.Member;
import com.salim.vo.SmallCategory;

@Controller
@RequestMapping("/household")
public class IncomeController {
	
	@Autowired
	private IncomeService service;
	
	@Autowired
	private CategoryService categoryService;
	
	
	
	//수입 입력한 것 저장 및 수정
	@RequestMapping(value="/login/income.do", method=RequestMethod.POST)
	/*public View saveIncome(@RequestParam ArrayList<Integer> incomeId, @RequestParam ArrayList<String> explanation, @RequestParam ArrayList<Integer> incomeMoney, 
			@RequestParam ArrayList<Integer> codeId, @DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date incomeDate, HttpSession session){*/
	public View saveIncome(@DateTimeFormat(pattern="yyyy-MM-dd") @RequestParam Date incomeDate, HttpSession session){
	
		/*System.out.println(incomeId);
		System.out.println(explanation);
		System.out.println(incomeMoney);
		System.out.println(codeId);*/
		System.out.println(incomeDate);
		System.out.println("==================");
		
		
		/*//@ModelAttribute IncomeForm incomeForm
		//System.out.println(incomeForm);
		//System.out.println("datepicker에서 선택한 날짜 받아오자"+incomeForm.getIncomeDate());
		System.out.println(incomeForm);
		for(int i =0; i<incomeForm.getList().size(); i++){//incomeForm에 이미 들어가 있는 수입금액, 수입내역, 코드id(소분류) 제외하고 바인딩.
			//income에 바인딩.
			Income income = new Income();
			income.setIncomeId(0);
			income.setMemberId(member.getMemberId());
			income.setCodeId(incomeForm.getList().get(i).getCodeId());
			income.setIncomeDate(incomeForm.getIncomeDate());
			income.setExplanation(incomeForm.getList().get(i).getExplanation());
			income.setIncomeMoney(incomeForm.getList().get(i).getIncomeMoney());
			//incomeList로 만들어줌.
			incomeList.add(income);
		}*/
		
		//항목들을 ArrayList로 받을 때
		//로그인한 회원의 id를 조회해 오기 위해서		
		Member member = (Member) session.getAttribute("login_info");
		
		//받아온 수입을 list로 변환..
		/*List<Income> incomeList = new ArrayList<Income>();
		
		for(int i=0; i<explanation.size(); i++){
			if(incomeId.get(i)!=0 && codeId.get(i)!=null && explanation.get(i)!=null && incomeMoney.get(i) !=null){
				if(incomeMoney.get(i) == null){
					incomeMoney.set(i, 0);
				}
				incomeList.add(new Income(incomeId.get(i), "id-1", codeId.get(i), incomeDate, explanation.get(i), incomeMoney.get(i)));//session.getId()
			}
		}
		
		System.out.println(incomeList);*/
		
		
		//Income income = new Income(0, member.getMemberId(), codeId, incomeDate, explanation, incomeMoney);
		
		//income을 바인딩 후 incomeList로 만들어서 서비스를 호출

		
		/*List<Income> incomeList = new ArrayList();
		incomeList.add(incomeForm);*/
		
		//조회해 온것이 있으면... 그것은 수정, 없으면 생성. - 서비스임플에서 해주니까 나는 income만 모아서 주자
		//service.saveIncome(incomeList);
		
		/*service.saveIncome(incomeList);*/
		
		//handler가 뷰 객체를 리턴하면 DispatcherServlet은 ViewResolver를 거치지 않고 리턴 받은 뷰를 이용해 바로 응답한다.
		InternalResourceView view = new InternalResourceView("/household/login/incomeSelect.do?incomeDate="+incomeDate);//뷰 객체를 넣으면 뷰리절버를 거치지 않고 뷰 객체를 리턴.
	
		return view;//조회하는 애 불러오기.. - 저장한 후 해당 날짜로 조회해서 새로 페이지 보여줘야함.
	}
	
	
	
	
	//해당 날짜에 저장한 수입 목록이 있으면 가져오기
	@RequestMapping(value="/login/incomeSelect.do")//, method=RequestMethod.POST
	public View selectIncome(@DateTimeFormat(pattern="yyyy-MM-dd") Date incomeDate ,HttpServletRequest request){
		
		
		System.out.println(incomeDate);
		System.out.println("=========================================");
		//조회하기
		/*
		 * 처음 입력창으로 들어갔을 때 현재 날짜에 입력한 것이 있으면 조회해서 뿌려줌과 동시에 입력이 안된 라인에는 코드리스트를 뿌려준다.
		 * 없으면 코드리스트를 조회해서 입력하는 곳으로 연결해준다. - 수입입력한 것이 있는지 memberId와 incomeDate로 조회한다.
		 * 
		 */
		
		//임의의 로그인 정보 가져오기
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("login_info")).getMemberId();
		
		//날짜를 조회하기 위해서 - 시간을 제외한 날을 입력하게 만들기 -> 현재 시간으로 하면 시간까지 포함되니까
		if(incomeDate == null){
			Date now = new Date();
			int year = now.getYear();
			int month = now.getMonth();
			int day = now.getDate();
			incomeDate = new Date(year, month, day); 
		}
		
		//해당일과 회원 id로 수입목록을 조회
		Map map = new HashMap<>();
		map.put("memberId", "id-1");//map.put("memberId", memberId);
		map.put("incomeDate", incomeDate);
		List<Income> incomeList = service.selectIncome(map);
		request.setAttribute("incomeList", incomeList);
		
		//
		
		//가져온 incomeList에서 해당하는 소분류 객체 List를 뽑는 일을 하자 & 모든 소분류 가져오기
		List<SmallCategory> selectSmallCategoryList = new ArrayList();
		SmallCategory selectSmallCategory = null;
		
		for(int i=0; i<incomeList.size(); i++){ //해당 날짜로 조회한 incomeList에서 codeId로 그 코드들의 묶음을 조회해옴
			Income income = incomeList.get(i);
			int codeId = income.getCodeId();
			selectSmallCategory = categoryService.selectBigCodeBySmallCode(codeId);
			
			System.out.println("현재 날짜로 컨트롤러에서 조회"+selectSmallCategory);
			
			selectSmallCategoryList.add(selectSmallCategory);
			
/*			//해당 대분류의 전체 소분류 가져오기
			List<SmallCategory> smallCategoryList = categoryService.selectSmallCode(selectSmallCategory.getBigCode());
			*/
			
			//해당하는 날짜의 유지를 위해서 session에 담아줌
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
			
			session.setAttribute("incomeDate", sdf.format(incomeDate));
		}
		request.setAttribute("selectSmallCategoryList", selectSmallCategoryList);
		
		
		
		
		
		
		
		//System.out.println(request.getAttribute("selectSmallCategoryList"));
		
		
		
		return new InternalResourceView("/category/income/bigCode.do");
	}
	
	
	
	
	
	
	
	//삭제
	@RequestMapping("/login/incomeDelete.do")
	@ResponseBody
	public View deleteIncome(@RequestParam List<Integer> incomeIdList, @RequestParam Date incomeDate){
		
		
		//로그인 했는지 체크..
		/*List<Integer> incomelist = new ArrayList<> ();
		for(int i=0; i>incomeIdList.length; i++){
			incomelist.add(incomeIdList[i]);
		}*/

		//하나의 incomeId당 삭제.. 만약 저장되지 않은 0값이 넘어온다면,-> 0값인 경우 자바스크립트에서도 체크되지 않게 표시
		service.deleteIncome(incomeIdList);

		return new InternalResourceView("/household/login/incomeSelect.do?incomeDate="+incomeDate);
	}
	
	
	
	
	
	
}
