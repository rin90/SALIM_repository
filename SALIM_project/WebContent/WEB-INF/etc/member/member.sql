create table member(  --회원
 member_id varchar2(50) primary key,
 name varchar2(20) not null,
 age number not null,
 birthday date not null,  -- 생일
 password varchar2(50) not null, --비밀번호
 email varchar2(50) not null --email
);



--테이블 삭제
drop table member CASCADE CONSTRAINTS;


-- 11.30 회원 가입 테스트

--회원 가입 
insert into member values('mem1','LJH1',20,'1991-04-15','password1','email1@naver.com');
insert into member values('mem2','LJH2',20,'1991-04-16','password2','email2@naver.com');
insert into member values('mem3','LJH3',20,'1991-04-17','password3','email3@naver.com');
insert into member values('mem4','LJH4',20,'1991-04-18','password4','email4@naver.com');
insert into member values('mem5','LJH5',20,'1991-04-19','password5','email5@naver.com');

--회원 조회
select * from member;
--alter table member1 add(b)



create sequence seq_col--sequence생성
select seq_col.nextval from dual  -- 조회 
drop sequence seq_col--삭제

create table collection(--그룹
collection_id Number primary key,--그룹id
collection_name varchar2(50) not null,--그룹이름
collection_intro varchar2(300)--그룹소개
);

drop table collection;




create table member_collection(--회원그룹
member_id varchar2(50) constraint mco_col_fk references member,
collection_id Number constraint mco_mem_fk references collection,
grant_id varchar2(300) not null,--권한자id
constraint mc_pk primary key(member_id,collection_id) 
);


drop table member_collection;



