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
    oTotalPrice double not null,
    foreign key (cId) references customers(cId)
);

create table products(
	pId int not null auto_increment primary key,
    pName varchar(255) not null,
    pPrice double not null
);

create table orderDetails(
	oId int not null,
    pId int not null,
    odQTY int not null,
    
    foreign key (oId) references orders(oId),
    foreign key (pId) references products(pId)
    
);