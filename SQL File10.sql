/* 제약 조건이 들어간 테이블 만들기 */
create database MyDatabase;
use MyDatabase;
/* ID-PK, name/PassWord-null 값이 들어갈 수 없게 */
create table User(
	ID int primary key,
    Name varchar(50) not null,
    PassWord varchar(50) not null
);

/* 실제 비밀번호는 이렇게 바로 저장하지 않습니다. 연습하기위해 임의로 넣은 값입니다 */
insert into User values(1,"홍길동","1234");
insert into User values(2,"성춘향","5678");
insert into User values(3,"이몽룡","abcd");
insert into User values(4,"흥부","aaaa");
insert into User values(5,"놀부","qwer");
select * from User;

/*
ID-PK, Title- 디폴트값: "비어있는 제목",
UserID-FK(User테이블의 ID) & 수정 삭제 조건 - 함께 수정 및 삭제
*/

create table Board(
	ID int primary key,
    UserID int,
    Title varchar(50) default "비어있는 제목",
    text text,
    foreign key(UserID)
    references User(ID) on update cascade on delete cascade
);

insert into Board values (1,1,"홍길동이 쓴 글", "처음으로 글을 남깁니다");
insert into Board values (2,1,"두번째로 쓴 글", "반갑습니다");
insert into Board values (3,2,"성춘향이 쓴 글", "글을 작성합니다");
insert into Board values (4,1,"세번째로 쓴 글", "내용을 입력합니다");
insert into Board(ID, UserID, text) values (5,5,"빈 내용입니다");
select * from Board;

/* 두 개의 테이블을 inner Join으로 출력하기 */
select * from User inner join Board on User.ID = Board.UserID;

/* 두 개의 테이블중 User 테이블이 전부 출력될수 있도록 join 하기 */
select * from User left join Board on User.ID = Board.UserID;