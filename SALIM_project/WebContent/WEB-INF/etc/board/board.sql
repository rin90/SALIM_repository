create sequence seq_free  --sequence생성
select seq_free.nextval from dual  -- 조회 
drop sequence seq_free  --삭제

create table free_board( --자유게시판
 no number primary key,
 title varchar2(300) not null,
 content varchar2(4000) not null,
 file_root varchar2(3000),  --파일 이름
 click	number not null,  --조회수
 register_time date not null, --작성일
 member_id varchar2(50) constraint fre_mem_fk references member ON DELETE CASCADE not null--inline방식
);
select * from free_board;

drop table free_board;


DROP TABLE free_board CASCADE CONSTRAINT

create sequence seq_tip--sequence생성
select seq_tip.nextval from dual  -- 조회 
drop sequence seq_tip--삭제

create table tip_board(  --tip게시판
	no number primary key,
	title varchar2(300) not null,
	content varchar2(4000) not null,
	file_root varchar2(4000),  -- 파일 경로
	click number not null,   -- 조회수 
	classification varchar2(20) not null, --분류
	register_time date not null, -- 작성일
	member_id varchar2(50) constraint tip_mem_fk references member ON DELETE CASCADE not null--inline방식
);

select * from tip_board;
drop table tip_board;




create sequence seq_com--sequence생성 id용
select seq_com.nextval from dual  -- 조회 
drop sequence seq_com--삭제

--보류
create sequence seq_cog--sequence생성 commentGroup용
select seq_cog.nextval from dual  -- 조회 
drop sequence seq_cog--삭제

create table free_comments(  --댓글
	id number primary key,
	comment_content varchar2(400) not null,
	comment_member_id varchar2(50) constraint fco_mem_fk references member ON DELETE CASCADE not null,
	no number constraint fco_fre_fk references FREE_BOARD ON DELETE CASCADE not null,  -- 어떤 글인지 번호
	comment_group number not null,
	group_level number not null,
	comment_register_time date not null
);


drop table free_comments;


create sequence seq_com_t--sequence생성 id용
select seq_com_t.nextval from dual  -- 조회 
drop sequence seq_com_t--삭제

--보류
create sequence seq_cog_t--sequence생성 commentGroup용
select seq_cog_t.nextval from dual  -- 조회 
drop sequence seq_cog_t--삭제

create table tip_comments(  --댓글
	id number primary key,
	comment_content varchar2(400) not null,
	comment_member_id varchar2(50) constraint tco_mem_fk references member ON DELETE CASCADE not null,
	no number constraint tco_tre_fk references TIP_BOARD ON DELETE CASCADE not null,  -- 어떤 글인지 번호
	comment_group number not null,
	group_level number not null,
	comment_register_time date not null
);

drop table tip_comments;














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

--나중에 시간남으면 하기 좋아요 영구 저장테이블
create sequence seq_odt
select seq_odt.nextval from dual
drop sequence seq_odt

create table good_t(
	id number primary key,
	no number not null,
	good_whether number not null,
	member_id varchar2(50) constant goo_mem_fk references member not null
);
drop table good_t



