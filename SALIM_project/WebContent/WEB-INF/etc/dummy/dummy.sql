
--code테이블  Tip게시판 분류 insert
insert into code values(seq_cod.nextval,'분류','지출');
insert into code values(seq_cod.nextval,'분류','수입');
insert into code values(seq_cod.nextval,'분류','저축');
insert into code values(seq_cod.nextval,'분류','보험');
insert into code values(seq_cod.nextval,'분류','생활');


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







select id,content,member_id memberId,font_group fontGroup,group_level groupLevel, register_time registerTime
		from free_comments
		order by id
	
	

	,c.id,c.content,c.memberId,c.no,c.commentGroup,c.groupLevel,c.registerTime
		
		select distinct(f.no),f.title,f.member_id memberId,f.register_time registerTime,f.click,f.good,f.content,f.file_root fileName
		
		from free_board f,(
					select id,no,content,member_id memberId,comment_group commentGroup,group_level groupLevel,register_time registerTime
					from free_comments
					where no=4 --해당 글에 대한 댓글 모두 가져오기-->
					order by commentGroup,id --가져온 글에 그룹번호로 정렬그룹번호는 입력될때마다 증가한다. 그래서 즉 위에(먼저)입력한사람의 그룹 번호가 더 낮다.-->
				) c
		where f.no=4
		and f.no=c.no(+) 
		
		
		
		
		
		
		
		
		
		
	
		
		
select f.title,f.member_id memberId,f.register_time registerTime,f.click,f.good,f.content,f.file_root fileName
from free_board f
where f.no=4

select id,no,content,member_id memberId,comment_group commentGroup,group_level groupLevel,register_time registerTime
					from free_comments
					where no=9




