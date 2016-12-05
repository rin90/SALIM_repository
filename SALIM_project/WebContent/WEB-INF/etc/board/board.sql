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
 category varchar2(20) not null,--카테고리
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
