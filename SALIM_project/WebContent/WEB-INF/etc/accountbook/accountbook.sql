create sequence seq_nts  --sequence생성
select seq_nts.nextval from dual  -- 조회 
drop sequence seq_nts--삭제

create table notes(  --메모
	no number primary key,
	day_date date not null,   --날짜
	content varchar2(3000) not null,--메모 1000자까지 쓸수 있게
	member_id varchar2(50) 
);
--member와 join 취소 : constraint nts_mem_fk references member not null

drop table notes;

select * from notes;
--member와 join취소
alter table notes drop constraint nts_mem_fk;


create sequence seq_exp--sequence생성
select seq_exp.nextval from dual  -- 조회 
drop sequence seq_exp--삭제

create table expense(  --지출
expense_id number primary key,
member_id Varchar2(50) not null,
code_id Number not null,  --코드 id
expense_date Date not null,  --지출일
expense_explain Varchar2(60),  --사용내역
cash_expense Number,  --현금지출액
card_expense Number,  -- 카드지출액
card_type Varchar2(20)  --카드종류
);

select * from expense;

drop table expense;



create sequence seq_inc--sequence생성
select seq_inc.nextval from dual  -- 조회 
drop sequence seq_inc--삭제

create table income(  --수입
income_id Number primary key,
member_id varchar2(50) not null,
code_id Number not null,  --코드 id
income_date date not null, --수입일
explanation Varchar2(60) not null,  --수입내역, 20자까지 쓸수있게
income_money Number not null --수입금액
);

select * from income;

drop table income;






create sequence seq_bud--sequence생성
select seq_bud.nextval from dual  -- 조회 
drop sequence seq_bud--삭제

create table budget( --예산
num number primary key, -- 예산번호
member_id varchar2(50), --예산이 귀속되는 회원id나 그룹id
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

select * from BUDGET;
--member와 join취소
alter table budget drop constraint bud_mem_fk;
--constraint bud_mem_fk references member not null






