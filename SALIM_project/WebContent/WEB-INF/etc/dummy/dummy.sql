
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


--code테이블 카테고리
insert into CODE values(seq_cod.nextval,'카테고리','자유게시판');
insert into code values(seq_cod.nextval,'카테고리','Tip게시판');






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
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,0'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into FREE_BOARD values(100+seq_dummy.nextval,'더미','으아아아아아','c:/go/home/my/home/go/go',0,0,'자유게시판','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);


--tip게시판
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
insert into TIP_BOARD values(100+seq_dummy.nextval,'더미','으아아아아','c:/go/home/my/home/go/go','Tip게시판',0,0,'생활','2016-01,'||seq_dummy.nextval,'id-'||seq_dummy.nextval);
