create sequence seq_nts  --sequence생성
select seq_nts.nextval from dual  -- 조회 
drop sequence seq_nts--삭제

create table notes(  --메모
	no number primary key,
	day_date date not null,   --날짜
	content varchar2(500) not null,
	member_id varchar2(50) constraint nts_mem_fk references member not null
);

drop table notes;

		
		


create sequence seq_exp--sequence생성
select seq_exp.nextval from dual  -- 조회 
drop sequence seq_exp--삭제

create table expense(  --지출
expense_id number primary key,
member_id Varchar2(50) constraint exp_mem_fk references member not null,
code_id Number not null,  --코드 id
expense_date Date not null,  --지출일
expense_explain Varchar2(300),  --사용내역
cash_expense Number,  --현금지출액
card_expense Number,  -- 카드지출액
card_type Varchar2(20)  --카드종류
);

drop table expense;



create sequence seq_inc--sequence생성
select seq_inc.nextval from dual  -- 조회 
drop sequence seq_inc--삭제

create table income(  --수입
income_id Number primary key,
member_id varchar2(50) constraint inc_mem_fk references member not null,
code_id Number not null,  --코드 id
income_date date not null, --수입일
explanation Varchar2(20) not null,  --수입내역
income_money Number not null --수입금액
);

drop table income;






create sequence seq_bud--sequence생성
select seq_bud.nextval from dual  -- 조회 
drop sequence seq_bud--삭제

create table budget( --예산
num number primary key, -- 예산번호
member_id varchar2(50) constraint bud_mem_fk references member not null, 
budget_date date not null, --예산일
budget number not null,  --예산금액
food_expenses number not null,   --식비
dwelling_communication number not null,   --주거/통신
householdgoods number not null,  --생활용품
cloth_beauty number not null,  -- 의복/미용
health_culture number not null,  --건강/ 문화
education_parenting number not null,  --교육/육아
traffic_vehicle number not null, -- 교통 /차량
holiday_dues number not null,  --경조사/회비
tax_interest number not null,  --세금/이자
pinmoney_etc number not null,  --용돈/기타
saving_insurance number not null, --저축/보험
credit_card number not null,  --카드대금
unclassified number not null --미분류
);

drop table budget;





create sequence seq_sch--sequence생성
select seq_sch.nextval from dual  -- 조회 
drop sequence seq_sch--삭제

create table schedule( --일정
no Number primary key, 
member_id varchar2(50) constraint sch_mem_fk references member not null,
schedule varchar2(50) not null,  --일정제목
schedule_date Date not null,  --날짜
cotent Varchar2(300) not null  --상세내용
);

drop table schedule;





create sequence seq_goa--sequence생성
select seq_goa.nextval from dual  -- 조회 
drop sequence seq_goa--삭제

create table goals(--목표
target number primary key,--목표번호
y_m Date not null,--목표달
gool varchar2(1000) not null,--내용
member_id varchar2(50) constraint goa_mem_fk references member not null--회원id
);

drop table goals;






create sequence seq_free  --sequence생성
select seq_free.nextval from dual  -- 조회 
drop sequence seq_free  --삭제

create table free_board( --자유게시판
 no number primary key,
 title varchar2(300) not null,
 content varchar2(4000) not null,
 file_root varchar2(4000),  --파일 경로
 click	number not null,  --조회수
 good number not null,  --좋아요
 category varchar2(20) not null,
 register_time date not null, --작성일
 member_id varchar2(50) constraint fre_mem_fk references member not null--inline방식
);


drop table free_board;



create sequence seq_tip--sequence생성
select seq_tip.nextval from dual  -- 조회 
drop sequence seq_tip--삭제

create table tip_board(  --tip게시판
	no number primary key,
	title varchar2(3000) not null,
	content varchar2(4000) not null,
	file_root varchar2(4000),  -- 파일 경로
	category varchar2(50) not null, -- 카테고리
	click number not null,   -- 조회수 
	good number not null,   -- 좋아요
	classification varchar2(20) not null, --분류
	register_time date not null, -- 작성일
	member_id varchar2(50) constraint tip_mem_fk references member not null--inline방식
);

drop table tip_board;




create sequence seq_com--sequence생성
select seq_com.nextval from dual  -- 조회 
drop sequence seq_com--삭제

create table comments(  --댓글
	id number primary key,
	content varchar2(400) not null,
	register_time date not null,
	font_no number not null,  -- 어떤 글인지 번호
	category varchar2(10) not null,    
	member_id varchar2(50) constraint com_mem_fk references member not null
);

drop table comments;




create sequence seq_qaa--sequence생성
select seq_qaa.nextval from dual  -- 조회 
drop sequence seq_qaa  --삭제

create table question_and_answer(  -- Q&A 게시판
	id number primary key,
	category varchar2(50) not null, -- 주제  ( 예, 로그인,홈페이지 ,게시판 등등
	content varchar2(4000) not null,
	title varchar2(300) not null,
	member_id varchar2(50) constraint qaa_mem_fk references member not null
);

drop table question_and_answer;

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
member_id varchar2(50) constraint mco_col_fk references collection,
collection_id number constraint mco_mem_fk references member,
grant_id varchar2(300) not null,--권한자id
constraint mc_pk primary key(member_id,collection_id)
);


drop table member_collection;



create sequence seq_cod--sequence생성
select seq_cod.nextval from dual  -- 조회 
drop sequence seq_cod--삭제

create table code(--분류&카테고리&수입&지출카테고리
id Number primary key,--기본키
collection varchar2(50) not null,--그룹
code varchar2(300)not null--코드
);
drop table code;





