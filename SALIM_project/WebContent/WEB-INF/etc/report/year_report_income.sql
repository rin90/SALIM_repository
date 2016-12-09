
--[최종] 특정 해의 전체 수입 내역
select month, sum(income_money) total
from (	select income_id, to_char(income_date, 'MM') month, income_money
		from income 
		where to_char(income_date, 'YYYY')='2016' and member_id='tester2'	)
group by month;



select income_id, to_char(income_date, 'MM') month, income_money
from income 
where to_char(income_date, 'YYYY')='2016' and member_id='tester2'



-- [참조 ] - [최종] 특정 계정의 특정 달에 대분류별 지출내역
select big_content category, sum(total) spend_money
from (	select big.big_code, big.big_content, nvl(small.total, 0) total
		from bigcategory big, 
			(select s.small_code, s.small_content, e.total, s.big_code
			 from smallcategory s, 
				(select code_id, nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
					from expense
					where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
					group by code_id) e
		 	 where s.small_code = e. code_id) small
		where big.big_code=small.big_code(+) and big.high_code=2	) 
group by big_content
order by big_content;

