/* 외래키와 join - test 데이터베이스에서 진행 */
/* post table과 comment table 작성 후 원하는 데이터만 출력해서 보기 */
create table post(
	postID int primary key,
    title varchar(100),
    text text
);
create table comment (
	commentID int primary key,
    postID int,
    text text,
    foreign key (postID) references post(postID) on update cascade on delete no action
    /* 업뎃은 같이 되지만 postID삭제는 안됨 */
);

/* post에 대한 데이터 입력 */
insert into post values (1, "첫번째 게시글 입니다","내용을 작성합니다");
insert into post values (2, "두번째", "새로운 내용을 작성합니다");
insert into post values (3, "세번째","게시글 내용을 작성합니다");
insert into post values (4, "네번째","빈 내용입니다");
select * from post;

/* comment 데이터 추가 */
insert into comment value (1,1,"첫번째게시글에 첫번째 댓글");
insert into comment value (2,1,"첫번째 게시글에 두번째 댓글");
insert into comment value (3,3,"세번째 게시글 첫번째 댓글");
select * from comment;

/* inner join을 통해서 내용 가져오기 */
/* 테이블을 함께 가져올 때, 필드의 이름도 테이블과 함께 작성해서 들고온다 */
select post.postID, post.title, post.text, comment.text from post inner join comment 
	on post.postID = comment.postID;

/* comment에 postID값 4를 추가하고 결과를 확인하세요 */
insert into comment value (4, 4, "댓글추가");

/* inner join을 사용하면 한쪽테이블에 값이 없을 경우 양쪽 다 출력되지 않는다
한쪽테이블을 전부 출력하고 싶을때 outter 사용할 수 있다 (left/right) 
left join 왼쪽에 작성한(먼저 작성한) 테이블이 전부 출력되는 join */
select * from post left join comment 
	on post.postID = comment.postID where post.postID=3;
    /* where 전까지 : 코멘트에는 두번째 게시글에 멘트가 없기때문에 null로 출력*/
    /* where 이후 : 3번째꺼만 보임*/

/* comment에서 post를 left join을 했을 때 결과를 출력해보세요 */
select * from comment left join post 
	on post.postID = comment.postID;




