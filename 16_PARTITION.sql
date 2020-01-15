--1. Создайте таблицу T_RANGE c диапазонным секционированием. Используйте ключ секционирования типа NUMBER.

CREATE TABLE T_RANGE
(
  id NUMBER,
  forkey NUMBER
)
 PARTITION BY RANGE (forkey)
(
  PARTITION first100 VALUES LESS THAN (100), --  after can set tablespace
  PARTITION first200 VALUES LESS THAN (200),
  PARTITION first300 VALUES LESS THAN (300)
);

--2. Создайте таблицу T_INTERVAL c интервальным секционированием. Используйте ключ секционирования типа DATE.
create table T_INTERVAL
(
 id number,
 forkey date
)
partition by range (forkey)
interval (numtoyminterval(1, 'MONTH')) 
(
  partition first values less than (to_date('2007-02-01','yyyy-mm-dd')),
  partition second values less than (to_date('2007-03-01','yyyy-mm-dd')),
  partition third values less than (to_date('2007-04-01','yyyy-mm-dd'))
);

--3. Создайте таблицу T_HASH c хэш-секционированием. Используйте ключ секционирования типа VARCHAR2.
CREATE TABLE T_HASH
(
  id NUMBER,
  forkey VARCHAR2 (50)
)
PARTITION BY HASH (forkey)
(
  partition first,
  partition second,
  partition third
);

--4. Создайте таблицу T_LIST со списочным секционированием. Используйте ключ секционирования типа CHAR.
CREATE TABLE T_LIST
(
  id NUMBER,
  forkey char (60)
)
PARTITION BY LIST (forkey)
(
  partition first values ('A', 'B'),
  partition second values ('C', 'D'),
  partition third values ('E', 'F')
);

--5. Введите с помощью операторов INSERT данные в таблицы T_RANGE, T_INTERVAL, T_HASH, T_LIST.
--Данные должны быть такими, чтобы они разместились по всем секциям.
--Продемонстрируйте это с помощью SELECT запроса.
--  T_RANGE
insert into T_RANGE(id, forkey) values(1, 1);
insert into T_RANGE(id, forkey) values(2, 101);
insert into T_RANGE(id, forkey) values(3, 201);

select * from T_RANGE;
select * from T_RANGE partition(first100);
select * from T_RANGE partition(first200);
select * from T_RANGE partition(first300);

--  T_INTERVAL
insert into T_INTERVAL(id, forkey) values(1, to_date('2007-01-02','yyyy-mm-dd'));
insert into T_INTERVAL(id, forkey) values(2, to_date('2007-02-02','yyyy-mm-dd'));
insert into T_INTERVAL(id, forkey) values(3, to_date('2007-03-02','yyyy-mm-dd'));

select * from T_INTERVAL;
select * from T_INTERVAL partition(first);
select * from T_INTERVAL partition(second);
select * from T_INTERVAL partition(third);

--  T_HASH
insert into T_HASH(id, forkey) values(1, 'afirst');
insert into T_HASH(id, forkey) values(2, 'msecond');
insert into T_HASH(id, forkey) values(3, 'zthird');

select * from T_HASH;
select * from T_HASH partition(first);
select * from T_HASH partition(second);
select * from T_HASH partition(third);

--  T_LIST
insert into T_LIST(id, forkey) values(1, 'A');
insert into T_LIST(id, forkey) values(2, 'C');
insert into T_LIST(id, forkey) values(3, 'D');
insert into T_LIST(id, forkey) values(4, 'E');

select * from T_LIST;
select * from T_LIST partition(first);
select * from T_LIST partition(second);
select * from T_LIST partition(third);

--6. Продемонстрируйте для всех таблиц процесс перемещения строк между секциями, при изменении (оператор UPDATE) ключа секционирования.
alter table T_LIST ENABLE ROW MOVEMENT;
update T_LIST set forkey = 'E' where forkey = 'A';

--7. Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE MERGE.
alter table T_LIST merge partitions second, third into partition forth;
select * from T_LIST partition(forth);

--8. Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE SPLIT.
alter table T_LIST SPLIT PARTITION forth into 
(
partition second values ('C', 'D'),
partition third
);

--9. Для одной из таблиц продемонстрируйте действие оператора ALTER TABLE EXCHANGE.
CREATE TABLE T_LIST2
(
  id NUMBER,
  forkey char (60)
);
drop table  T_LIST2
truncate table T_LIST;
truncate table T_LIST2;
alter table T_LIST exchange partition first with table T_LIST2;

insert into T_LIST2(id, forkey) values(1, 'A');
insert into T_LIST2(id, forkey) values(2, 'A');
insert into T_LIST2(id, forkey) values(3, 'A');
insert into T_LIST2(id, forkey) values(4, 'A');

select * from T_LIST2;