
	


--더미 데이터에 사용할 sequence 회원
create sequence seq_dummy_m; 
drop sequence seq_dummy_m;
--member테이블 

insert into MEMBER values('test','홍길동',19,'1998-09-25','홍','test@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','홍'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');


--더미 데이터에 사용할 sequence 자유게시판
create sequence seq_dummy_f; 
drop sequence seq_dummy_f;

--자유게시판
insert into FREE_BOARD values(seq_dummy_f.nextval,'더미','으아아아아아','images719TZLL3.jpg',0,'2016-01,0'||seq_dummy_f.nextval,'id-'||seq_dummy.nextval);



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







		
		
		
		
		
		
		
	
		



