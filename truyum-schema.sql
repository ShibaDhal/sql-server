create database truyum;
use truyum;
create table menu_item(
menuId       int          not null primary key,
name         varchar(20)  not null,
price        decimal(5,2) not null,
active       varchar(10)  not null,
dateOfLaunch date         not null,
category     varchar(30)  not null,
freeDelivery varchar(10)  not null,
action       varchar (10) not null
);

use truyum;
create table [user](
userId   int         not null primary key,
userName varchar(30) not null,
userType varchar(30) not null
);

use truyum;
create table cart(
cartId int not null primary key,
menuId int,
userId int,
foreign key (userId) REFERENCES [user](userId),
foreign key (menuId) references menu_item(menuId)
);