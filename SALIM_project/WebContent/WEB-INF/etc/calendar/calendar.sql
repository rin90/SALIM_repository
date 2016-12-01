

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
y_m Date not null,--목표달
goal varchar2(1000) not null,--내용
member_id varchar2(50) constraint goa_mem_fk references member not null--회원id
);
select * from goals where member_id='tester' and to_char(y_m, 'yyyymm')='201612';
drop table goals;

insert into goals values(seq_goa.nextval, sysdate, '일정완성하고 싶다...', 'tester');


