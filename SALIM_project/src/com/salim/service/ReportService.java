package com.salim.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
	/**
	 * 대분류에 따른 지출금액 조회.
	 * @param map	memberId, 기준이 되는 달(형식 예: 2016-12)
	 * @return
	 */
	List selectSpendEachCategory(Map map); 
	
}
