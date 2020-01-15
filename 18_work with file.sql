--1.	�������� ��������� ����, ���������� ������ ��� ������� (20 �����, ���������� �����, ������ � ����).

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
 
--2.	��������� ������, ��������������� �������� ������, �� ����� ����� � ���� ������ ��� ������ SQL*Loader.
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
--3.	������ ������ ���� ��������� � ���� ���� ����� ���������, ����� ��������� �� �����.

--4.	��������� ���������� ������ SELECT-������� �� ������� ���� ����� ��������.


set heading off
set pagesize 0

spool c:\test\result.txt
select * from lab18;
spool off
