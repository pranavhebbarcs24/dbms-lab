create table person (driver_id varchar(10),
name varchar(20), address varchar(30), primary key(driver_id));
desc person

create table car(reg_num varchar(10),model varchar(10),year int, primary
key(reg_num));

create table accident(report_num int, accident_date date, location
varchar(20),primary key(report_num));

create table owns(driver_id varchar(10),reg_num varchar(10),

primary key(driver_id, reg_num),

foreign key(driver_id) references person(driver_id),

foreign key(reg_num) references car(reg_num));

create table participated(driver_id varchar(10), reg_num varchar(10),

report_num int, damage_amount int,

primary key(driver_id, reg_num, report_num),

foreign key(driver_id) references person(driver_id),

foreign key(reg_num) references car(reg_num),

foreign key(report_num) references accident(report_num));

insert into Person (Driver_ID, Name, Address)
values
("A01", "Richard", "Srinivas Nagar"),
("A02", "Pradeep", "Rajaji Nagar"),
("A03", "Smith", "Ashok Nagar"),
("A04", "Venu", "N R Colony"),
("A05", "John", "Hanumanth Nagar");

select * from Person;

insert into Car (Reg_Num, Model, Year)
values
("KA052250", "Indica", 1990),
("KA031181", "Lancer", 1957),
("KA095477", "Toyota", 1998),
("KA053408", "Honda", 2008),
("KA041702", "Audi", 2005);

select * from Car;

insert into Owns (Driver_ID, Reg_Num)
values
("A01", "KA052250"),
("A02", "KA053408"),
("A03", "KA031181"),
("A04", "KA095477"),a
("A05", "KA041702");

select * from Owns;

insert into Accident (Report_Num, Accident_Date, Location)
values
(11, "2003-01-01", "Mysore Road"),
(12, "2004-02-02", "South End Circle"),
(13, "2003-01-21", "Bull Temple Road"),
(14, "2008-02-17", "Mysore Road"),
(15, "2005-03-04", "Kanakpura Road");

select * from Accident;
INSERT INTO Participated (Driver_ID, Reg_Num, Report_Num, Damage_Amount)
VALUES
('A01', 'KA052250', 11, 10000),
('A02', 'KA053408', 12, 50000),
('A03', 'KA095477', 13, 25000),
('A04', 'KA031181', 14, 3000),
('A05', 'KA041702', 15, 5000);
UPDATE Participated 
SET Damage_Amount = 25000
WHERE Reg_Num = 'KA053408' AND Report_Num = 12;
SELECT * FROM Participated;
select count(distinct driver_id) CNT
from participated a, accident b
where a.report_num=b.report_num and b.accident_date like '%08%';
insert into accident values(16,'2008-03-08','Domlur');
select * from accident;
select accident_date,location from accident;
select driver_id from participated where damage_amount>=25000;
