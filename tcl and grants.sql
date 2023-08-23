create table aml(id integer , name varchar(30), phone integer);

alter table aml modify column phone varchar(50);

insert into aml value(101,'Mansi',8178801771);
insert into aml values(102,'Devi',7569161274);
insert into aml values(103, 'Kunal', 9024533838);

select * from aml;

start transaction;
insert into aml values(104,'Amisha', 1234567890);
commit;

set autocommit = 0;
start transaction;
insert into aml values(105,'Hrtivik', 222222222);
commit;

SET SQL_SAFE_UPDATES = 0;
delete from aml where id = 105;
rollback;
select * from aml;
#describe aml;
savepoint s1;
delete from aml where id = 101;

select * from aml;

rollback to s1;

savepoint s2;
delete from aml where id = 102;

rollback to s2;
select * from aml;



create user testuser identified by '1234';

GRANT INSERT ON aml to testuser;
GRANT select ON aml to testuser;

SHOW GRANTS FOR testuser;

revoke insert on seven.aml from testuser;

show grants for testuser;

drop user testuser;