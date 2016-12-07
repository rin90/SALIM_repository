select seq_inc.nextval from dual;
insert into income 
values (seq_inc.nextval, 'id-1', 41, '2000-01-01', '설명', 1000);
select * from income;

select * from MEMBER;

select * from INCOME where income_date = '2016-12-02'

select * from CODE where id=41

select b.big_code, b.big_content, b.high_code, 
			   s.small_code, s.small_content, s.big_code
		from bigCategory b, smallCategory s
		where s.big_code = b.big_code
		and s.small_code = 5
