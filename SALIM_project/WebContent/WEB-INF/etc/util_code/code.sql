create sequence seq_cod--sequence생성
select seq_cod.nextval from dual  -- 조회 
drop sequence seq_cod--삭제

create table code(--분류&카테고리&수입&지출카테고리
id Number primary key,--기본키
collection varchar2(50) not null,--그룹
code varchar2(300)not null--코드
);
drop table code;

--수입, 지출 코드
insert into CODE values(seq_cod.nextval, '수입', '미분류');
insert into CODE values(seq_cod.nextval, '수입', '주수입');
insert into CODE values(seq_cod.nextval, '수입', '부수입');
insert into CODE values(seq_cod.nextval, '수입', '전월이월');
insert into CODE values(seq_cod.nextval, '수입', '저축/보험');

insert into CODE values(seq_cod.nextval, '지출', '미분류');
insert into CODE values(seq_cod.nextval, '지출', '식비');
insert into CODE values(seq_cod.nextval, '지출', '주거/통신');
insert into CODE values(seq_cod.nextval, '지출', '생활용품');
insert into CODE values(seq_cod.nextval, '지출', '의복/미용');
insert into CODE values(seq_cod.nextval, '지출', '건강/문화');
insert into CODE values(seq_cod.nextval, '지출', '교육/육아');
insert into CODE values(seq_cod.nextval, '지출', '교통/차량');
insert into CODE values(seq_cod.nextval, '지출', '경조사/회비');
insert into CODE values(seq_cod.nextval, '지출', '세금/이자');
insert into CODE values(seq_cod.nextval, '지출', '용돈/기타');
insert into CODE values(seq_cod.nextval, '지출', '카드대금');
insert into CODE values(seq_cod.nextval, '지출', '저축/보험');
insert into CODE values(seq_cod.nextval, '지출', '이체/대체');

insert into CODE values(seq_cod.nextval, '주수입', '급여');
insert into CODE values(seq_cod.nextval, '주수입', '상여');
insert into CODE values(seq_cod.nextval, '주수입', '사업소득');
insert into CODE values(seq_cod.nextval, '주수입', '기타');

insert into CODE values(seq_cod.nextval, '부수입', '이자/배당금');
insert into CODE values(seq_cod.nextval, '부수입', '기타');

insert into CODE values(seq_cod.nextval, '전월이월', '전월이월');
insert into CODE values(seq_cod.nextval, '전월이월', '시작금액');
insert into CODE values(seq_cod.nextval, '전월이월', '잔액조정');
insert into CODE values(seq_cod.nextval, '전월이월', '저축/보험');

insert into CODE values(seq_cod.nextval, '저축/보험', '예금');
insert into CODE values(seq_cod.nextval, '저축/보험', '적금');
insert into CODE values(seq_cod.nextval, '저축/보험', '펀드');
insert into CODE values(seq_cod.nextval, '저축/보험', '보험');
insert into CODE values(seq_cod.nextval, '저축/보험', '투자');
insert into CODE values(seq_cod.nextval, '저축/보험', '기타');

insert into CODE values(seq_cod.nextval, '식비', '주식');
insert into CODE values(seq_cod.nextval, '식비', '부식');
insert into CODE values(seq_cod.nextval, '식비', '간식');
insert into CODE values(seq_cod.nextval, '식비', '외식');
insert into CODE values(seq_cod.nextval, '식비', '커피/음료');
insert into CODE values(seq_cod.nextval, '식비', '술/유흥');
insert into CODE values(seq_cod.nextval, '식비', '기타');

insert into CODE values(seq_cod.nextval, '주거/통신', '관리비');
insert into CODE values(seq_cod.nextval, '주거/통신', '공과금');
insert into CODE values(seq_cod.nextval, '주거/통신', '이동통신');
insert into CODE values(seq_cod.nextval, '주거/통신', '인터넷');
insert into CODE values(seq_cod.nextval, '주거/통신', '월세');
insert into CODE values(seq_cod.nextval, '주거/통신', '기타');

insert into CODE values(seq_cod.nextval, '생활용품', '가구/가전');
insert into CODE values(seq_cod.nextval, '생활용품', '주방/욕실');
insert into CODE values(seq_cod.nextval, '생활용품', '잡화소모');
insert into CODE values(seq_cod.nextval, '생활용품', '기타');

insert into CODE values(seq_cod.nextval, '의복/미용', '의류비');
insert into CODE values(seq_cod.nextval, '의복/미용', '패션잡화');
insert into CODE values(seq_cod.nextval, '의복/미용', '헤어뷰티');
insert into CODE values(seq_cod.nextval, '의복/미용', '세탁수선비');
insert into CODE values(seq_cod.nextval, '의복/미용', '기타');

insert into CODE values(seq_cod.nextval, '건강/문화', '운동/레저');
insert into CODE values(seq_cod.nextval, '건강/문화', '문화생활');
insert into CODE values(seq_cod.nextval, '건강/문화', '여행');
insert into CODE values(seq_cod.nextval, '건강/문화', '병원비');
insert into CODE values(seq_cod.nextval, '건강/문화', '기타');
insert into CODE values(seq_cod.nextval, '건강/문화', '보장성보험');

insert into CODE values(seq_cod.nextval, '교육/육아', '등록금');
insert into CODE values(seq_cod.nextval, '교육/육아', '학원/교재비');
insert into CODE values(seq_cod.nextval, '교육/육아', '육아용품');
insert into CODE values(seq_cod.nextval, '교육/육아', '기타');

insert into CODE values(seq_cod.nextval, '교통/차량', '대중교통비');
insert into CODE values(seq_cod.nextval, '교통/차량', '주유비');
insert into CODE values(seq_cod.nextval, '교통/차량', '자동차보험');
insert into CODE values(seq_cod.nextval, '교통/차량', '기타');

insert into CODE values(seq_cod.nextval, '경조사비/회비', '경조사비');
insert into CODE values(seq_cod.nextval, '경조사비/회비', '모임비');
insert into CODE values(seq_cod.nextval, '경조사비/회비', '데이트');
insert into CODE values(seq_cod.nextval, '경조사비/회비', '선물');
insert into CODE values(seq_cod.nextval, '경조사비/회비', '기타');

insert into CODE values(seq_cod.nextval, '세금/이자', '세금');
insert into CODE values(seq_cod.nextval, '세금/이자', '대출이자');
insert into CODE values(seq_cod.nextval, '세금/이자', '기타');

insert into CODE values(seq_cod.nextval, '용돈/기타', '용돈');
insert into CODE values(seq_cod.nextval, '용돈/기타', '기타');

insert into CODE values(seq_cod.nextval, '카드대금', '카드대금');

insert into CODE values(seq_cod.nextval, '저출/보험', '예금');
insert into CODE values(seq_cod.nextval, '저출/보험', '적금');
insert into CODE values(seq_cod.nextval, '저출/보험', '펀드');
insert into CODE values(seq_cod.nextval, '저출/보험', '보험');
insert into CODE values(seq_cod.nextval, '저출/보험', '투자');
insert into CODE values(seq_cod.nextval, '저출/보험', '기타');

--카드/통장 등록하면 뜨게 하기

select * from CODE;

