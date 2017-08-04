create sequence seq_count start with 10000
increment by 1 nocache;

create table countdb (
num number(10)
);

insert into countdb values (seq_count.nextval);

create table member(
num number(7) primary key,
name varchar2(20),
id varchar2(20),
pass varchar2(20),
hp varchar2(20),
address varchar2(200),
email varchar2(30),
gaipday date
);

insert into member values(seqjsp.nextval, '송혜교','songsong','1234','010-111-2222','서울시 강남구 삼성동 xxx','song@naver.com',sysdate);


SELECT * FROM MYPERSON ORDER BY NUM DESC LIMIT 3,3  => MYSQL 버전
