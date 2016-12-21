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


------------------------새로 만든 code테이블 코드 넣기 : 대분류 코드 -------------------------------
insert into bigCategory (big_code, big_content) values (seq_big.nextval, '수입');
insert into bigCategory (big_code, big_content) values (seq_big.nextval, '지출');

--최상위 코드
select big_code from bigCategory where big_content = '수입';
select big_code from bigCategory where big_content = '지출';

--수입의 대분류
insert into bigCategory values (seq_big.nextval, '미분류', (select big_code from bigCategory where big_content = '수입'));
insert into bigCategory values (seq_big.nextval, '주수입', (select big_code from bigCategory where big_content = '수입'));
insert into bigCategory values (seq_big.nextval, '부수입', (select big_code from bigCategory where big_content = '수입'));
insert into bigCategory values (seq_big.nextval, '전월이월', (select big_code from bigCategory where big_content = '수입'));
insert into bigCategory values (seq_big.nextval, '저축/보험', (select big_code from bigCategory where big_content = '수입'));

--지출의 대분류
insert into bigCategory values (seq_big.nextval, '미분류', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '식비', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '주거/통신', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '생활용품', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '의복/미용', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '건강/문화', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '교육/육아', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '교통/차량', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '경조사/회비', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '세금/이자', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '용돈/기타', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '카드대금', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '저축/보험', (select big_code from bigCategory where big_content = '지출'));
insert into bigCategory values (seq_big.nextval, '이체/대체', (select big_code from bigCategory where big_content = '지출'));

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

--수입의 소분류
insert into smallCategory values(seq_sma.nextval, '미분류', (select big_code from bigCategory where big_content = '미분류' and high_code=1));

insert into smallCategory values(seq_sma.nextval, '급여', (select big_code from bigCategory where big_content = '주수입'));
insert into smallCategory values(seq_sma.nextval, '상여', (select big_code from bigCategory where big_content = '주수입'));
insert into smallCategory values(seq_sma.nextval, '사업소득', (select big_code from bigCategory where big_content = '주수입'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '주수입'));

insert into smallCategory values(seq_sma.nextval, '이자/배당금', (select big_code from bigCategory where big_content = '부수입'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '부수입'));

insert into smallCategory values(seq_sma.nextval, '전월이월', (select big_code from bigCategory where big_content = '전월이월'));
insert into smallCategory values(seq_sma.nextval, '시작금액', (select big_code from bigCategory where big_content = '전월이월'));
insert into smallCategory values(seq_sma.nextval, '잔액조정', (select big_code from bigCategory where big_content = '전월이월'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '전월이월'));

insert into smallCategory values(seq_sma.nextval, '예금', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));
insert into smallCategory values(seq_sma.nextval, '적금', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));
insert into smallCategory values(seq_sma.nextval, '펀드', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));
insert into smallCategory values(seq_sma.nextval, '보험', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));
insert into smallCategory values(seq_sma.nextval, '투자', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '저축/보험' and high_code=1));

-- 지출의 소분류
insert into smallCategory values(seq_sma.nextval, '미분류', (select big_code from bigCategory where big_content = '미분류' and high_code=2));

insert into smallCategory values(seq_sma.nextval, '주식', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '부식', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '간식', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '외식', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '커피/음료', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '술/유흥', (select big_code from bigCategory where big_content = '식비'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '식비'));

insert into smallCategory values(seq_sma.nextval, '관리비', (select big_code from bigCategory where big_content = '주거/통신'));
insert into smallCategory values(seq_sma.nextval, '공과금', (select big_code from bigCategory where big_content = '주거/통신'));
insert into smallCategory values(seq_sma.nextval, '이동통신', (select big_code from bigCategory where big_content = '주거/통신'));
insert into smallCategory values(seq_sma.nextval, '인터넷', (select big_code from bigCategory where big_content = '주거/통신'));
insert into smallCategory values(seq_sma.nextval, '월세', (select big_code from bigCategory where big_content = '주거/통신'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '주거/통신'));

insert into smallCategory values(seq_sma.nextval, '가구/가전', (select big_code from bigCategory where big_content = '생활용품'));
insert into smallCategory values(seq_sma.nextval, '주방/욕실', (select big_code from bigCategory where big_content = '생활용품'));
insert into smallCategory values(seq_sma.nextval, '잡화소모', (select big_code from bigCategory where big_content = '생활용품'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '생활용품'));

insert into smallCategory values(seq_sma.nextval, '의류비', (select big_code from bigCategory where big_content = '의복/미용'));
insert into smallCategory values(seq_sma.nextval, '패션잡화', (select big_code from bigCategory where big_content = '의복/미용'));
insert into smallCategory values(seq_sma.nextval, '헤어뷰티', (select big_code from bigCategory where big_content = '의복/미용'));
insert into smallCategory values(seq_sma.nextval, '세탁수선비', (select big_code from bigCategory where big_content = '의복/미용'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '의복/미용'));

insert into smallCategory values(seq_sma.nextval, '운동/레저', (select big_code from bigCategory where big_content = '건강/문화'));
insert into smallCategory values(seq_sma.nextval, '문화생활', (select big_code from bigCategory where big_content = '건강/문화'));
insert into smallCategory values(seq_sma.nextval, '여행', (select big_code from bigCategory where big_content = '건강/문화'));
insert into smallCategory values(seq_sma.nextval, '병원비', (select big_code from bigCategory where big_content = '건강/문화'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '건강/문화'));
insert into smallCategory values(seq_sma.nextval, '보장성보험', (select big_code from bigCategory where big_content = '건강/문화'));

insert into smallCategory values(seq_sma.nextval, '등록금', (select big_code from bigCategory where big_content = '교육/육아'));
insert into smallCategory values(seq_sma.nextval, '학원/교재비', (select big_code from bigCategory where big_content = '교육/육아'));
insert into smallCategory values(seq_sma.nextval, '육아용품', (select big_code from bigCategory where big_content = '교육/육아'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '교육/육아'));

insert into smallCategory values(seq_sma.nextval, '대중교통비', (select big_code from bigCategory where big_content = '교통/차량'));
insert into smallCategory values(seq_sma.nextval, '주유비', (select big_code from bigCategory where big_content = '교통/차량'));
insert into smallCategory values(seq_sma.nextval, '자동차보험', (select big_code from bigCategory where big_content = '교통/차량'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '교통/차량'));

insert into smallCategory values(seq_sma.nextval, '경조사비', (select big_code from bigCategory where big_content = '경조사/회비'));
insert into smallCategory values(seq_sma.nextval, '모임비', (select big_code from bigCategory where big_content = '경조사/회비'));
insert into smallCategory values(seq_sma.nextval, '데이트', (select big_code from bigCategory where big_content = '경조사/회비'));
insert into smallCategory values(seq_sma.nextval, '선물', (select big_code from bigCategory where big_content = '경조사/회비'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '경조사/회비'));

insert into smallCategory values(seq_sma.nextval, '세금', (select big_code from bigCategory where big_content = '세금/이자'));
insert into smallCategory values(seq_sma.nextval, '대출이자', (select big_code from bigCategory where big_content = '세금/이자'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '세금/이자'));

insert into smallCategory values(seq_sma.nextval, '용돈', (select big_code from bigCategory where big_content = '용돈/기타'));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '용돈/기타'));

insert into smallCategory values(seq_sma.nextval, '카드대금', (select big_code from bigCategory where big_content = '카드대금'));

insert into smallCategory values(seq_sma.nextval, '예금', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));
insert into smallCategory values(seq_sma.nextval, '적금', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));
insert into smallCategory values(seq_sma.nextval, '펀드', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));
insert into smallCategory values(seq_sma.nextval, '보험', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));
insert into smallCategory values(seq_sma.nextval, '투자', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));
insert into smallCategory values(seq_sma.nextval, '기타', (select big_code from bigCategory where big_content = '저축/보험' and high_code=2));


--카드/통장 등록하면 뜨게 하기
insert into smallCategory values(seq_sma.nextval, '이체/대체', (select big_code from bigCategory where big_content = '이체/대체'));


---카드/통장 코드-> Code에 넣음. 카테고리 아님.----------------------------------------------------------------------------

insert into code values(seq_cod.nextval, '은행', '신한');
insert into code values(seq_cod.nextval, '은행', '씨티');
insert into code values(seq_cod.nextval, '은행', '농협');
insert into code values(seq_cod.nextval, '은행', '삼성');
insert into code values(seq_cod.nextval, '은행', '현대');
insert into code values(seq_cod.nextval, '은행', 'BC');
insert into code values(seq_cod.nextval, '은행', 'KB국민');
insert into code values(seq_cod.nextval, '은행', 'IBK기업');
insert into code values(seq_cod.nextval, '은행', '우리');
insert into code values(seq_cod.nextval, '은행', 'BNK부산');
insert into code values(seq_cod.nextval, '은행', '우체국');
insert into code values(seq_cod.nextval, '은행', '수협');
insert into code values(seq_cod.nextval, '은행', '기타');

delete CODE 


