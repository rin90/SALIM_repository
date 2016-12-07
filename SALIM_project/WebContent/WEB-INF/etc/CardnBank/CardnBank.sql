----------------------------------------------------------------------------------------------------- 11.30 타이허
create table card(
	member_id varchar2(50),
	card_id Number primary key,
	card_Type varchar2(50) not null,
	card_description varchar2(100) not null
);

drop table card;

create sequence card_id
select card_id.nextval from dual
drop sequence card_id

create table bank(
	member_id varchar2(50), 
	bank_id Number primary key,
	bank_Type varchar2(50) not null,
	bank_description varchar2(100) not null
);

drop table bank;

create sequence bank_id
select bank_id.nextval from dual --조회
drop sequence bank_id