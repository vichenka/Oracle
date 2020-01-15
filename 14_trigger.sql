--1.	
create table Acustomtable
(
	id number primary key,
	customname nvarchar2(50),
	CONSTRAINT constraint_name UNIQUE (customname)
);

--2.	
insert into Acustomtable (id, customname) values(1, 'Field 1');
insert into Acustomtable (id, customname) values(2, 'Field 2');
insert into Acustomtable (id, customname) values(3, 'Field 3');
insert into Acustomtable (id, customname) values(4, 'Field 4');
insert into Acustomtable (id, customname) values(5, 'Field 5');
insert into Acustomtable (id, customname) values(6, 'Field 6');
insert into Acustomtable (id, customname) values(7, 'Field 7');
insert into Acustomtable (id, customname) values(8, 'Field 8');
insert into Acustomtable (id, customname) values(9, 'Field 9');
insert into Acustomtable (id, customname) values(10, 'Field 10');


insert into Acustomtable (id, customname) values(14, 'Field 14');
select * from Acustomtable;

--3.
create or replace trigger before_all_task_3
before insert or update or delete on Acustomtable
begin
	dbms_output.put_line('before_all_task_3');
end;

drop trigger before_all_task_3;


--5.	
create or replace trigger before_all_task_5
before insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('before_all_task_5');
end;

drop trigger before_all_task_5;

--6.	
create or replace trigger before_all_task_6
before insert or update or delete on Acustomtable
begin
	if inserting then
		dbms_output.put_line('before_all_task_6 insert');
	elsif updating then
		dbms_output.put_line('before_all_task_6 update');
	elsif deleting then
		dbms_output.put_line('before_all_task_6 delete');
	end if;
end;

drop trigger before_all_task_6;
  
--7.	
create or replace trigger after_all_task_7
after insert or update or delete on Acustomtable
begin
	dbms_output.put_line('after_all_task_7');
end;

drop trigger after_all_task_7;

--8.	
create or replace trigger after_all_task_8
after insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('after_all_task_8');
end;

drop trigger after_all_task_8;

--9.	

create table CUSTOMAUDIT
(
OperationDate DATE,
OperationType nvarchar2(50),
TriggerName nvarchar2(50),
Operationinfo nvarchar2(1000)
);
drop table CUSTOMAUDIT;

--10.	

insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'before_all_task_03', 'any info' || 'any 2');

create or replace trigger before_all_task_03
before insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('before_all_task_03');
	if inserting then
      insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'before_all_task_03', :new.customname);
	elsif updating then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'updating', 'before_all_task_03', 'before: ' || :old.customname || ' new:' || :new.customname);
	elsif deleting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'deleting', 'before_all_task_03', :old.customname);
	end if;
end;

drop trigger before_all_task_03;

create or replace trigger before_all_task_05
before insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('before_all_task_05');
	if inserting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'before_all_task_05', :new.customname);
	elsif updating then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'updating', 'before_all_task_05', 'before: ' || :old.customname || ' new:' || :new.customname);
	elsif deleting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'deleting', 'before_all_task_05', :old.customname);
	end if;
end;

drop trigger before_all_task_05;

create or replace trigger before_all_task_06
before insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('before_all_task_06');
	if inserting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'before_all_task_06', :new.customname);
	elsif updating then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'updating', 'before_all_task_06', 'before: ' || :old.customname || ' new:' || :new.customname);
	elsif deleting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'deleting', 'before_all_task_06', :old.customname);
	end if;
end;

drop trigger before_all_task_06;

create or replace trigger after_all_task_07
after insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('after_all_task_07');
	if inserting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'after_all_task_07', :new.customname);
	elsif updating then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'updating', 'after_all_task_07', 'before: ' || :old.customname || ' new:' || :new.customname);
	elsif deleting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'deleting', 'after_all_task_07', :old.customname);
	end if;
end;

drop trigger before_all_task_07;

create or replace trigger after_all_task_08
after insert or update or delete on Acustomtable
for each row
begin
	dbms_output.put_line('after_all_task_08');
	if inserting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'inserting', 'after_all_task_08', :new.customname);
	elsif updating then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'updating', 'after_all_task_08', 'before: ' || :old.customname || ' new:' || :new.customname);
	elsif deleting then
		insert into CUSTOMAUDIT (OperationDate, OperationType, TriggerName, Operationinfo) values (CURRENT_DATE, 'deleting', 'after_all_task_08', :old.customname);
	end if;
end;

drop trigger after_all_task_08;

--11
insert into table Acustomtable(id, name) values (1,'name');

No, transaction.

--12.
drop table Acustomtable;

create or REPLACE trigger task12
before drop on database
begin
	raise_application_error(-20001, 'No dropping allowed');
end;

drop trigger task12;

select trigger_name, table_name from user_triggers;


--13.
drop table customaudit;


--14
create view customview as select * from Acustomtable;

create or REPLACE trigger task14
instead of insert on customview
for each row
begin
	insert into Acustomtable (id, customname) values (2, 'trigger task14');
end;

insert into customview (id, customname) values (3, 'trigger test');

select * from customview;

drop view customview;