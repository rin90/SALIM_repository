----------------------------------------------------------------------------------------------------- 11.30 타이허
create table card(
	member_id varchar2(50),
	card_id Number primary key,
	card_Type varchar2(50) not null,
	card_description varchar2(100) not null --33자까지 입력
);



drop table card;

create sequence seq_card_id
select seq_card_id.nextval from dual
drop sequence seq_card_id

create table bank(
	member_id varchar2(50), 
	bank_id Number primary key,
	bank_Type varchar2(50) not null,
	bank_description varchar2(100) not null
);

drop table bank;

create sequence seq_bank_id
select seq_bank_id.nextval from dual --조회
drop sequence seq_bank_id


select * from (select * from CARD where member_id=1 order by card_id desc) where rownum =1