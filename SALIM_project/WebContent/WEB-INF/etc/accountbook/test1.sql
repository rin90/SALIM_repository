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
	 
insert into notes values (seq_nts.nextval, '2016-12-02', '내용용', '1'); 	 
	 
	 
update notes set content='수정된 내용'
where no=1;
	 
select no, day_date, content, member_id
from NOTES
where member_id=1
and day_date='2016-12-02';

-- member와 join된 것 없애기
alter table notes drop constraint nts_mem_fk;
alter table notes drop constraint nts_mem_fk;




select member_id, card_id, card_type, card_description from CARd
where member_id=1;