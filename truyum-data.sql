--#1.a
insert into menu_item 
(menuId,name,price,active,dateOfLaunch,category,freeDelivery,action)
values
(1,'Sandwich',99.00,'Yes','2017-03-15','Main Course','Yes','Edit'),
(2,'Burger',129.00,'Yes','2017-12-23','Main Course','No','Edit'),
(3,'Pizza',149.00,'Yes','2017-08-21','Main Course','No','Edit'),
(4,'French Fries',57.00,'No','2017-07-02','Staters','Yes','Edit'),
(5,'Chocolate Brownie',32.00,'Yes','2022-11-02','Dessert','Yes','Edit');

--#1.b
use truyum;
SELECT name,concat('Rs. ',price) as price,active,dateOfLaunch,category,freeDelivery,action FROM menu_item;

--#2.a
select 
		name,
		concat('Rs. ',price) as price,
		category,
        freeDelivery,
		replace(action,'Edit','Add to Cart') as action 
	from menu_item 
		where dateOfLaunch < '2020-08-03' and active = 'Yes';

--#3.a
select 
		name,
        concat('Rs. ',price) as price,
        active,
        dateOfLaunch,
        category,
        freeDelivery,
        action 
	from menu_item
where menuId=1;

--#3.b
update menu_item
		set 
		name = 'Rice',
		price = 20.00,
		active = 'yes',
		dateOfLaunch='1989-01-01',
		category='Main Course',
		freeDelivery = 'Yes'
	where menuId = 1;

--#4.a
insert into [user] 
(userId,userName,userType)
values 
(1,'Martin','Admin'),
(2,'Steve','Customer');

insert into cart 
(cartId,menuId,userId) 
values
(1,1,2),
(2,2,2),
(3,3,2);

--#5.a
select 
		m.name,
        m.freeDelivery,
        m.price 
	from menu_item m
inner join cart c on m.menuId=c.menuId
inner join [user] u on c.userId=u.userId
		where c.userId=2;

--#5.b
select 
		concat('Rs. ',cast(sum(m.price)as char)) as Total 
	from menu_item m
inner join cart c on m.menuId=c.menuId
inner join [user] u on c.userId=u.userId
		where c.userId=2;

--#6.a
delete from cart
where 
menuId=3
and 
userId = 2;