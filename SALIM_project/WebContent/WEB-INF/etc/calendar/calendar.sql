

create sequence seq_sch--sequence생성
select seq_sch.nextval from dual  -- 조회 
drop sequence seq_sch--삭제

create table schedule( --일정
no Number primary key, 
title varchar2(60) not null,  --일정제목
detail varchar2(300) not null,  --상세내용
start_date Date not null,  --날짜 (년도-월-일 시간)
end_date Date not null,
member_id varchar2(50) constraint sch_mem_fk references member not null
);
select * from schedule;
drop table schedule;

-- Test Data
insert into schedule values (seq_sch.nextval, '당일 회의', '소프트웨어', 
	to_date('2016-12-07 18:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-07 20:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '플젝 기간-11월시작12월끝', '소프트웨어', 
	to_date('2016-11-27 18:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-17 20:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '크리스마스', '데이트 예정', 
	to_date('2016-12-25 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-25 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '프로젝트 발표', 'SALIM프로젝트 발표 잘 되려나...?', 
	to_date('2016-12-23 18:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-23 20:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '플젝주제선정', '물론 허구지만 우선은....', 
	to_date('2016-11-20 14:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-11-23 20:30:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '생일', '축하축하!', 
	to_date('2016-11-03 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-11-03 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, '일정 구현', '언제 완성되는가...ㅠㅜ', 
	to_date('2016-12-01 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-07 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');
insert into schedule values (seq_sch.nextval, 'dd생일', '축하축하!', 
	to_date('2016-12-13 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), to_date('2016-12-14 00:00:00', 'YYYY-MM-DD hh24:mi:ss'), 'tester2');

--=============================== 조회 완성본 =============================================
select no, title, detail, start_date, end_date, member_id
from schedule
where member_id='tester2' and to_char(start_date,'YYYY-MM')='2016-12' 
						   or (to_char(start_date,'YYYY-MM')<'2016-12' and to_char(end_date,'YYYY-MM')='2016-12');

						   
select no, title, detail, start_date, end_date, member_id
from schedule
where member_id='tester2' and (to_char(start_date,'YYYY-MM-DD')<='2016-12-01' and to_char(end_date,'YYYY-MM-DD')>='2016-12-01');

--======================================================================================

delete from schedule where no=7;
update schedule set title='전체 발표' where no=9;



create sequence seq_goa--sequence생성
select seq_goa.nextval from dual  -- 조회 
drop sequence seq_goa--삭제

-- 확인해보자(dataType) : interval year to month

create table goals(--목표
num number primary key,--목표번호
y_m varchar2(7) not null,--목표달
goal varchar2(1000) not null,--내용
member_id varchar2(50) constraint goa_mem_fk references member not null--회원id
);
alter table goals drop constraint goa_mem_fk ;
drop table goals;

insert into goals values(seq_goa.nextval, '201612', '일정언제 완성해??=ㅅ= 완성하고 싶다...', 'tester2');
update goals set goal='우선 목표를 완성해야지...', y_m=sysdate where member_id='tester2';
delete from goals where num=42 or num=43;
select * from goals where member_id='tester' and y_m='201612';
select * from goals;


