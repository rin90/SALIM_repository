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



--회원 조회
select * from member;
--alter table member1 add(b)


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




--초대하면서 이 부분을 처리해야 한다!!
create table member_collection(--회원그룹
member_id varchar2(50) constraint mco_col_fk references member ON DELETE CASCADE,
collection_id varchar2(50) constraint mco_mem_fk references collection,
invite varchar2(50) not null, --초대여부
constraint mc_pk primary key(member_id,collection_id) 
);

select * from member;
select * from MEMBER_COLLECTION;
drop table member_collection;



drop sequence seq_dummy_m;

--더미 데이터에 사용할 sequence 회원
create sequence seq_dummy_m; 
--member테이블 

insert into MEMBER values('test','홍길동',19,'1998-09-25','dlwocks123','test@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');

insert into collection values('SALIM','가정을 살리는 우리 SALIM','프로젝트','test');
insert into collection values('SALIM2','살려라 ! 살려라 ! 살았다.!','D-2','test');
insert into collection values('SALIM3','오오오오오오~~~~~오오오~~','D-2','test');
insert into collection values('SALIM4','간다.~ 간다.~ 간다.~~ ','D-2','test');
insert into collection values('SALIM5','으아~~ 내가 으아~~ 으아 ~ 운명이로다.','D-2','test');




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

--memberNCollection의 row 삭제

delete from MEMBER_COLLECTION
where COLLECTION_id='collectionId60' and MEMBER_id='mem1' 

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

	
select Member.member_Id memberId, MEMBER.name, Member.email, Member.birthday
	from Member,(
	select mc.member_id memberId3, mc.collection_Id collectionId, mc.invite
	from member_collection mc, (
		select collection.collection_id collectionId2
		from collection
		where collection.collection_id='collectionId2'
		)
	where mc.collection_id=collectionId2 and mc.invite='true'
	)
where Member.member_Id=memberId3	
	
	
	
select * from Member
	
	
	
	
	
	
	
	
	
	
	
	

