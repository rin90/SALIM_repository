create sequence seq_cod--sequence생성
select seq_cod.nextval from dual  -- 조회 
drop sequence seq_cod--삭제


create table code(--분류&카테고리&수입&지출카테고리
id Number primary key,--기본키
collection varchar2(50) not null,--그룹
code varchar2(60)not null--코드
);
drop table code;
select * from code;

------------------------새로 만든 code테이블 : 대분류 코드 테이블-------------------------------------------

--대분류 코드 시퀀스
create sequence seq_big; -- 대분류 코드 시퀀스 생성
select seq_big.nextval from dual; --대분류 코드 다음에 들어갈 값 조회
drop sequence seq_big; -- 대분류코드 시퀀스 삭제

--대분류 테이블 생성
create table bigCategory(
	big_code number primary key,
	big_content varchar2(30) not null,
	high_code number 
);
drop table bigCategory
select * from bigCategory;
drop table bigCategory cascade constraint;



--최상위 코드
select big_code from bigCategory where big_content = '수입';
select big_code from bigCategory where big_content = '지출';


select * from bigCategory;


------------------------새로 만든 code테이블 : 소분류 코드 테이블-------------------------------------------

--소분류 코드 시퀀스
create sequence seq_sma;
select seq_sma.nextval from dual;
drop sequence seq_sma;

--소분류 테이블 생성
create table smallCategory(
	small_code number primary key,
	small_content varchar2(30) not null,
	big_code number constraint sma_big_fk references bigCategory not null
);
select * from smallCategory;
drop table smallCategory;


------------------------새로 만든 code테이블 코드 넣기 : 소분류 코드 -------------------------------

select big_code from bigCategory where big_content = '미분류' and high_code=1;
select big_code from bigCategory where big_content = '주수입';
select big_code from bigCategory where big_content = '부수입';
select big_code from bigCategory where big_content = '전월이월';
select big_code from bigCategory where big_content = '저축/보험' and high_code=1;

select big_code from bigCategory where big_content = '미분류' and high_code=2;
select big_code from bigCategory where big_content = '식비';
select big_code from bigCategory where big_content = '주거/통신';
select big_code from bigCategory where big_content = '생활용품';
select big_code from bigCategory where big_content = '의복/미용';
select big_code from bigCategory where big_content = '건강/문화';
select big_code from bigCategory where big_content = '교육/육아';
select big_code from bigCategory where big_content = '교통/차량';
select big_code from bigCategory where big_content = '경조사/회비';
select big_code from bigCategory where big_content = '세금/이자';
select big_code from bigCategory where big_content = '용돈/기타';
select big_code from bigCategory where big_content = '카드대금';
select big_code from bigCategory where big_content = '저축/보험' and high_code=2;
select big_code from bigCategory where big_content = '이체/대체';


--대분류가 미분류인 경우로... 소분류도 미분류로 넣음./ 만약 대분류 선택 후 소분류를 선택하지 않으면 기타로 처리.

delete CODE 


