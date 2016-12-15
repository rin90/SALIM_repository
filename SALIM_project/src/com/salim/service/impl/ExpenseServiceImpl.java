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
import com.salim.service.ExpenseService;
import com.salim.service.NotesService;
import com.salim.vo.BigCategory;
import com.salim.vo.Expense;
import com.salim.vo.Notes;
import com.salim.vo.SmallCategory;

@Service
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	private ExpenseDao dao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private NotesService notesService;

	//저장 및 수정
	public void saveExpense(String memberId, ArrayList<Integer> expenseId, ArrayList<String> expenseExplain, ArrayList<Integer> cashExpense, 
					ArrayList<Integer> cardExpense, ArrayList<Integer> codeId, Date expenseDate, String content, int no) {

		//검증
		int max =1;
		if(expenseExplain.size() > cashExpense.size() && expenseExplain.size() > cardExpense.size() && expenseExplain.size() > codeId.size()){
			max = expenseExplain.size();
		}else if(cashExpense.size() > cardExpense.size() && cashExpense.size() > codeId.size()){
			max = cashExpense.size();
		}else if(cardExpense.size() > codeId.size()){
			max = cardExpense.size();
		}else{
			max = codeId.size();
		}
		for(int i=0; i<max; i++){
			try{
				if(expenseExplain.get(i) == null || expenseExplain.get(i).isEmpty()){
					expenseExplain.set(i, " ");
				}
			}catch(Exception e){
				expenseExplain.add(i, " ");
			}
			try{
				if(cashExpense.get(i) == null){
					cashExpense.set(i, 0);
				}
			}catch(Exception e){
				cashExpense.add(i, 0);
			}
			try{
				if(cardExpense.get(i) == null){
					cardExpense.set(i, 0);
				}
			}catch(Exception e){
				cardExpense.add(i, 0);
			}
			try{
				if(codeId.get(i) == null){
					codeId.set(i, 18);
				}
			}catch(Exception e){
				codeId.add(i, 18);
			}
		}
		//메모 객체 만들기
		notesService.saveNotes(new Notes(no, expenseDate, content, memberId));

			
		//저장할 객체 만들기 - 지출
		List<Expense> expenseList = new ArrayList<> ();
		for(int i=0; i<max; i++){
			if(codeId.get(i)==18 && expenseExplain.get(i).trim().isEmpty() && cashExpense.get(i)==0 && cardExpense.get(i)==0){
				//return "redirect:/household/login/expenseSelect.do?expenseDate="+new SimpleDateFormat("yyyy-MM-dd").format(expenseDate);
			}else{
				expenseList.add(new Expense(expenseId.get(i), memberId, codeId.get(i), expenseDate, expenseExplain.get(i), cashExpense.get(i), cardExpense.get(i), "카드타입"));
			}
		}		
		//expenseId가 기존에 있으면 update, expenseId가 없으면 insert를 실행
		for(int i=0; i<expenseList.size(); i++){
			Expense expense = expenseList.get(i);
			if(expense.getExpenseId()!=0){
				dao.updateExpense(expense);
			}else{
				dao.insertExpense(expense);
			}
		}
	}

	//조회
	public Map selectExpense(String memberId, Date expenseDate) {
		
		//Dao에서 필요한 것
		Map param = new HashMap();
		param.put("memberId", memberId);
		param.put("dayDate", expenseDate);
		param.put("expenseDate", expenseDate);
		
		//지출 조회
		List<Expense> expenseList = dao.selectExpenseList(param);
		//대분류 조회
		List<BigCategory> bigCategoryList = categoryDao.selectBigCode(categoryDao.selectHighCode("지출").getBigCode());
		//조회된 지출에 해당되는 소분류 조회
		List<SmallCategory> selectSmallCategoryList = new ArrayList<>();
		for(int i=0; i<expenseList.size(); i++){
			int bigCode = expenseList.get(i).getCodeId();
			selectSmallCategoryList.add(categoryDao.selectBigCodeBySmallCode(bigCode));
		}
		//메모 조회
		Notes notes = notesService.findNotes(param);
		
		//지출 조회
		Map result = new HashMap();
		result.put("expenseList", expenseList);
		result.put("bigCategoryList", bigCategoryList);
		result.put("selectSmallCategoryList", selectSmallCategoryList);
		result.put("notes", notes);
		
		return result;
	}	
	
	//삭제
	public void deleteExpense(List<Integer> expenseIdList, String memberId) {
		
		for(int i=0; i<expenseIdList.size(); i++){
			if(expenseIdList.get(i)==0 || expenseIdList.get(i)== null){
				expenseIdList.remove(i);
			}
			Map map = new HashMap();
			map.put("expenseId", expenseIdList.get(i));
			map.put("memberId", memberId);
			dao.deleteExpense(map);
		}
	}
	
	
}
