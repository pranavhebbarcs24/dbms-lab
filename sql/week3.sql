select * from car order by year asc;
select count(report_num)
from car c,participated p
where c.reg_num=p.reg_num and c.model='Lancer';
update participated set damage_amount=25000 where reg_num='KA053408' and report_num=12;
select * from participated;
SELECT * FROM PARTICIPATED ORDER BY DAMAGE_AMOUNT DESC;
SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED;
DELETE FROM PARTICIPATED WHERE DAMAGE_AMOUNT<13600;
select max(damage_amount) from participated;
SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID
AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);
