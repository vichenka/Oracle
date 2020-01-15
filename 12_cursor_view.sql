--1. �������� � ������� TEACHERS ��� ������� BIRTHDAY� SALARY, ��������� �� ����������.
select * from teacher;

create table teacher(teacher_name VARCHAR(50))

alter table TEACHER
add teacher_name VARCHAR(50) default 'Teacher1';

alter table TEACHER
add BIRTHDAY DATE default '10/2/1900';

alter table TEACHER
add PULPIT VARCHAR(50) default 'FIT';

alter table TEACHER
add SALARY number(20) default 100;

select * from teacher;

INSERT INTO teacher(teacher_name, BIRTHDAY, PULPIT, SALARY) values ('Name2 Name Name', '13/01/1997', 'FIT' , 616);

--2. �������� ������ �������������� � ���� ������� �.�.
select substr(teacher_name, 1, instr(teacher_name, ' ')) ||
        substr(teacher_name, instr(teacher_name, ' ') + 1, 1) || '.' || ' ' 
                || substr(teacher_name, instr(teacher_name, ' ', instr(teacher_name, ' ') + 1) + 1, 1) || '.' from teacher;

--3. �������� ������ ��������������, ���������� � �����������.
select * from teacher where to_char(birthday, 'D') = 1;

declare
cursor cs is select * from teacher for update;
en number (2) := 0;
bufline teacher%rowtype;
begin
open cs;
loop
fetch cs into bufline;
exit when cs%notfound;
en := en + 2;
en := MOD(en, 7) + 1;

update teacher set birthday = to_date(en || '/' || (en + 3) ||  '/' || en) where current of cs;
update teacher set salary = dbms_random.value(1, 1000) where current of cs;
end loop;
close cs;
end;

--4. �������� �������������, � ������� ��������� ������ ��������������, ������� �������� � ��������� ������.
create view teachersbirthdayslastmonth as select * from teacher where extract(month from birthday) = extract( month from add_months(sysdate, -1));
select * from teachersbirthdayslastmonth;

--5. �������� �������������, � ������� ��������� ���������� ��������������, ������� �������� � ������ ������.
create view teachersbirthdaysmonths as 
select extract(month from birthday) month, count(extract(month from birthday)) count from teacher group by extract(month from birthday) order by extract(month from birthday);
select * from teachersbirthdaysmonths;

--6. ������� ������ � ������� ������ ��������������, � ������� � ��������� ���� ������.
set serveroutput on
declare
cursor cs is select * from teacher;
bufline teacher%rowtype;
bufdate date ;
begin
open cs;
loop
fetch cs into bufline;
exit when cs%notfound;
bufdate := bufline.birthday;
if mod(extract(year from sysdate) - extract(year from bufdate) + 1, 5) = 0 then
dbms_output.put_line(bufline.teacher_name);
end if;
end loop;
close cs;
end;

--7. ������� ������ � ������� ������� ���������� ����� �� �������� � ����������� ���� �� �����.
declare
cursor cs is select avg(salary), pulpit from teacher group by pulpit;
buffersum number(25, 5);
buffername varchar(200);
begin
open cs;
loop
fetch cs into buffersum, buffername;
exit when cs%notfound;
dbms_output.put_line(trunc(buffersum) || ' ' || buffername);
end loop;
close cs;
end;
