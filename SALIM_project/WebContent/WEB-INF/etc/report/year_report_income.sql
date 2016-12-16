
--[최종] 특정 해의 전체 수입 내역 - 내용 입력 안된 달도 유효
select stand.LV month, nvl(result.total, 0) income_month_total 
from (	select month, sum(income_money) total
		from (	select income_id, to_char(income_date, 'MM') month, income_money
				from income 
				where to_char(income_date, 'YYYY')='2016' and member_id='tester2'	)
		group by month	)	result,
	 (	SELECT LPAD(LEVEL, 2, '0') LV FROM DUAL CONNECT BY LEVEL <= 12	) stand 
where result.month(+) = stand.LV
order by stand.LV;	


-- 특정 해의 전체 수입 내역 - 내용이 있는 달만
select month, sum(income_money) total
from (	select income_id, to_char(income_date, 'MM') month, income_money
		from income 
		where to_char(income_date, 'YYYY')='2016' and member_id='tester2'	)
group by month;

-- [최종] 대분류명과 해당 분류의 총 수입
-- 참고. ''''을 붇이는 경우 '이 결과에 붙어서 나온다.
select ''''||big.big_content||'''' category, nvl(result.total, 0) 
from bigcategory big, 
	(	select big_code, sum(total) total
		from (	select small.small_code, small.small_content, small.big_code, result.total
				from smallcategory small,
					(	select code_id, sum(income_money) total
						from income 
						where to_char(income_date, 'YYYY-MM')='2016-12' and member_id='tester2'
						group by code_id	) 	result
				where small.small_code = result.code_id		)
		group by big_code) result
where big.big_code = result.big_code(+) and big.high_code = 1
order by big.big_code;


-- 대분류ID와 해당 분류의 총 수입
select big_code, sum(total) total
from (	select small.small_code, small.small_content, small.big_code, result.total
		from smallcategory small,
			(	select code_id, sum(income_money) total
				from (	select code_id, income_money
						from income 
						where to_char(income_date, 'YYYY-MM')='2016-12' and member_id='tester2'	)
				group by code_id	) result
		where small.small_code = result.code_id		)
group by big_code;


-- 소분류의 대분류코드 조회
select small.small_code, small.small_content, small.big_code, result.total
from smallcategory small,
	(	select code_id, sum(income_money) total
		from (	select code_id, income_money
				from income 
				where to_char(income_date, 'YYYY-MM')='2016-12' and member_id='tester2'	)
		group by code_id	) result
where small.small_code = result.code_id;

-- 해당 달에 대한 총 수입의 합
select code_id, sum(income_money) total
from income 
where to_char(income_date, 'YYYY-MM')='2016-12' and member_id='tester2'
group by code_id;

-- 특정달 특정id 
select code_id, income_money
from income 
where to_char(income_date, 'YYYY-MM')='2016-12' and member_id='tester2';



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

