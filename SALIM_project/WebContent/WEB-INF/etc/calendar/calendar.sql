

create sequence seq_sch--sequence생성
select seq_sch.nextval from dual  -- 조회 
drop sequence seq_sch--삭제

create table schedule( --일정
no Number primary key, 
member_id varchar2(50) constraint sch_mem_fk references member not null,
schedule varchar2(50) not null,  --일정제목
schedule_date Date not null,  --날짜 (년도-월-일 시간)
content Varchar2(300) not null  --상세내용
);

drop table schedule;






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
drop table goals;

insert into goals values(seq_goa.nextval, '201612', '일정언제 완성해??=ㅅ= 완성하고 싶다...', 'tester2');
update goals set goal='우선 목표를 완성해야지...', y_m=sysdate where member_id='tester2';
delete from goals where num=24;
select * from goals where member_id='tester' and y_m='201612';
select * from goals;


