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

	@Override	@Transactional	// 조회하는 부분이기 때문에 굳이 Tx처리 해 주지 않아도 됨.
	public Map<String, List> selectYearReport(Map map) {
		
		Map<String, List> result = new HashMap<>();
/*		
  		result.put("totalImport", idao.selectImportEachMonth(map));
		result.put("totalSpend", edao.selectSpendEachMonth(map));
*/
		result.put("total", edao.selectTotalMonthReport(map));
		
		ArrayList<List> detailImport = new ArrayList<>();
		ArrayList<List> detailSpend = new ArrayList<>();
		String year = (String)map.get("year");
		// map에 달을 셋팅해서~
		for(int i=1; i<=12; i++){	// 달의 역할 수행
			map.put("month", year+(i<9? "-0"+i:"-"+i));
			detailImport.add(idao.selectImportEachCategory(map));
			detailSpend.add(edao.selectSpendEachCategory(map));
		}
		result.put("detailImport", detailImport);
		result.put("detailSpend", detailSpend);
		
		return result;
	}

}
