use webtest;

   create table review(
   rnum int not null auto_increment primary key,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   contentsno int(7) not null,
   foreign key(contentsno) references contents(contentsno)
);

select * from contents;
select * from member;
							-- 존재하는 글의 contentsno를 입력해야한다
insert into review(content, regdate, id, contentsno)
values('리뷰 남깁니다.',sysdate(),'user1',1);

insert into review(content, regdate, id, contentsno)
values('리뷰 남깁니다. 물건이 마음에 들어요.',sysdate(),'user2',1);

insert into review(content, regdate, id, contentsno)
values('리뷰 남깁니다.너무 편해요.',sysdate(),'test',1);

insert into review(content, regdate, id, contentsno)
values('좋아요.',sysdate(),'user3',1);


                    
-- 리뷰 목록 list
select rnum, content, regdate, id, contentsno
from review
where contentsno = 1
order by rnum DESC;

-- 리뷰 갯수 total
select count(*) 
from review
where contentsno = 1;

-- update(댓글 수정)
update review
set content = '새로운 의견을 올립니다.'
where rnum = 1;
 
-- delete(댓글 삭제)
delete 
from review
where rnum = 1;