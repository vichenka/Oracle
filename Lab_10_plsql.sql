-- ���������� �� --
CREATE TABLE AUDITORIUM_TYPE (
  AUDITORIUM_TYPE     INTEGER PRIMARY KEY,
  AUDITORIUM_TYPENAME NVARCHAR2(50) NOT NULL UNIQUE
);

CREATE TABLE AUDITORIUM (
  AUDITORIUM_NAME     NVARCHAR2(50) PRIMARY KEY,
  AUDITORIUM_CAPACITY INTEGER NOT NULL,
  AUDITORIUM_TYPE     INTEGER,

  FOREIGN KEY (AUDITORIUM_TYPE) REFERENCES AUDITORIUM_TYPE (AUDITORIUM_TYPE)
);

CREATE TABLE FACULTY (
  FACULTY      INTEGER PRIMARY KEY,
  FACULTY_NAME NVARCHAR2(50) UNIQUE NOT NULL
);
CREATE TABLE PULPIT (
  PULPIT      INTEGER PRIMARY KEY,
  PULPIT_NAME NVARCHAR2(50) UNIQUE NOT NULL,
  FACULTY     INTEGER,

  FOREIGN KEY (FACULTY) REFERENCES FACULTY (FACULTY)
);

DROP TABLE PULPIT;

CREATE TABLE TEACHER (
  TEACHER      INTEGER PRIMARY KEY,
  TEACHER_NAME NVARCHAR2(50) UNIQUE NOT NULL,
  PULPIT       INTEGER,

  FOREIGN KEY (PULPIT) REFERENCES PULPIT (PULPIT)
);

CREATE TABLE SUBJECT (
  SUBJECT      INTEGER PRIMARY KEY,
  SUBJECT_NAME NVARCHAR2(50) UNIQUE NOT NULL,
  PULPIT       INTEGER,

  FOREIGN KEY (PULPIT) REFERENCES PULPIT (PULPIT)
);

DROP TABLE SUBJECT;
DROP TABLE TEACHER;
DROP TABLE PULPIT;
DROP TABLE FACULTY;
DROP TABLE AUDITORIUM;
DROP TABLE AUDITORIUM_TYPE;

--1.	������������ ���������� ��������� ���� PL/SQL (��), �� ���������� ����������. 
BEGIN
  NULL;
END;

--2.	������������ ��, ��������� �Hello World!�. ��������� ��� � SQLDev � SQL+.
BEGIN
  dbms_output.put_line('Hello world!!!');
END;

--3.	����������������� ������ ���������� � ���������� ������� sqlerrm, sqlcode.
DECLARE
  x INTEGER := 1;
  y INTEGER := 0;
  z INTEGER := 0;
BEGIN
  dbms_output.put_line(
      'x = ' || x || ', y = ' || y
  );
  z := x / y;
  dbms_output.put_line(
      'z = ' || z
  );
    EXCEPTION WHEN OTHERS THEN dbms_output.put_line('code = ' || sqlcode || ', error = ' || sqlerrm);
END;

--4.	������������ ��������� ����. ����������������� ������� ��������� ���������� �� ��������� ������.
DECLARE
  x INTEGER := 1;
  y INTEGER := 0;
  z INTEGER := 0;
BEGIN
  dbms_output.put_line(
      'x = ' || x || ', y = ' || y
  );
  BEGIN
    z := x / y;
    dbms_output.put_line(
        'z = ' || z
    );
    EXCEPTION WHEN OTHERS THEN dbms_output.put_line('code = ' || sqlcode || ', error = ' || sqlerrm);
  END;
  dbms_output.put_line(
      'z = ' || z
  );
END;

--5.	��������, ����� ���� �������������� ����������� �������������� � ������ ������.
-- /as sysdba
-- show parameter plsql_warnings;

--6.	������������ ������, ����������� ����������� ��� ����������� PL/SQL.
SELECT keyword FROM v$reserved_words WHERE length = 1 AND keyword != 'A';

--7.	������������ ������, ����������� ����������� ��� �������� �����  PL/SQL.
SELECT keyword FROM v$reserved_words WHERE length > 1 ORDER BY keyword;

--8.	������������ ������, ����������� ����������� ��� ��������� Oracle Server, ��������� � PL/SQL. ����������� ��� �� ��������� � ������� SQL+-������� show.
SELECT NAME, VALUE FROM V$PARAMETER WHERE NAME LIKE 'plsql%';
-- show parameters plsql;

--9.	������������ ��������� ����, ��������������� :

--10.	���������� � ������������� ����� number-����������;
DECLARE
  x INTEGER := 1;
BEGIN
  dbms_output.put_line(
      'x = ' || x
  );
END;

--11.	�������������� �������� ��� ����� ������ number-����������, ������� ������� � ��������;
DECLARE
  x    NUMBER := 8;
  y    NUMBER := 10;
  summ NUMBER := 0;
  div  NUMBER := 0;
  mul  NUMBER := 0;
  dif  NUMBER := 0;
  res  NUMBER := 0;
BEGIN
  summ := x + y;
  div := y / x;
  mul := x * y;
  dif := y - x;
  res := mod(x, y);
  dbms_output.put_line(
      'x = ' || x || ', y = ' || y || ', sum = ' || summ || ', div = ' || div || ', dif = ' || dif || ', res = ' || res
  );
END;

--12.	���������� � ������������� number-���������� � ������������� ������;
DECLARE
  X NUMBER(10, -2) := 123.2341234;
BEGIN
  dbms_output.put_line(X);
END;

--13.	���������� � ������������� number-���������� � ������������� ������ � ������������� ��������� (����������);
DECLARE
  X NUMBER(10, 4) := 123.2341234;
BEGIN
  dbms_output.put_line(X);
END;

--14.	���������� � ������������� BINARY_FLOAT-����������;
DECLARE
  X BINARY_FLOAT := 123.2341234;
BEGIN
  dbms_output.put_line(X);
END;

--15.	���������� � ������������� BINARY_DOUBLE-����������;
DECLARE
  X BINARY_DOUBLE := 123.23412343456789;
BEGIN
  dbms_output.put_line(X);
END;

--16.	���������� number-���������� � ������ � ����������� ������� E (������� 10) ��� �������������/����������;
DECLARE
  X NUMBER(25, 4) := 123.2e10;
BEGIN
  dbms_output.put_line(X);
END;

--17.	���������� � ������������� BOOLEAN-����������.  
DECLARE
  X BOOLEAN := TRUE;
BEGIN
  IF NOT X
  THEN dbms_output.put_line('false'); END IF;
  IF X
  THEN dbms_output.put_line('true'); END IF;
END;

--18.	������������ ��������� ���� PL/SQL ���������� ���������� �������� (VARCHAR2, CHAR, NUMBER). �����������������  ��������� �������� �����������.  
DECLARE
  X CONSTANT VARCHAR2(20) := 'varchar2';
  Y          CHAR NOT NULL DEFAULT 'f';
  Z          NUMBER NOT NULL := 12;
BEGIN
  X := '3';
  dbms_output.put_line(Z);
  EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Code: ' || SQLCODE || ' Error: ' || SQLERRM);
END;

--19.	������������ ��, ���������� ���������� � ������ %TYPE. ����������������� �������� �����.
DECLARE
  pulpit SYSTEM.PULPIT.PULPIT%TYPE;
BEGIN
  pulpit := 3;
  dbms_output.put_line(pulpit);
  EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Code: ' || SQLCODE || ' Error: ' || SQLERRM);
END;

--20.	������������ ��, ���������� ���������� � ������ %ROWTYPE. ����������������� �������� �����.
DECLARE
  pulpit SYSTEM.PULPIT%ROWTYPE;
BEGIN
  pulpit.PULPIT_NAME := '����';
  pulpit.PULPIT := 1;
  dbms_output.put_line(pulpit.PULPIT_NAME || ' ' || pulpit.PULPIT);
  EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Code: ' || SQLCODE || ' Error: ' || SQLERRM);
END;

--21.	������������ ��, ��������������� ��� ��������� ����������� ��������� IF .
DECLARE
  pulpit SYSTEM.PULPIT.PULPIT%TYPE;
BEGIN
  pulpit := 11;
  IF pulpit > 10
  THEN dbms_output.put_line('pulpit > 10');
  ELSE dbms_output.put_line('else');
  END IF;
END;

--23.	������������ ��, ��������������� ������ ��������� CASE.
DECLARE
  x PLS_INTEGER := 9;
BEGIN
  CASE
    WHEN x > 10
    THEN dbms_output.put_line('pulpit > 10');
    WHEN x < 10
    THEN dbms_output.put_line('pulpit < 10');
  ELSE dbms_output.put_line('else');
  END CASE;
END;

--24.	������������ ��, ��������������� ������ ��������� LOOP.
DECLARE
  x PLS_INTEGER := 0;
BEGIN
  LOOP
    dbms_output.put_line(x);
    EXIT WHEN x > 5;
    x := x + 1;
  END LOOP;
END;

--25.	������������ ��, ��������������� ������ ��������� WHILE.
DECLARE
  x PLS_INTEGER := 0;
BEGIN
  WHILE (x < 10)
  LOOP
    x := x + 1;
    dbms_output.put_line(x);
  END LOOP;
END;

--26.	������������ ��, ��������������� ������ ��������� FOR.
BEGIN
  FOR k IN 1..10
  LOOP
    dbms_output.put_line(k);
  END LOOP;
END;