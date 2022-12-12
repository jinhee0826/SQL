/*
제약조건 : 데이터를 입력받을 때 실행되는 검사 규칙
> create로 생성해 줄 때 함께 추가alter

NOT NULL : 갑에 빈값이 들어갈 수 없음
UNIQUE : 중복된 값을 사용할 수 없음
PRIMARY KEY : not null과 unique의 특성을 모두 가진 키 - 데이블당 하나 
			데이토를 찾을 때 사용, 업데이트 및 삭제시에 사용
FOREIGE KEY : 다른 데이블과 연결 > join
DEFAULT : 해당 필드의 기본값 설정
*/

/*
영화 정보 테이블
id(primary key), title(not null), detail
*/
create table movieinfo(
	Id int primary key,
    title varchar(100) not null,
    detail text
);
insert into movieinfo value (1,"공조","영화입니다");
select * from movieinfo;
insert into movieinfo value (2,"반지의 제왕","새로운 영화입니다");

/*
movieactor 영화배우 테이블
id(primary key), name(not null), movie
*/
create table movieactor(
	Id int primary key,
    Name varchar(30) not null,
    move text
    /* 선생님은 name varchr(20), movie varchar(100)으로 함 */
);
insert into movieactor value(1,"현빈","공조");
insert into movieactor(Id, Name) value(3,"홍길동");
select * from movieactor;

/* 제약조건을 alter를 이용해서 기존의 필드에 추가하기*/
alter table movieactor alter movie set default "없음";

/* 제약조건을 alter를 이용해서 새로운 필드에 추가하기 */
alter table movieactor add regist timestamp default current_timestamp;
insert into movieactor(id, name, movie) value(4,"성춘향","춘향전");

/* movietate 테이블의 time 필드에 alter를 이용하여 
	default 제약조건을 추가하세요 - 0*/
alter table movierate alter rate set default 0;
select * from movierate;
insert into movierate(id, Title) value(3,"해리포터");