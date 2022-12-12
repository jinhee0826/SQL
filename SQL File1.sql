/* 주석 */
/* 
SQL의 명령어는 Query(쿼리)라고 부르며 ctrl+Enter를 통해 한줄로 실행
여어줄을 동시에 실행할 수 있지만 쿼리를 실행하면 데이터베이스에 즉시 반영되므로 
이전에 작성한 명령어가 제대로 작동되지 않을 수 있다 (특히 create)
 */
 
/* 
create database를 통해 데이터 베이스를 작성할 수 있다
create database는 동일한 이름을 가질 수 없다!(한번만 실행가능) 
*/
create database test;

/* 데이터베이스의 테이블을 사용하기 전에, 데이터 베이스로 이동*/
USE test;

/* 
데이터베이스의 테이블을 사용할 때도 동일하게 create사용
테이블을 작성해 줄 때는, 안에 들어갈 자료형을 고정시킨다.
*/
create table people ( 
	ID int,
    Name varchar(10)
 );
 /* insert를 사용해서 데이터를 넣을 수 있다*/
insert into people (ID, Name) value (1,"홍길동");

/* select (필드) from (테이블)
필드에 별표(*) 기호를 넣으면 테이블의 모든 필드값을 확인*/
select * from people; 

/*insert 이용해서 people에 사람 2명을 더 추가하고 select로 확인*/
insert into people (ID, Name) value (2,"성춘향");
insert into people (ID, Name) value (3,"이몽룡");
/*  select  * from people; 이거 새로 안 적고 위에꺼에 컨트롤+엔터눌러도 됨*/

/* alter table 테이블이름 add 필드이름 필드타입 => 새 필드 추가 */
alter table people ADD age int;
alter table people ADD Phone int;
/* alter table 테이블 이름 drop 필드이름 => 필드 지우기 */
alter table people drop Phone;
/* alter는 테이블을 수정할 수 있지만 데이터를 지우거나 null이 들어가기 때문에 자주 사용하지 않는다*/

/* drop을 이용해서 데이터베이스와 테이블을 삭제 */

drop table people;
drop database test; 

/* 
drop은 create를 쓰기 전에 중복되는 데이터베이스가 있다면 삭제하기 위해서 사용
아래 세 줄을 묶음으로 많이 사용한다.
drop database test;
create database test;
use test; 
*/