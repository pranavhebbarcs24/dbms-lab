SELECT Branch_name, CONCAT(assets/100000, ' lakhs') AS assets_in_lakhs
FROM branch;
SELECT d.Customername
FROM Depositor d
JOIN BankAccount b ON d.Accno = b.Accno
WHERE b.Branch_name = 'SBI_ResidencyRoad'
GROUP BY d.Customername
HAVING COUNT(d.Accno) >= 2;
SELECT d.Customername
FROM Depositor d
JOIN BankAccount b ON d.Accno = b.Accno
WHERE b.Branch_name = 'SBI_ResidencyRoad'
GROUP BY d.Customername
HAVING COUNT(d.Accno) >= 2;
CREATE VIEW sum_of_loan AS
SELECT Branch_name, SUM(Balance) AS total_balance
FROM BankAccount
GROUP BY Branch_name;
select * from sum_of_loan;
SELECT d.customername
FROM depositor d
JOIN bankaccount a ON d.accno = a.accno
JOIN branch b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'Delhi'
GROUP BY d.customername
HAVING COUNT(DISTINCT b.branch_name) = (
    SELECT COUNT(DISTINCT branch_name)
    FROM branch
    WHERE branch_city = 'Delhi'
);
DELETE FROM bankaccount
WHERE branch_name IN (
    SELECT branch_name
    FROM branch
    WHERE branch_city = 'Mumbai'
);
SELECT * FROM LOAN ORDER BY AMOUNT DESC;
CREATE VIEW BRANCH_TOTAL_LOAN (BRANCH_NAME, TOTAL_LOAN) AS SELECT
BRANCH_NAME, SUM(AMOUNT) FROM LOAN GROUP BY BRANCH_NAME;
UPDATE bankaccount
SET balance = balance * 1.05;
select branch_name from branch where assets >all(select assets from branch
where branch_city = 'Bangalore');
create table borrower(
customername varchar(20),
loan_number int,
primary key(customername,loan_number),
foreign key (customername)references BankCustomer(customername),
foreign key(loan_number) references loan(loan_number)
);
insert into borrower values('avinash',1);
insert into borrower values('dinesh',2);
insert into borrower values('mohan',3);
insert into borrower values('nikil',4);
insert into borrower values('ravi',5);
select distinct customername
from borrower where customername not in
(select customername from depositor);

SELECT DISTINCT bwr.customername
FROM borrower bwr
JOIN loan l ON bwr.loan_number = l.loan_number
JOIN branch br1 ON l.branch_name = br1.branch_name
WHERE br1.branch_city = 'Bangalore'
AND (bwr.customername, br1.branch_name) IN (
    SELECT d.customername, br2.branch_name
    FROM depositor d
    JOIN bankaccount a ON d.accno = a.accno
    JOIN branch br2 ON a.branch_name = br2.branch_name
    WHERE br2.branch_city = 'Bangalore'
);


