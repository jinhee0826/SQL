/* select 절을 사용한 데이터베이스의 데이터 확인 */
/*
1. select * from 테이블;
2. select 출력할 필드 from 테이블;
3. select * from 테이블 where 조건;
4. select * from 테이블 where 조건중 패턴매칭(like)
*/
/* 그 외의 select에 사용할 수 있는 키워드 
1. distinct : 필드 앞에 작성해서 중복되는 값 제거
2. oder by : 원하는 칼럼의 글자, 숫자 순으로 나열 
*/
use sakila;
select * from customer;
select distinct store_id from customer;
select * from city;
/* sakila 데이터베이스의 city 테이블에서 country_id의 종류를 확인하세요 */
select distinct country_id from city; /* distinct를 안지우면 중복으로 힘듦 */

/*oder by를 통한 정렬 : asc(기본) 오름차순으로 정렬 / desc 내림차순정렬 */
select * from customer order by first_name desc;
select * from customer order by store_id desc, first_name;

/* active를 오름차순으로 정렬한 후 create_date 내림차순으로 정렬하세요*/ 
select * from customer order by active asc, create_date desc;
/* last_name을 오름차순으로 정렬한 후 first_name을 오름차순으로 정렬하세요*/
select * from customer order by last_name, first_name;
/* limit를 이용해서 원하는 범위만 출력할 수 있다
limit 시작위치(0) 출력개수(3) */
select * from customer limit 0,3;

/* create_date를 오름차순으로 정렬하고 first_name을 오름차순으로 정렬한 후 가장위에 있는 10개만 출력 */
select * from customer order by create_date, first_name limit 0,10;
/* where를 통해서 store_id값이 1인 내용만 출력 */
select * from customer where store_id =1 order by create_date, first_name limit 0,10;

/* customer_id가 100보다 큰 데이터를 last_name으로 내림차순으로 정렬하세요 
+ limit를 통해서 30개만 출력 */
select * from customer where customer_id > 100 order by last_name desc limit 0,30;

/* min(), max() 함수를 활용해서 각 필드에서 가장 큰 값과 작은 값을 가져올 수 있다 */
/* as를 통해서 컬럼이름을 바꿔서 출력할 수 있다 */
select min(customer_id) as min_id from customer;
select max(customer_id) from customer;
select max(create_date) from customer;

select * from film;
select max(length), title from film;
/* film 테이블에서 (length)길이가 작은 영화의 제목을 출력 
film 테이블에서 replacement_cost가 가장 큰 값을 출력
film의 rental_rate가 3인이상인 영화중에 length가 가장 작은것부터 정렬하여 5개를 출력하세요 */
select min(length), title from film;
select * from film where length = 46;
select max(replacement_cost) from film;
select * from film where replacement_cost = 29.99;
select * from film where rental_rate >= 3 order by length limit 0,5;

/* count(): 현재 칼럼의 데이터 개수 - count( distinct 필드) 중복제거 
avg(): 안에 있는 값들의 평균
sum(): 안에 있는 값들의 총합 */
select count(distinct length) from film;
select avg(length) as "평균길이" from film; /* as "" 하면 타이틀에 적힘*/
select sum(length) as "전체길이의 합" from film;

/* count()를 이용하여 rental_duration의 종류가 몇개가 되는지 출력하세요 
   avg()를 이용하여 rental_duration의 평균을 구하세요
   sum()를 이용하여rental_duration의 합계를 구하세요 */
select count(distinct rental_duration) from film;
select avg(rental_duration) from film;
select sum(rental_duration) from film;
