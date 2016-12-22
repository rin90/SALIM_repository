select * from EXPENSE;

select sum(nvl(cash_expense, 0) + nvl(card_expense, 0)) expense
from expense
where member_id='tester2' and to_char(expense_date, 'YYYY-MM-DD') = '2016-12-03';

-- =========================================
select * from income;

select sum(income_money) income
from income 
where member_id='tester2' and to_char(income_date, 'YYYY-MM-DD') = '2016-11-05';

