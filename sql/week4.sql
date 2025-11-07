create database dhiksha_bank;
use dhiksha_bank;
create table dhiksha_bank.branch(
Branch_name varchar(30),
Branch_city varchar(25),
assets int,
PRIMARY KEY (Branch_name)
);
create table dhiksha_bank.BankAccount(
Accno int,
Branch_name varchar(30),
Balance int,
PRIMARY KEY(Accno),
foreign key (Branch_name) references branch(Branch_name)
);
create table dhiksha_bank.BankCustomer(
Customername varchar(20),
Customer_street varchar(30),
CustomerCity varchar (35),
PRIMARY KEY(Customername)
);
create table dhiksha_bank.Depositor(
Customername varchar(20),
Accno int,
PRIMARY KEY(Customername,Accno),
foreign key (Accno) references BankAccount(Accno),
foreign key (Customername) references BankCustomer(Customername)
);
create table dhiksha_bank.Loan(
Loan_number int,
Branch_name varchar(30),
Amount int,
PRIMARY KEY(Loan_number),
foreign key (Branch_name) references branch(Branch_name)
);
insert into branch values('SBI_Chamrajpet', 'Bangalore', 50000);
insert into branch values('SBI_ResidencyRoad', 'Bangalore', 10000);
insert into branch values('SBI_ShivajiRoad', 'Bombay', 20000);
insert into branch values('SBI_ParliamentRoad', 'Delhi', 10000);
insert into branch values('SBI_JantarMantar', 'Delhi', 20000);

insert into BankAccount values(1, 'SBI_Chamrajpet', 2000);
insert into BankAccount values(2, 'SBI_ResidencyRoad', 5000);
insert into BankAccount values(3, 'SBI_ShivajiRoad', 6000);
insert into BankAccount values(4, 'SBI_ParliamentRoad', 9000);
insert into BankAccount values(5, 'SBI_JantarMantar', 8000);
insert into BankAccount values(6, 'SBI_ShivajiRoad', 4000);
insert into BankAccount values(8, 'SBI_ResidencyRoad', 4000);
insert into BankAccount values(9, 'SBI_ParliamentRoad', 3000);
insert into BankAccount values(10, 'SBI_ResidencyRoad', 5000);
insert into BankAccount values(11, 'SBI_JantarMantar', 2000);

insert into BankCustomer values('Avinash', 'Bull_Temple_Road', 'Bangalore');
insert into BankCustomer values('Dinesh', 'Bannerghatta_Road', 'Bangalore');
insert into BankCustomer values('Mohan', 'National_College_Road', 'Bangalore');
insert into BankCustomer values('Nikil', 'Akbar_Road', 'Delhi');
insert into BankCustomer values('Ravi', 'Prithviraj_Road', 'Delhi');

insert into Depositor values('Avinash', 1);
insert into Depositor values('Dinesh', 2);
insert into Depositor values('Nikil', 4);
insert into Depositor values('Ravi', 5);
insert into Depositor values('Avinash', 8);
insert into Depositor values('Nikil', 9);
insert into Depositor values('Dinesh', 10);
insert into Depositor values('Nikil', 11);

insert into Loan values(1,'SBI_Chamrajpet', 1000);
insert into Loan values(2,'SBI_ResidencyRoad', 2000);
insert into Loan values(3,'SBI_ShivajiRoad', 3000);
insert into Loan values(4,'SBI_ParliamentRoad', 4000);
insert into Loan values(5,'SBI_JantarMantar', 5000);

select* from branch;
select* from BankAccount;
select* from Depositor;
select* from BankCustomer;
select* from Loan;
