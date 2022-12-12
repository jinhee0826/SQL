/* database Book을 만들고, table Coding 만드세요
컬럼의 필드 값 : ID(int), Title(varchar), Author(varchar), Page(int) 
insert into Coding (ID, Title, Author, page) values (1, "SQL", "green", 300);
*/
create database Book;
use Book;
create table Coding(
	ID int,
    Title varchar(30),
    Author varchar(30),
    page int
);
/* SQL은 데이터가 기록이 되기때문에 수정해도 바로 바뀌지않고 alter-drop하고, alter-add으로 추가해야함 */

insert into Coding (ID, Title, Author, page) values (1, "SQL", "green", 300);
insert into Coding (ID, Title, Author, page) value (2,"JS","홍길동",350);
select * from Coding; 

/* insert를 이용해서 원하는 칼럼의 필드값에만 값을 넣어줄 수 있다
그럴 경우 값을 넣지 않는 필드는 null 값을 갖는다 
 **필드 이름이 없다면 오류뜨고 안들어가짐 */
insert into Coding (ID, Title, page) value (3,"자바",350);

/* **같은 이름으로해도 기록이라 바로 들어가지 않고 밑에 추가 됨
update를 통해 데이터의 필드값을 바꿔줄 수 있다
where을 통해서 원하는 데이터 상태를 설정해서 찾아줄 수 있다 */
update Coding set Author = "성춘향" where Title = "자바"; 
/* update를 사용할 때 where를 사용하지 않고 실행하면 모든 데이터의 필드값이 바뀜*/
update Coding set page = 600;

/* delete를 이용해서 데이터를 삭제, 이 때 where를 사용하여 원하는 데이터 선택*/
delete from Coding where ID = 3;
/* delete를 사용할 때 where를 사용하지 않고 실행하면 모든 데이터가 삭제*/
delete from Coding;

/* 위에 작성한 insert를 통해서 값을 넣어준 후, id가 1인 page를 100으로 업데이트하고 Author가 홍길동인 데이터를 삭제하세요. */
update Coding set page = 100 where ID = 1; 
delete from Coding where Author = "홍길동";
select * from Coding; 