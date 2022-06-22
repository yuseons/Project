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

insert into review(content, regdate, id, contentsno)
values('리뷰 남깁니다.',sysdate(),'user1',1);
					-- 존재하는 글의 contentsno를 입력해야한다
                    
-- 리뷰 목록 list
select rnum, content, regdate, id, contentsno
from review
where contentsno = 1
order by rnum DESC
limit 0, 3;

-- 리뷰 갯수 total
select count(*) 
from review
where contentsno = 1;
