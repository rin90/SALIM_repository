
select * from expense;

select * from bigCategory where high_code=2;

-- [최종] 1달동안 사용한 지출금액
select sum(total) total
from (
	select nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
	from expense
	where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
	group by code_id
)

-- [최종] big_content의 그룹으로 묶어서 각 그룹별 지출 금액 출력 
select big_content, sum(total) spend_money
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



-- big_code의 그룹으로 묶어서 각 그룹별 지출 금액 출력
select big_code, sum(total)
from (	select big.big_code, nvl(small.total, 0) total
		from bigcategory big, 
			(select s.small_code, s.small_content, e.total, s.big_code
			 from smallcategory s, 
				(select code_id, nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
					from expense
					where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
					group by code_id) e
		 	 where s.small_code = e. code_id) small
		where big.big_code=small.big_code(+) and big.high_code=2	)
group by big_code
order by big_code;


-- BigCategory와 SmallCategory별 지출합을 구해논 테이블을 join해서 대분류의 이름 알아오기 및 대분류의 내용 해당하는게 없음 0으로 초기화
-- (카테고리에 기입한 내용이 없을 수 있으므로 '외부조인'!)
select big.big_code, big.big_content, small.small_content, nvl(small.total, 0) total
from bigcategory big, 
	(select s.small_code, s.small_content, e.total, s.big_code
	 from smallcategory s, 
		(select code_id, nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
			from expense
			where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
			group by code_id) e
 	 where s.small_code = e. code_id) small
where big.big_code=small.big_code(+) and big.high_code=2
order by big_code;


-- smallCategory에 특정 달에 smallCategory별 지출합을 구하고 해당하는 카테고리의 명과 소속 big_code를 알아오기
select s.small_code, s.small_content, e.total, s.big_code
from smallcategory s, 
	(select code_id, nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
		from expense
		where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
		group by code_id) e
where s.small_code = e. code_id;

-- 지출 내역을 smallCategory로 기준삼아 묶어서 합을 만든 상황(예- 주식group, 데이트group 등)
select code_id, nvl(sum(cash_expense),0)+nvl(sum(card_expense),0) total
from expense
where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2'
group by code_id;

-- 특정 달까지만
select code_id,cash_expense,card_expense, expense_date
from expense
where to_char(expense_date, 'YYYY-MM')='2016-12' and member_id='tester2';

