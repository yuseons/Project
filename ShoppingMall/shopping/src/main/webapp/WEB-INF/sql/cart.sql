use webtest;
drop table cart;
CREATE TABLE IF NOT EXISTS `webtest`.`cart` (
  `cartno` INT NOT NULL AUTO_INCREMENT COMMENT '장바구니 번호',
  `count` INT NOT NULL,
  `contentsno` INT NOT NULL,
  `id` VARCHAR(10) NOT NULL,
  `size` VARCHAR(3) NULL,
  PRIMARY KEY (`cartno`),
  CONSTRAINT `fk_cart_contents1`
    FOREIGN KEY (`contentsno`)
    REFERENCES `webtest`.`contents` (`contentsno`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `fk_cart_member1`
    FOREIGN KEY (`id`)
    REFERENCES `webtest`.`member` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

select * from cart;

-- join(1:1) : cartno 1개당 Contentsno 1개. 1:1관계
-- FOREIGN KEY (`contentsno`) : cartno가 contentsno를 참조함
select
c.contentsno, c.pname, c.price, c.filename,
t.cartno, t.size, t.count,t.id
from contents c inner join cart t 
on c.contentsno = t.contentsno -- c.contentsno는 primary key이고,  t.contentsno는 foreign key
where id = 'test';
-- cartDTO안에 ContentsDTO를 넣어서 한꺼번에 cartDTO를 가져옴


delete from cart;