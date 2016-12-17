create table member(  --회원
 member_id varchar2(50) primary key,
 name varchar2(20) not null,
 age number not null,
 birthday date not null,  -- 생일
 password varchar2(50) not null, --비밀번호
 email varchar2(50) not null --email
);
select * from member;
drop table member;

alter table member add(email varchar2(50) not null); 

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

insert into member values ('tester2', '테스터2', 11, sysdate, 'tester');


create sequence seq_col--sequence생성
select seq_col.nextval from dual  -- 조회 
drop sequence seq_col--삭제

create table collection(--그룹
collection_id varchar2(50) primary key,--그룹id
collection_name varchar2(50) not null,--그룹이름
collection_intro varchar2(300),--그룹소개
grant_id varchar2(50) not null
);

drop table collection CASCADE CONSTRAINTS;

select * from collection;
insert into collection values('g1','그룹이름','그룹 소개','mem1');
insert into collection values('g2','그룹 이름','그룹 소개','mem2');



--초대하면서 이 부분을 처리해야 한다!!
create table member_collection(--회원그룹
member_id varchar2(50) constraint mco_col_fk references member,
collection_id varchar2(50) constraint mco_mem_fk references collection,
invite varchar2(50) not null,
constraint mc_pk primary key(member_id,collection_id) 
);


select * from MEMBER_COLLECTION;
drop table member_collection;



select member_id memberId, collection_id collectionId, invite
 	from member_collection
 	where member_collection.collection_id='collectionId11'

--collection 삭제!----------------------------------------
--선 처리
delete from MEMBER_COLLECTION
where collection_id='collectionId29'
--후 처리
delete from COLLECTION
where collection_id='collectionId29'


-- 조회-----------------------------------------------------------------
select member_id memberId, collection_id collectionId, invite
 	from member_collection
 	where collection_id='collectionId30'

---------------------------------------------------------------------------------------------------------------------------

select COLLECTION.collection_id, COLLECTION.collection_name, COLLECTION.collection_intro
from collection,
(
	select member_collection.member_id memberId, member_collection.collection_id collectionId, member_collection.grant_Id grantId
	from member, member_collection
	where member.member_id=member_collection.member_id
)
where collection.collection_id =collectionId


--[최종] 가계부 조회하기 (로그인 시) -------------------------------------------------------------------------------------------------------------------------
select COLLECTION.collection_id collectionId, COLLECTION.collection_name collectionName, COLLECTION.collection_intro collectionIntro
from collection,
(
	select member_collection.member_id memberId, member_collection.collection_id collectionId, member_collection.grant_Id grantId
	from member_collection,
	(
		select member.member_id memberId
		from member
		where member.member_id='1'
	)
	where memberId=member_collection.member_id
)
where collection.collection_id =collectionId



select COLLECTION.collection_id, COLLECTION.collection_name, COLLECTION.collection_intro
	from collection,
	(
		select member_collection.member_id memberId, member_collection.collection_id collectionId, member_collection.grant_Id grantId
		from member, member_collection
		where member_collection.member_id='1'
	)
	where collection.collection_id = collectionId

---------------------------------------------------------------------------------------------------------------------------

--그룹 아이디를 받아와서 회원 정보 뿌리기! 음, 그랭 ㅇㅋㅇㅋ
select MEMBER.name, Member.email, Member.birthday
from Member,(
	select mc.member_id memberId3, mc.collection_Id collectionId, mc.invite
	from member_collection mc, (
		select collection.collection_id collectionId2
		from collection
		where collection.collection_id='collectionId49'
		)
where mc.collection_id=collectionId2 and mc.invite='true'
)
where MEMBER.member_id=memberId3
	
-----------------------------------------------------------------
--로그인 했을 때, 화면 뿌려주는 부분에서 그룹을 이제 나눠서 뿌려줘야 함! -true인 경우!

select collection.collection_id, collection.collection_name, collection.collection_intro, collection.grant_id
from collection, (
	select mc.collection_id collectionId2
	from member_collection mc
	where mc.member_id='mem2' and mc.invite='false'
)
where collection.collection_id=collectionId2

---------------------------------------------------------------------------------------------------
   update member_collection
   set member_collection.invite='refusal'
   where member_collection.member_id='mem4' and member_collection.collection_id='collectionId51'

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

