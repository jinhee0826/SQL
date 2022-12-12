create database Blog;
use Blog;
create table post(
	ID int,
    Name varchar(30),
    Title varchar(30),
    Content text
);

insert into post (ID, Name, Title, Content) values(1, "홍길동", "첫번째 포스트", "글을 작성합니다"); 
insert into post (ID, Name, Title, Content) values(2, "홍길동", "두번째 포스트", "새로운 글을 작성합니다");
insert into post (ID, Name, Title, Content) values(3, "성춘향", "첫번째 제목", "내용1");
select * from post;

update post set Title = "수정된 제목입니다" where ID =2;
delete from post where ID = 1;
select * from post;

select * from post;
select ID from post;
select * from post where ID = 3;



 