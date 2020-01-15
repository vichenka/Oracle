--1. Создайте собственный тип PL/SQL-записи (record) и продемонстрируйте работу с ним.
--Продемонстрируйте работу с вложенными записями. Продемонстрируйте и объясните операцию присвоения. 

declare 
rec1 teacher%rowtype;      
type person is record
(
code char(10),
name varchar2(100)
);
rec2 person;        
begin 
select * into rec1 from teacher where teacher.teacher = 'УРБ';
SELECT teacher , teacher_name into rec2 from teacher where teacher = 'ГРМН';
dbms_output.put_line(rec1.teacher|| ' '|| rec1.teacher_name||' ' ||rec1.pulpit);
dbms_output.put_line(rec2.code|| ' ' || rec2.name);
exception
when others then dbms_output.put_line(sqlerrm);
end;

declare 
rec1 teacher%rowtype;
type adress is record
(
  adress1 varchar2(100),
  adress2 varchar2(100),
  adress3 varchar2(100)
);
type person is record
(
  code teacher.teacher%type, 
  name teacher.teacher_name%type,
  homeadress adress
);
rec2 person;
rec3 person;
begin
rec2.code := 'КДА';
rec2.name := 'Ключников Даниил';
rec2.homeadress.adress1 :='РБ';
rec2.homeadress.adress2 :='Минск';
rec2.homeadress.adress3 :='ул. Пушкина,дом Колотушкина';  
rec3 := rec2;
dbms_output.put_line(rec3.code);
dbms_output.put_line(rec3.name);
dbms_output.put_line(rec3.homeadress.adress1);
dbms_output.put_line(rec3.homeadress.adress2);
dbms_output.put_line(rec3.homeadress.adress3);      
exception      
when others then dbms_output.put_line(sqlerrm);
end;

--2. Разработайте локальную процедуру GET_TEACHERS(PCODE TEACHER.PULPIT%TYPE) 
--Процедура должна выводить список преподавателей из таблицы TEACHER (в стандартный серверный вывод), работающих на кафедре заданной кодом в параметре.
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры.

declare 
procedure GET_TEACHERS (x teacher.pulpit%type)
is          
cursor teacher_curs is select *from teacher;    
rec_teacher teacher%rowtype;   
begin 
open teacher_curs;
fetch teacher_curs into rec_teacher;
while (teacher_curs%found)
loop   
IF rec_teacher.pulpit = x
then dbms_output.put_line(' '||regexp_substr(rec_teacher.teacher_name, '[^[:space:]]+', 1, 1 )|| 
                                      ' '||substr(regexp_substr(rec_teacher.teacher_name, '[^[:space:]]+', 1, 2 ),1,1)||'.'|| 
                                      ' '||substr(regexp_substr(rec_teacher.teacher_name, '[^[:space:]]+', 1, 3 ),1,1)||'.'||
                                      ' ' || rec_teacher.pulpit); 
end if;                
fetch teacher_curs into rec_teacher;              
end loop;
close teacher_curs;
end GET_TEACHERS;
begin
dbms_output.put_line(' ');
GET_TEACHERS('ИСиТ');
exception
when others then dbms_output.put_line(sqlerrm);
end;

--3. Разработайте локальную функцию GET_NUM_TEACHERS(PCODE TEACHER.PULPIT%TYPE) RETURN NUMBER
--Функция должна выводить количество преподавателей из таблицы TEACHER, работающих на кафедре заданной кодом в параметре. 
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры.

declare 
function GET_NUM_TEACHERS(selectedPulpit teacher.pulpit%type)
return number
is
--for decalre
teachersCounter number(5):= 0;
begin
select count(*) into teachersCounter from teacher where rtrim(teacher.pulpit) like selectedPulpit;               
return teachersCounter;
end GET_NUM_TEACHERS;
begin                        
dbms_output.put_line('Количество преподавателей = '|| GET_NUM_TEACHERS('ИСиТ')); 
exception
when others then dbms_output.put_line(sqlerrm);
end; 

--4. Разработайте процедуры:
--GET_TEACHERS(FCODE FACULTY.FACULTY%TYPE)
--Процедура должна выводить список преподавателей из таблицы TEACHER (в стандартный серверный вывод), работающих на факультете, заданным кодом в параметре.
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры.

declare 
procedure GET_TEACHERS (x pulpit.faculty%type)
is              
cursor teacher_curs is select teacher.teacher_name, teacher.pulpit , pulpit.faculty from  teacher inner join pulpit
on teacher.pulpit = pulpit.pulpit
where pulpit.faculty = x; 
type person is record
(
name teacher.teacher_name%type,
pulpit teacher.pulpit%type,
faculty KDG.pulpit.faculty%type
);
teacher_mod person;
begin 
open teacher_curs;
fetch teacher_curs into teacher_mod;
while (teacher_curs%found)
loop  
dbms_output.put_line(' '||regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 1 )|| 
                                      ' '||substr(regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 2 ),1,1)||'.'|| 
                                      ' '||substr(regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 3 ),1,1)||'.'||
                                      ' ' || teacher_mod.faculty);               
fetch teacher_curs into teacher_mod;              
end loop;
close teacher_curs;
end GET_TEACHERS;
begin
dbms_output.put_line(' ');
GET_TEACHERS('ТОВ');
exception
when others then dbms_output.put_line(sqlerrm);
end;

--GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE)
--Процедура должна выводить список дисциплин из таблицы SUBJECT, закрепленных за кафедрой, заданной кодом кафедры в параметре.
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры.

declare 
procedure GET_SUBJECTS (some_pulpit subject.pulpit%type)
is              
cursor  subject_curs is select subject.subject, subject.subject_name , subject.pulpit
from  subject
where subject.pulpit = some_pulpit; 
type my_subject is record
(
  name subject.subject%type,
  subject_name subject.subject_name%type,
  subject_pulpit subject.pulpit%type
);
subject_mod my_subject;
begin 
open subject_curs;
fetch subject_curs into subject_mod;
while (subject_curs%found)
loop  
dbms_output.put_line(' '||subject_mod.name || ' ' ||subject_mod.subject_pulpit);               
fetch subject_curs into subject_mod;              
end loop;
close subject_curs;
end GET_SUBJECTS;
begin
dbms_output.put_line(' ');
GET_SUBJECTS('ИСиТ');
exception
when others then dbms_output.put_line(sqlerrm);
end;

--5. Разработайте локальную функцию^

--5.1 GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE) RETURN NUMBER
--Функция должна выводить количество преподавателей из таблицы TEACHER, работающих на факультете, заданным кодом в параметре.
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры.

declare 
teacher_faculty pulpit.faculty%type;
function GET_NUM_TEACHERS(selected_faculty pulpit.faculty%type)
return number
is
teachersCounter number(5):= 0;
begin
select count(*) into teachersCounter
from teacher inner join pulpit
on teacher.pulpit = pulpit.pulpit
where rtrim(pulpit.faculty) like selected_faculty;  
return teachersCounter;
end GET_NUM_TEACHERS;
begin
teacher_faculty := 'ТОВ';                     
dbms_output.put_line('Количество преподавателей на факультете '
                                ||rtrim(teacher_faculty)||' = '
                                || GET_NUM_TEACHERS(rtrim(teacher_faculty)));
         
exception
when others then dbms_output.put_line(sqlerrm);
end; 

--5.2 GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) RETURN NUMBER 
--Функция должна выводить количество дисциплин из таблицы SUBJECT, закрепленных за кафедрой, заданной кодом кафедры параметре.
--Разработайте анонимный блок и продемонстрируйте выполнение процедуры. 

declare 
subject_pulpit subject.pulpit%type;
function GET_NUM_SUBJECTS(selected_pulpit subject.pulpit%type)
return number
is
--for decalre
subjectCounter number(5):= 0;
begin
select count(*) into subjectCounter
from subject
where subject.pulpit = selected_pulpit;  
                 
return subjectCounter;
end GET_NUM_SUBJECTS;
begin
subject_pulpit := 'ИСиТ';                     
dbms_output.put_line('Кол. предметов на кафедре '
                                ||rtrim(subject_pulpit)||' is = '
                                || GET_NUM_SUBJECTS(rtrim(subject_pulpit)));
         
exception
when others then dbms_output.put_line(sqlerrm);
end; 

--6. Разработайте пакет TEACHERS, содержащий процедуры и функции:
--GET_TEACHERS(FCODE FACULTY.FACULTY%TYPE)
--GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE)
--GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE) RETURN NUMBER GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) RETURN NUMBER 
         
--PackageIsHere
create or replace 
package saa_package as          
procedure GET_TEACHERS (x pulpit.faculty%type);
procedure GET_SUBJECTS (some_pulpit subject.pulpit%type);
function GET_NUM_TEACHERS(selectedPulpit teacher.pulpit%type) return number ;
function GET_NUM_SUBJECTS(selected_subject subject.pulpit%type) return number;
end saa_package;
           
create or replace package body saa_package as
------------------------------------------------
procedure GET_TEACHERS (x pulpit.faculty%type)
is              
cursor teacher_curs is select teacher.teacher_name, teacher.pulpit , pulpit.faculty
from teacher inner join pulpit
on teacher.pulpit = pulpit.pulpit
where pulpit.faculty = x;   
     
type person is record
(
name teacher.teacher_name%type,
pulpit teacher.pulpit%type,
faculty KDA.PULPIT.faculty%type
);
      
teacher_mod person;
begin 
open teacher_curs;
fetch teacher_curs into teacher_mod;
while (teacher_curs%found)
loop  
dbms_output.put_line(' '||regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 1 )|| 
                                      ' '||substr(regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 2 ),1,1)||'.'|| 
                                      ' '||substr(regexp_substr(teacher_mod.name, '[^[:space:]]+', 1, 3 ),1,1)||'.'||
                                      ' ' || teacher_mod.faculty);               
fetch teacher_curs into teacher_mod;              
end loop;
close teacher_curs;
end GET_TEACHERS;
--------------------------------------------------------------------
procedure GET_SUBJECTS (some_pulpit subject.pulpit%type)
is              
cursor subject_curs is select subject.subject, subject.subject_name , subject.pulpit
from subject
where subject.pulpit = some_pulpit;
        
type my_subject is record
(
  name subject.subject%type,
  subject_name subject.subject_name%type,
  subject_pulpit subject.pulpit%type
);
subject_mod my_subject;

begin 
open subject_curs;
fetch subject_curs into subject_mod;
while (subject_curs%found)
loop  
dbms_output.put_line(' '||subject_mod.name || ' ' ||subject_mod.subject_pulpit);               
fetch subject_curs into subject_mod;              
end loop;
close subject_curs;
end GET_SUBJECTS;
--------------------------------------------------------------------
function GET_NUM_TEACHERS(selectedPulpit teacher.pulpit%type)
return number
is
--for decalre
teachersCounter number(5):= 0;
begin
select count(*) into teachersCounter from teacher where rtrim(teacher.pulpit) like selectedPulpit;               
return teachersCounter;
end GET_NUM_TEACHERS;
--------------------------------------------------------------------
function GET_NUM_SUBJECTS(selected_subject subject.pulpit%type)
return number
is
--for declare
subjectCounter number(5):= 0;
begin
select count(*) into subjectCounter
from subject
where subject.pulpit = selected_subject;     
return subjectCounter;
end GET_NUM_SUBJECTS;
--------------------------------------------------------------------
end saa_package;
--7
declare 
my_num number;
begin
saa_package.GET_SUBJECTS ('ИСиТ');
saa_package.GET_TEACHERS ('ТОВ');
dbms_output.put_line('GET_NUM_TEACHERS = '||saa_package.GET_NUM_TEACHERS('ИСиТ'));
dbms_output.put_line('GET_NUM_SUBJECTS = '||saa_package.GET_NUM_SUBJECTS('ИСиТ'));
end;