
-- [최종] 특정 계정이 각각의 달(년도-달)에 지출한 금액의 총합
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