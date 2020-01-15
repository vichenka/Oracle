--1.	Создайте текстовый файл, содержащий данные для импорта (20 строк, содержащий числа, строки и даты).

drop table lab18;

create table lab18
(
  integervalue float,
  charvalue nvarchar2(100),
  datevalue date
)

SET ECHO on;
SET PAGESIZE 0;
SET LINESIZE 32767;
SET TRIMSPOOL ON;
SET FEEDBACK on;
SET TERMOUT on;
SET COLSEP ,;

load data
INFILE 'info.txt'
INTO TABLE lab18
FIELDS TERMINATED BY ';'
(
integervalue,
charvalue,
datevalue date "YYYY-MM-DD"
)

SPOOL D:\out.txt
SELECT * FROM lab_table_for_import;
SPOOL OFF;
 
--2.	Загрузите данные, соответствующие текущему месяцу, из этого файла в базу данных при помощи SQL*Loader.
load data
INFILE 'info.txt'
APPEND
INTO TABLE lab18
FIELDS TERMINATED BY ';'
(
datevalue date "YYYY-MM-DD",
integervalue "round(:integervalue, 2)",
charvalue "upper(:charvalue)"
)
--3.	Строки должны быть приведены к виду «Все буквы заглавные», числа округлены до сотых.

--4.	Выгрузить результаты любого SELECT-запроса во внешний файл любым способом.


set heading off
set pagesize 0

spool c:\test\result.txt
select * from lab18;
spool off
