
--code테이블  Tip게시판 분류 insert
insert into code values(seq_cod.nextval,'free','지출');
insert into code values(seq_cod.nextval,'free','수입');
insert into code values(seq_cod.nextval,'free','저축');
insert into code values(seq_cod.nextval,'free','보험');
insert into code values(seq_cod.nextval,'free','생활');


--code테이블 Q&A게시판 분류 insert
insert into code values(seq_cod.nextval,'Q&A','로그인');
insert into code values(seq_cod.nextval,'Q&A','홈페이지');
insert into code values(seq_cod.nextval,'Q&A','수입');
insert into code values(seq_cod.nextval,'Q&A','지출');
insert into code values(seq_cod.nextval,'Q&A','회원탈퇴');
insert into code values(seq_cod.nextval,'Q&A','ID/PW');
insert into code values(seq_cod.nextval,'Q&A','그룹게시판');

select CODE from code where collection='조회'

--code테이블 카테고리
insert into CODE values(seq_cod.nextval,'카테고리','자유게시판');
insert into code values(seq_cod.nextval,'카테고리','Tip게시판');

--code테이블 자유게시판의 조회 코드
insert into code values(seq_cod.nextval,'조회','제목');
insert into code values(seq_cod.nextval,'조회','작성자');

	

create sequence seq_dummy; 
drop sequence seq_dummy;

--member테이블 

insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');
insert into MEMBER values('id-'||seq_dummy.nextval,'이재찬'||seq_dummy.nextval,19,'1998-09-25','q123456');



--자유게시판
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);


--tip게시판
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);



--댓글 더미데이터
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',1,1,0,'2016-01,01');
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',2,1,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',2,2,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',2,3,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',2,4,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',3,1,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',3,2,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',3,3,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',3,4,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',3,5,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,1,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,2,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,3,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,4,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,5,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,6,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,7,0,'2016-01,'||seq_dummy.nextval);
insert into FREE_COMMENTS values(600+seq_dummy.nextval,'dd','id-3',4,7,1,'2016-01-1');
insert into FREE_COMMENTS values(700+seq_dummy.nextval,'dd','id-3',5,1,0,'2016-01-'||seq_dummy.nextval);
insert into FREE_COMMENTS values(700+seq_dummy.nextval,'dd','id-3',5,1,1,'2016-01-'||seq_dummy.nextval);
insert into FREE_COMMENTS values(700+seq_dummy.nextval,'dd','id-3',5,1,2,'2016-01-'||seq_dummy.nextval);
insert into FREE_COMMENTS values(700+seq_dummy.nextval,'dd','id-3',5,1,3,'2016-01-'||seq_dummy.nextval);





select no, title,member_id memberId,register_time registerTime,click,good,file_root fileName 
		from(
				select ceil(rownum/3) page,no, title,member_id,register_time,click,good,file_root 
				from (
					select no,title,member_id,register_time,click,good,file_root
					from free_board
					order by no desc
				)
		)
		where page=1


select id,content,member_id memberId,font_group fontGroup,group_level groupLevel, register_time registerTime
		from free_comments
		order by id
		
		
				














