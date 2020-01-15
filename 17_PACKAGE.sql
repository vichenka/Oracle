--1.	������������ ����� ���������� �������, � �������:
--2.	��� � ������ � ������������ ����� ����������� ����������� ����� ������ �� ������� �� ����� ������� � ������, ����� ���� ��� ������ �� ������ ������� ���������. 
--3.	���������� ���������, ���� �� ��������� �������, � � �����-���� ������� ��������� �������� � �������� ����������, ��� ��������, ��� � ����������.
--4.	���������� ���������, ����������� �� ������ ��� �������.
--5.	���������� ���� ����������� ��������� ������� � ������ �����, ������������� ��� �������� ������.

select * from inputtable;
select * from outputtable;
select * from helpertable;


delete from inputtable;
delete from outputtable;
delete from helpertable;
drop table helpertable;
create table helpertable
(
  datetime date,
  info nvarchar2(10),
  timeinfo timestamp
)

create table inputtable
(
  id INTEGER generated by default as identity,
  name varchar(100)
);

create table outputtable
(
  id INTEGER generated by default as identity,
  name varchar(100)
);

declare
  i number := 1;
  temp varchar(100);
begin
  loop
  temp := CONCAT('Value ', to_char(i));
    insert into inputtable (name) values (temp);
    i := i + 1;
  exit when i > 10;
  end loop;
end;

select * from inputtable;



CREATE OR REPLACE PACKAGE CHNPKG as
  PROCEDURE MOVEHELPER;
  PROCEDURE STARTMOVE;
  procedure stop;
  procedure restart;
  procedure delete;
  function isjob return boolean;
END CHNPKG;

CREATE OR REPLACE PACKAGE BODY CHNPKG as
  PROCEDURE MOVEHELPER as
  temp inputtable%rowtype;
  begin
  select * into temp from inputtable where rownum = 1;
  insert into outputtable (id, name) values (temp.id, temp.name);
  delete from inputtable where rownum = 1;
  DBMS_OUTPUT.PUT_LINE('Done');
  insert into helpertable(datetime, info, timeinfo) values (sysdate, 'GOOD', current_timestamp);
  exception when others then 
    insert into helpertable(datetime, info, timeinfo) values (sysdate, 'ERROR', current_timestamp);
  end MOVEHELPER;
  
  PROCEDURE STARTMOVE is
  begin
    dbms_job.ISUBMIT(job => 1, what => 'begin CHNPKG.MOVEHELPER; end;', next_date => sysdate, interval => 'sysdate + 1/24/60');
    commit;
    dbms_output.put_line('startmove');
    exception when others then dbms_output.put_line(sqlerrm);
  end startmove;
  
  FUNCTION ISJOB RETURN BOOLEAN
  IS 
  temp nvarchar2(10) := 'false';
  BEGIN
  SELECT 'true' INTO temp FROM DUAL WHERE EXISTS (SELECT * FROM USER_JOBS WHERE JOB=1 AND BROKEN='N');
  if temp = 'true' then return true; else return false; end if;
  EXCEPTION WHEN OTHERS
  THEN RETURN FALSE;
  END isjob;
  
  PROCEDURE stop
IS
BEGIN
  DBMS_JOB.BROKEN(1, TRUE);
  COMMIT;
  END;
  
  PROCEDURE restart
  as
  BEGIN
  DBMS_JOB.RUN(1);
  END; 
  
  procedure delete 
  as
  begin
  dbms_job.remove(1);
  end;
END CHNPKG;

EXEC DBMS_JOB.BROKEN(1,false);
exec dbms_job.remove(1);
exec dbms_job.remove(2);
exec dbms_job.remove(6);
exec dbms_job.remove(7);

exec CHNPKG.STARTMOVE;

exec chnpkg.movehelper;
select * from user_jobs;

SELECT last_date, 
       last_sec, 
       next_date, 
       next_sec, 
       broken, 
       failures, 
       total_time
  FROM dba_jobs
 WHERE job = 1
 
select sysdate, current_timestamp from dual

begin CHNPKG.STARTMOVE; end; 
begin CHNPKG.movehelper; end; 


declare
temp boolean;
begin
temp := CHNPKG.isjob;
if temp = true then dbms_output.put_line('true'); else dbms_output.put_line('false'); end if;
end; 

begin
chnpkg.stop;
end;

begin
chnpkg.restart;
end;

begin
chnpkg.delete;
end;





CREATE OR REPLACE PACKAGE CHNPKG2 as
  PROCEDURE MOVEHELPER;
  PROCEDURE STARTMOVE;
  procedure stop;
  procedure restart;
  procedure delete;
  function isjob return boolean;
END CHNPKG2;



CREATE OR REPLACE PACKAGE BODY CHNPKG2 as
  PROCEDURE MOVEHELPER as
  temp inputtable%rowtype;
  begin
  select * into temp from inputtable where rownum = 1;
  insert into outputtable (id, name) values (temp.id, temp.name);
  delete from inputtable where rownum = 1;
  DBMS_OUTPUT.PUT_LINE('Done');
  insert into helpertable(datetime, info, timeinfo) values (sysdate, 'GOOD', current_timestamp);
  exception when others then 
    insert into helpertable(datetime, info, timeinfo) values (sysdate, 'ERROR', current_timestamp);
  end MOVEHELPER;
  
  PROCEDURE STARTMOVE is
  begin
    DBMS_SCHEDULER.create_job (
    job_name        => 'test_full_job_definition',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN chnpkg2.movehelper; END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'freq=MINUTELY;',
    end_date        => NULL,
    enabled         => TRUE,
    comments        => 'Job defined entirely by the CREATE JOB procedure.');
    commit;
    dbms_output.put_line('startmove');
    exception when others then dbms_output.put_line(sqlerrm);
  end startmove;
  
PROCEDURE restart
  as
  BEGIN
    DBMS_SCHEDULER.ENABLE('TEST_FULL_JOB_DEFINITION');
  END restart; 

  
  PROCEDURE stop
IS
BEGIN
DBMS_SCHEDULER.disable('TEST_FULL_JOB_DEFINITION');
  COMMIT;
  END stop;
  
  
  procedure delete 
  as
  begin
  SYS.DBMS_SCHEDULER.DROP_JOB (job_name => 'TEST_FULL_JOB_DEFINITION');
  end delete;
  
  FUNCTION ISJOB RETURN BOOLEAN
  IS 
  temp nvarchar2(10) := 'false';
  BEGIN
  SELECT 'true' INTO temp FROM DUAL WHERE EXISTS (SELECT * FROM all_scheduler_jobs where job_name = 'TEST_FULL_JOB_DEFINITION');
  if temp = 'true' then return true; else return false; end if;
  EXCEPTION WHEN OTHERS
  THEN RETURN FALSE;
  return false;
  END isjob;
END CHNPKG2;


SELECT owner, job_name, comments FROM dba_scheduler_jobs where job_name = 'TEST_FULL_JOB_DEFINITION';
SELECT * FROM dba_scheduler_jobs where job_name = 'TEST_FULL_JOB_DEFINITION';


begin
chnpkg2.startmove;
end;

begin
chnpkg2.restart;
end;

begin
chnpkg2.stop;
end;


begin
chnpkg2.delete;
end;

declare
temp boolean;
begin
temp := CHNPKG2.isjob;
if temp = true then dbms_output.put_line('true'); else dbms_output.put_line('false'); end if;
end; 

