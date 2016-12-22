drop sequence seq_dummy_m;

--더미 데이터에 사용할 sequence 회원
create sequence seq_dummy_m; 
--member테이블 

insert into MEMBER values('test','홍길동',19,'1998-09-25','dlwocks123','test@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');
insert into MEMBER values('test'||seq_dummy_m.nextval,'홍길동'||seq_dummy_m.nextval,19,'1998-09-25','dlwocks'||seq_dummy_m.nextval,'test'||seq_dummy_m.nextval||'@naver.com');

insert into collection values('SALIM','가정을 살리는 우리 SALIM','프로젝트','test');
insert into collection values('SALIM2','살려라 ! 살려라 ! 살았다.!','D-2','test');
insert into collection values('SALIM3','오오오오오오~~~~~오오오~~','D-2','test');
insert into collection values('SALIM4','간다.~ 간다.~ 간다.~~ ','D-2','test');
insert into collection values('SALIM5','으아~~ 내가 으아~~ 으아 ~ 운명이로다.','D-2','test');







