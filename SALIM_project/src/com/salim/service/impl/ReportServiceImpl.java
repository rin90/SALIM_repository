package com.salim.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.salim.dao.ExpenseDao;
import com.salim.dao.IncomeDao;
import com.salim.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	ExpenseDao edao;
	
	@Autowired
	IncomeDao idao;

	@Override
	public List selectSpendEachCategory(Map map) {
		return edao.selectSpendEachCategory(map);
	}

	@Override	@Transactional	
	public Map<String, List> selectYearReport(Map map) {
		Map<String, List> result = new HashMap<>();
		
		ArrayList detailImport = new ArrayList();
		ArrayList detailSpend = new ArrayList();
		String year = (String)map.get("year");
		
		if(map.get("converter").equals("true")){
			// 달별 총 수입 지출 가지고 오는 부분
			result.put("total", wrapSinglePotation(edao.selectTotalMonthReport(map), "MONTH"));
			// 달별 대분류에 따른 내용 받아오는 부분
			for(int i=1; i<=12; i++){	
				map.put("month", year+(i<9? "-0"+i:"-"+i));
				// 수입
				detailImport.add(wrapSinglePotation(idao.selectImportEachCategory(map), "CATEGORY").toString().replace("=", ":"));
				// 지출
				detailSpend.add(wrapSinglePotation(edao.selectSpendEachCategory(map), "CATEGORY").toString().replace("=", ":"));
			}
		}else{
			result.put("total", edao.selectTotalMonthReport(map));
			for(int i=1; i<=12; i++){	
				map.put("month", year+(i<9? "-0"+i:"-"+i));
				detailImport.add(idao.selectImportEachCategory(map));
				detailSpend.add(edao.selectSpendEachCategory(map));
			}
		}
		result.put("detailImport", detailImport);
		result.put("detailSpend", detailSpend);
		return result;
	}

	// target에 해당하는 값을 ''으로 감싸게 하는 Method
	public List<Map> wrapSinglePotation(List<Map> list, String target){
		for(Map temp: list){	// category의 값을 ''으로 감쌀 수 있게 변경해야함.
			temp.replace(target, "'"+temp.get(target)+"'");
		}
		return list;
	}

	// 1달동안 사용한 내역들 중 사용금액이 많은 순서대로 조회 (대분류 기준)
	@Override
	public List selectSpendOrderByMoney(Map map) {
		List temp = edao.selectSpendOrderByMoney(map);
		System.out.println("Service : " + temp);
		return temp;
	}
	
	
}
