create database quanlybanhang;

use quanlybanhang;

create table customers(
	cId int not null auto_increment primary key,
    cName varchar(50) not null,
    cAge int    
);

create table orders(
	oId int not null auto_increment primary key,
    cId int not null,
    oDate datetime,
    oTotalPrice int,
    foreign key (cId) references customers(cId)
);	

create table products(
	pId int not null auto_increment primary key,
    pName varchar(255) not null,
    pPrice int 
);

create table orderDetails(
	oId int not null,
    pId int not null,
    odQTY int not null,
    
    foreign key (oId) references orders(oId),
    foreign key (pId) references products(pId)
    
);

insert into customers value(1, 'minh quan', 10), 
(2, 'ngoc anh', 20),
(3, 'hong ha', 50);

select * from customers;

INSERT INTO orders (oId, cId, oDate) VALUES
(1, 1, '2006-03-21'),
(2, 2, '2006-03-23'),
(3, 1, '2006-03-16');

select * from orders;

INSERT INTO products (pId, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

select * from products;

INSERT INTO orderDetails (oId, pId, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select * from orderDetails;

select oId, oDate, oTotalPrice from orders;

select DISTINCT  c.cName , p.pName
from customers c
inner join orders o on c.cId = o.cId
inner join orderDetails od on o.oId = od.oId
inner join products p on od.pId = p.pId;

select c.cName
from customers c
left join orders o on c.cId = o.cId
where o.cId is null;

select o.oId, o.oDate, 
sum(od.odQTY * p.pPrice) as totalPrice
from orders o
inner join orderDetails od on o.oId = od.oId
inner join products p on od.pId = p.pId
group by o.oId, o.oDate;

 
