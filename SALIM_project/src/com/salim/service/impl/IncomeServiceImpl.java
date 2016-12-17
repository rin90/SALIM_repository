package com.salim.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.CategoryDao;
import com.salim.dao.ExpenseDao;
import com.salim.dao.IncomeDao;
import com.salim.service.IncomeService;
import com.salim.service.NotesService;
import com.salim.vo.BigCategory;
import com.salim.vo.Income;
import com.salim.vo.Notes;
import com.salim.vo.SmallCategory;

@Service
public class IncomeServiceImpl implements IncomeService{
	
	@Autowired
	private IncomeDao dao;
	@Autowired
	private ExpenseDao expenseDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private NotesService notesService;

	
	//저장 & 수정
	public void saveIncome(String memberId, ArrayList<Integer> incomeId, ArrayList<String> explanation, ArrayList<Integer> incomeMoney,
			ArrayList<Integer> codeId, Date incomeDate, String content, int no) {
		
		//검증
		int max = 1;
		if(explanation.size() > codeId.size() && explanation.size() > incomeMoney.size()){
			max = explanation.size();
		}else if(codeId.size() > incomeMoney.size()){
			max = codeId.size();
		}else{
			max = incomeMoney.size();
		}
		for(int i=0; i<max; i++){
			try{
				if(codeId.get(i) == null){
					codeId.set(i, 1);
				}
			}catch(Exception e){
				codeId.add(i, 1);
			}
			try{
				if(explanation.get(i) == null || explanation.get(i).isEmpty()){
					explanation.set(i, " ");
				}
			}catch(Exception e){
				explanation.add(i, " ");
			}
			try{
				if(incomeMoney.get(i) == null){
					incomeMoney.set(i, 0);
				}
			}catch(Exception e){
				incomeMoney.add(i, 0);
			}
		}		
	
		//메모	
		notesService.saveNotes(new Notes(no, incomeDate, content, memberId));
		
		//저장할 객체 만들기 - 수입
		List<Income> incomeList = new ArrayList<Income>();
		for(int i=0; i<max; i++){
			if(codeId.get(i)==1 && explanation.get(i).trim().isEmpty() && incomeMoney.get(i) == 0){
				//return "redirect:/household/login/incomeSelect.do?incomeDate="+new SimpleDateFormat("yyyy-MM-dd").format(incomeDate);
			}else{
				incomeList.add(new Income(incomeId.get(i), memberId, codeId.get(i), incomeDate, explanation.get(i), incomeMoney.get(i)));
			}
		}
		for(int i=0; i<incomeList.size(); i++){
			Income income = incomeList.get(i);
			if(income.getIncomeId() == 0){
				dao.insertIncome(income);
			}else{
				dao.updateIncome(income);
			}
		}
	}
	
	//조회
	public Map selectIncome(String memberId, Date incomeDate) {//map으로 memberId와 incomeDate를 받음.
		
		//Dao로 넘길 값들 한번에
		Map param = new HashMap();
		param.put("memberId", memberId);
		param.put("dayDate", incomeDate);
		param.put("incomeDate", incomeDate);
		param.put("monthday", new SimpleDateFormat("yyyy-MM").format(incomeDate));
		
		//수입 조회
		List<Income> incomeList = dao.selectIncomeList(param); 
		
		//대분류 조회
		List<BigCategory> bigCategoryList = categoryDao.selectBigCode(categoryDao.selectHighCode("수입").getBigCode());
		
		//조회된 지출에 해당되는 소분류 조회
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<incomeList.size(); i++){
			int bidgCode = incomeList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryDao.selectBigCodeBySmallCode(bidgCode));
		}
		
		//메모 조회
		Notes notes = notesService.findNotes(param);	
		
		//수입 한달동안 누계
		int incomeSum= dao.selectForOneMonthIncome(param);
		//지출 한달동안 누계
		int expenseSum = expenseDao.selectForOneMonthExpense(param);

		//수입 조회에 다 조회
		Map result = new HashMap();
		result.put("incomeList", incomeList);
		result.put("bigCategoryList", bigCategoryList);
		result.put("selectSmallCategoryList", selectSmallCategoryList);
		result.put("notes", notes);//==null?"":notes
		result.put("incomeSum", incomeSum);
		result.put("expenseSum", expenseSum);
		
		return result;
	}

	//삭제
	public void deleteIncome(List<Integer> incomeIdList, String memberId) {
		
		for(int i=0; i<incomeIdList.size(); i++){
			if(incomeIdList.get(i) == 0 || incomeIdList.get(i) == null){
				incomeIdList.remove(i);
			}
		Map map = new HashMap();
		map.put("incomeId", incomeIdList.get(i));
		map.put("memberId", memberId);
		dao.deleteIncome(map);
		}
	}

	/*============================================
		일일 수입 내역 총액
	  ============================================*/
	@Override
	public int selectDayIncome(Map map) {
		return dao.selectDayIncome(map);
	}


	
}
