create database Warehouse;

use warehouse;

create table Employees (IdEmployees int primary key auto_increment, First_name varchar(15), Last_name varchar(20), Pesel char(11));
create table Sim_card (IdSim_card int primary key auto_increment, Provider varchar(20), Sim_number char(7));
create table Address (IdAddress int primary key auto_increment, Zip_code varchar(10), City varchar(30), Street varchar(45), Number varchar(15));
create table Orders (IdOrders int primary key auto_increment, Date date);
create table Devices (IdPhone int primary key auto_increment, Name varchar(30), Phone_code varchar(7));
create table Damaged_devices(IdDamaged_devices int primary key auto_increment, Note varchar(50), Date date);

alter table Employees add column IdAddress int;
alter table Employees add foreign key (IdAddress) references Address(IdAddress);

alter table Orders add column IdEmployees int;
alter table Orders add foreign key (IdEmployees) references Employees(IdEmployees);

alter table Orders add column IdPhone int;
alter table Orders add foreign key (IdPhone) references Devices(IdPhone);

alter table Orders add column IdSim_card int;
alter table Orders add foreign key (IdSim_card) references Sim_card(IdSim_card); 

alter table Damaged_devices add column IdEmployees int;
alter table Damaged_devices add foreign key (IdEmployees) references Employees(IdEmployees);

alter table Damaged_devices add column IdPhone int;
alter table Damaged_devices add foreign key (IdPhone) references Devices(idPhone);

describe Orders;
describe Address;
describe Damaged_devices;
describe Devices;
describe Employees;
describe Sim_card;

describe Employees;
insert into Employees (First_name, Last_name, Pesel) values ('Tomasz', 'Nowak', 85070312864);
insert into Employees (First_name, Last_name, Pesel) values ('Karol', 'Kowalski', 89080618834);
insert into Employees (First_name, Last_name, Pesel) values ('Magda', 'Kowalczyk', 93040714884);
insert into Employees (First_name, Last_name, Pesel) values ('Karolina', 'Jankowska', 94051218636);
insert into Employees (First_name, Last_name, Pesel) values ('Jacek', 'Nowicki', 95051115688);
insert into Employees (First_name, Last_name, Pesel) values ('Monika', 'Tomaszewska', 92011115282);
insert into Employees (First_name, Last_name, Pesel) values ('Norbert', 'Nowy', 91012115381);
select * from Employees;

describe Address;
insert into Address (Zip_code, City, Street, Number) values ('00-000', 'Warszawa', 'Oliwkowa', '10A');
insert into Address (Zip_code, City, Street, Number) values ('26-930', 'Anielin', 'Pudrowa', '14');
insert into Address (Zip_code, City, Street, Number) values ('78-444', 'Gwizdowo', 'Mazurska', '16B');
insert into Address (Zip_code, City, Street, Number) values ('26-660', 'Janki', 'Sosnowa', '2C');
insert into Address (Zip_code, City, Street, Number) values ('25-150', 'Kielce', 'Miodowa', '23');
insert into Address (Zip_code, City, Street, Number) values ('38-223', 'Mrukowa', 'Ossowska', '5B');

select * from Address;

select * from Employees;

update Employees
set IdAddress = 2
where IdEmployees = 3;

update Employees
set IdAddress = 1
where IdEmployees = 1;

update Employees
set IdAddress = 4
where IdEmployees = 2;

update Employees
set IdAddress = 3
where IdEmployees = 4;

update Employees
set IdAddress = 5
where IdEmployees = 5;

update Employees
set IdAddress = 6
where IdEmployees = 6;

update Employees
set IdAddress = 7
where IdEmployees = 7;

describe Sim_card;
insert into Sim_card (Provider, Sim_number) values ('T-mobile','9846098');
insert into Sim_card (Provider, Sim_number) values ('Play','1816391');
insert into Sim_card (Provider, Sim_number) values ('Orange','2816698');
insert into Sim_card (Provider, Sim_number) values ('Plus','3816699');
insert into Sim_card (Provider, Sim_number) values ('NJU.','4816621');
insert into Sim_card (Provider, Sim_number) values ('Orange','2812617');
insert into Sim_card (Provider, Sim_number) values ('Vodafone','6826689');
select * from Sim_card;

describe devices;
insert into devices(Name, Phone_code) values ('Samsung Galaxy S9','#563082');
insert into devices(Name, Phone_code) values ('Samsung Galaxy S10','#523012');
insert into devices(Name, Phone_code) values ('Samsung Galaxy Note9','#163082');
insert into devices(Name, Phone_code) values ('Iphone 9','#343012');
insert into devices(Name, Phone_code) values ('Iphone SE','#223012');
insert into devices(Name, Phone_code) values ('Huawei P30 Lite','#156182');
insert into devices(Name, Phone_code) values ('ESCOBAR FOLD 2','#656281');
select * from Devices;

describe damaged_devices;
insert into damaged_devices (Note, Date, IdEmployees, IdPhone) values ('Sim card issue', '2020-01-20', 2, 1);
select * from damaged_devices;

describe Orders;

insert into Orders (Date, IdEmployees, IdPhone, IdSim_card) values ('2020-01-19', 2, 1, 1);
insert into Orders (Date, IdEmployees, IdPhone, IdSim_card) values ('2018-04-12', 1, 2, 2);
insert into Orders (Date, IdEmployees, IdPhone, IdSim_card) values ('2020-02-11', 3, 3, 3);
insert into Orders (Date, IdEmployees, IdPhone, IdSim_card) values ('2019-04-08', 4, 4, 4);

select * from Orders;

Select * from employees
inner join Orders
on Employees.IdEmployees = Orders.IdEmployees;

