-- 단순히 01~12월 까지 표현
SELECT 
LPAD(LEVEL, 2, '0') LV 
FROM DUAL CONNECT BY LEVEL <= 12

-- [최종] 특정 계정의 1년동안의 수입*지출 내역
select ''''||i.month||'월'||'''' month, i.income_month_total, s.spend_month_total 
from (	select stand.LV month, nvl(result.total, 0) income_month_total 
		from (	select month, sum(income_money) total
				from (	select income_id, to_char(income_date, 'MM') month, income_money
						from income 
						where to_char(income_date, 'YYYY')='2016' and member_id='tester2'	)
				group by month	)	result,
			 (	SELECT LPAD(LEVEL, 2, '0') LV FROM DUAL CONNECT BY LEVEL <= 12	) stand 
		where result.month(+) = stand.LV	)	i,
	 (	select stand.LV month, nvl(result.total, 0) spend_month_total  
		from (	select sum(cash+card) total, edate
				from(	select code_id, nvl(cash_expense,0) cash, nvl(card_expense,0) card, to_char(expense_date, 'MM') edate
						from expense
						where to_char(expense_date, 'YYYY')='2016' and member_id='tester2'	)
				group by edate	)	result,
			 (	SELECT LPAD(LEVEL, 2, '0') LV FROM DUAL CONNECT BY LEVEL <= 12	) stand 
		where result.edate(+) = stand.LV	)	s 
where i.month=s.month 
order by i.month;



-- [최종] 특정 계정이 1년동안 각각의 달(년도-달)에 지출한 금액의 총합	- 내용이 없는 달도 유효
select stand.LV month, nvl(result.total, 0) spend_month_total  
from (	select sum(cash+card) total, edate
		from(	select code_id, nvl(cash_expense,0) cash, nvl(card_expense,0) card, to_char(expense_date, 'MM') edate
				from expense
				where to_char(expense_date, 'YYYY')='2016' and member_id='tester2'	)
		group by edate	)	result,
	 (	SELECT LPAD(LEVEL, 2, '0') LV FROM DUAL CONNECT BY LEVEL <= 12	) stand 
where result.edate(+) = stand.LV
order by stand.LV;


-- 특정 계정이 각각의 달(년도-달)에 지출한 금액의 총합	- 내용 있는 달만 
select sum(cash+card) total, edate
from(	select code_id, nvl(cash_expense,0) cash, nvl(card_expense,0) card, to_char(expense_date, 'MM') edate
		from expense
		where to_char(expense_date, 'YYYY')='2016' and member_id='tester2'	)
group by edate;



-- 특정 계정이 지출한 내역 조회(null값은 0으로 변경)
select code_id, nvl(cash_expense,0) cash, nvl(card_expense,0) card, to_char(expense_date, 'YYYY-MM') edate
from expense
where to_char(expense_date, 'YYYY')='2016' and member_id='tester2';

-- 특정 달, 특정 계정이 지출한 내역 조회
select code_id,cash_expense, card_expense, expense_date
from expense
where to_char(expense_date, 'YYYY')='2016' and member_id='tester2';

select count(*) from expense;