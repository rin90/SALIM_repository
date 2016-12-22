package com.salim.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
	/**
	 * 대분류에 따른 1달동안의 지출금액 조회.
	 * @param map	memberId, 기준이 되는 달(형식 예: 2016-12)
	 * @return
	 */
	List selectSpendEachCategory(Map map); 
	
	/**
	 * 1년동안의 수입*지출 내역
	 * @param map	memberId, year 이 있어야해.
	 * @return		[totalImport]  1년 동안의 각 달의 수입액,
	 * 				[detailImport] 각 달의 수입 내역을 대분류별로 상세하게,
	 * 				[totalSpend]   1년 동안의 각 달의 지출액,
	 * 				[detailSpend]  각 달의 지출 내역을 대분류별로 상세하게.
	 */
	Map<String, List> selectYearReport(Map map);
	
	/**
	 * 1달동안 사용한 내역들 중 사용금액이 많은 순서대로 조회 (대분류 기준)
	 * @param map		대상ID(memberId), 
	 * 					해당하는 달(month - 형식예: 2016-12)
	 */
	List selectSpendOrderByMoney(Map map);
	
}
