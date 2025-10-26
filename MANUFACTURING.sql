create database Manufacturing;

use manufacturing;

create table machines(
machine_id int primary key auto_increment,
machine_name varchar(50) not null,
department varchar(50),
installation_date date,
status varchar(20));

insert into machines (machine_name, department, installation_date, status) VALUES
('CNC Lathe A1', 'Machining', '2021-03-15', 'Active'),
('CNC Milling B2', 'Machining', '2020-10-05', 'Active'),
('Hydraulic Press C3', 'Forming', '2019-07-22', 'Active'),
('Laser Cutter D4', 'Cutting', '2022-01-10', 'Active'),
('Injection Molder E5', 'Molding', '2020-05-17', 'Maintenance'),
('Assembly Robot F6', 'Assembly', '2023-02-11', 'Active');


create table products(
product_id int primary key auto_increment,
product_name varchar(50) not null,
category varchar(20));

create table production_log(
production_id int primary key auto_increment,
machine_id	int,
product_id	int,
production_date	date,
shift	VARCHAR(10),
units_produced	int,
defective_units	int,
operating_hours	float,
downtime_hours	float,
foreign key (machine_id) references machines(machine_id),
foreign key (product_id) references products(product_id));

create table maintenance_log(
maintenance_id	int	primary key auto_increment,
machine_id	int,
maintenance_date date,
issue_type	varchar(100),
duration_hours	float,
foreign key (machine_id) references machines(machine_id));