create sequence seq_cod--sequence생성
select seq_cod.nextval from dual  -- 조회 
drop sequence seq_cod--삭제

create table code(--분류&카테고리&수입&지출카테고리
id Number primary key,--기본키
collection varchar2(50) not null,--그룹
code varchar2(300)not null--코드
);
drop table code;