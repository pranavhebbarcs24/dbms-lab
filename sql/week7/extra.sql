use supplier;

select p.pname, s.sname, c.cost
from catalog c
join parts p on c.pid = p.pid
join suppliers s on c.sid = s.sid
where c.cost = (select max(cost) from catalog);

select s.sname
from suppliers s
where s.sid not in (
    select c.sid
    from catalog c
    join parts p on c.pid = p.pid
    where p.color = 'red'
);

select s.sname, sum(c.cost) as total_value
from suppliers s
join catalog c on s.sid = c.sid
group by s.sid, s.sname;

select s.sname
from suppliers s
join catalog c on s.sid = c.sid
where c.cost < 20
group by s.sid, s.sname
having count(distinct c.pid) >= 2;

select p.pname, s.sname, c.cost
from catalog c
join parts p on c.pid = p.pid
join suppliers s on c.sid = s.sid
where c.cost = (
    select min(c2.cost)
    from catalog c2
    where c2.pid = c.pid
);

create view supplier_part_count as
select s.sname, count(distinct c.pid) as total_parts
from suppliers s
join catalog c on s.sid = c.sid
group by s.sid, s.sname;
select * from supplier_part_count;

create view most_expensive_supplier as
select p.pname, s.sname, c.cost
from catalog c
join parts p on c.pid = p.pid
join suppliers s on c.sid = s.sid
where c.cost = (
    select max(c2.cost)
    from catalog c2
    where c2.pid = c.pid
);
select * from most_expensive_supplier;

delimiter //

create trigger prevent_low_cost
before insert on catalog
for each row
begin
    if new.cost < 1 then
        signal sqlstate '45000'
        set message_text = 'cost cannot be less than 1';
    end if;
end;
//

delimiter ;

delimiter //

create trigger set_default_cost
before insert on catalog
for each row
begin
    if new.cost is null then
        set new.cost = 10;
    end if;
end;
//

delimiter ;
