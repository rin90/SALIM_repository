-- 예산 등록
insert into budget values (seq_bud.nextval, 'tester2', 
	to_date('2016-12', 'YYYY-MM'), -- 예산일
	3000000, -- 예산금액	
	350000, -- 식비
	110000, -- 주거/통신
	100000, -- 생활용품 
	100000, -- 의복/미용
	150000, -- 건강/문화
	500000, -- 교육/육아
	200000, -- 교통/차량
	50000, -- 경조사/회비
	200000, -- 세금/이자
	100000, -- 용돈/기타
	500000, -- 저축/보험
	0,	-- 카드대금
	0	-- 미분류
);

-- 수입 등록(급여)
insert into income values (seq_inc.nextval, 'tester2', 2, to_date('2016-12-05','YYYY-MM-DD'), 'A회사', 2000000);
insert into income values (seq_inc.nextval, 'tester2', 3, to_date('2016-12-30','YYYY-MM-DD'), 'A상여급', 800000);
insert into income values (seq_inc.nextval, 'tester2', 6, to_date('2016-12-15','YYYY-MM-DD'), 'B통장이자', 11000);
insert into income values (seq_inc.nextval, 'tester2', 2, to_date('2016-11-05','YYYY-MM-DD'), 'A회사', 2000000);
insert into income values (seq_inc.nextval, 'tester2', 2, to_date('2015-01-05','YYYY-MM-DD'), 'A회사', 1800000);

insert into income values (seq_inc.nextval, 'tester', 6, to_date('2016-12-20','YYYY-MM-DD'), 'C통장이자', 22000);
insert into income values (seq_inc.nextval, 'tester', 2, to_date('2016-11-05','YYYY-MM-DD'), 'A회사', 2500000);


---------------- BigCategory 9 --------------------------
-- 지출 등록(주식비-19	)
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 19, to_date('2016-12-01','YYYY-MM-DD'), 7000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 19, to_date('2016-12-02','YYYY-MM-DD'), 8000);
insert into expense (expense_id, member_id, code_id, expense_date, card_expense)
values (seq_exp.nextval, 'tester2', 19, to_date('2016-12-03','YYYY-MM-DD'), 11000);

-- 지출 등록(간식비-21, 커피/음료-23)
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 23, to_date('2016-12-08','YYYY-MM-DD'), 4300);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 23, to_date('2016-12-11','YYYY-MM-DD'), 3900);
insert into expense (expense_id, member_id, code_id, expense_date, card_expense)
values (seq_exp.nextval, 'tester2', 21, to_date('2016-12-01','YYYY-MM-DD'), 1100);
---------------------------------------------------------------------------------------
------------------- BigCategory 10-----------------------------
-- 지출 등록(월세-30)
insert into expense (expense_id, member_id, code_id, expense_date, card_expense)
values (seq_exp.nextval, 'tester2', 30, to_date('2016-12-16','YYYY-MM-DD'), 300000);
------------------------------------------------------------------
------------------- BigCategory 11-----------------------------
-- 지출 등록(잡화소모-34)
insert into expense (expense_id, member_id, code_id, expense_date, card_expense)
values (seq_exp.nextval, 'tester2', 34, to_date('2016-12-03','YYYY-MM-DD'), 18000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 34, to_date('2016-12-11','YYYY-MM-DD'), 28000);
------------------------------------------------------------------
------------------- BigCategory 13-----------------------------
-- 지출 등록(여행-43)
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 43, to_date('2016-12-24','YYYY-MM-DD'), 100000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 43, to_date('2016-11-20','YYYY-MM-DD'), 100000);
------------------------------------------------------------------
------------------- BigCategory 16-----------------------------
-- 지출 등록(데이트-57)
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 57, to_date('2016-12-20','YYYY-MM-DD'), 33000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 57, to_date('2016-12-02','YYYY-MM-DD'), 12000);
insert into expense (expense_id, member_id, code_id, expense_date, card_expense)
values (seq_exp.nextval, 'tester2', 57, to_date('2016-12-18','YYYY-MM-DD'), 46000);
-- 지출 등록(선물-58)
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 58, to_date('2016-12-24','YYYY-MM-DD'), 23000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester2', 58, to_date('2016-11-03','YYYY-MM-DD'), 37000);
insert into expense (expense_id, member_id, code_id, expense_date, cash_expense)
values (seq_exp.nextval, 'tester', 58, to_date('2016-12-23','YYYY-MM-DD'), 7000);
------------------------------------------------------------------
