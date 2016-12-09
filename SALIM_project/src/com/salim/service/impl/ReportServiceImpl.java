package com.salim.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salim.dao.ExpenseDao;
import com.salim.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	ExpenseDao edao;

	@Override
	public Map<String, Integer> selectSpendEachCategory(Map map) {
		
		return edao.selectSpendEachCategory(map);
	}

}
