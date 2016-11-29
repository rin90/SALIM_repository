create table member(  --회원
 member_id varchar2(50) primary key,
 name varchar2(20) not null,
 age number not null,
 birthday date not null,  -- 생일
 password varchar2(50) not null
);

drop table member;



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



