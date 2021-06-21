drop table payment;
drop table membership;

select * from tab;



create table membership(
id varchar2(20) constraint membership_id_pk primary key,
pw varchar2(20),
name varchar2(20),
birth varchar2(20),
phone varchar2(20),
address varchar2(20)
)



insert into membership
values('id1','pw1','name_test','1990-01-31','010-2003-1112','address_test')

insert into membership
values('admin','admin','name_test','1995-02-05','010-2223-4442','address_test')

select * from membership;


select * from membership where id='admin' and pw='admin';


create table payment(
num number constraint payment_num_pk primary key,
id varchar2(20) constraint payment_id_fk references membership on delete cascade,
division varchar2(20),
defaultMethod varchar(20),
bankName varchar2(20),
bankAccount varchar2(20),
business varchar2(20),
ownerName varchar2(20),
ownerBirth varchar2(20),
cardNumber varchar2(20),
expirationDate varchar2(20),
securityNumber number(2)

);

create sequence payment_seq;


insert into payment
values(payment_seq.nextval,'id1','account','del','111-222333-44-555',(select name from membership where id='id1'),(select birth from membership where id='id1'),null,null,null);

insert into payment
values(payment_seq.nextval,'id1','card',null,null,(select name from membership where id='id1'),(select birth from membership where id='id1'),'1111-2222-3334del','MM/YY',22);

select * from payment;


select M.*, P.* from
membership M left join payment P
on M.id=P.id;


commit work;