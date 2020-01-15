CREATE TABLE FACULTY
  (
   FACULTY      CHAR(10)      NOT NULL,
   FACULTY_NAME VARCHAR2(50), 
   CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
  );
     
insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('����',   '����������� ���� � ����������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '��������� �������������� ����������');

--------------------------------------------------------------------------------------------
-- DROP TABLE PULPIT
CREATE TABLE PULPIT 
(
 PULPIT       CHAR(10)      NOT NULL,
 PULPIT_NAME  VARCHAR2(100), 
 FACULTY      CHAR(10)      NOT NULL, 
 CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY(FACULTY)   REFERENCES FACULTY(FACULTY), 
 CONSTRAINT PK_PULPIT PRIMARY KEY(PULPIT) 
 ); 
 
delete PULPIT;  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('����',    '������������� ������ � ���������� ',                         '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('������', '���������������� ������������ � ������ ��������� ���������� ', '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('��',      '�����������',                                                 '���') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '������������',                                                 '���') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '��������������',                                              '���');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',   '���������� � ����������������',                               '���');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('������',  '������������ �������������� � ������-��������� �������������','���');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '���������� ����',                                              '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',  '������ ����� � ���������� �������������',                      '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '������������ �����',                                           '���');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('��������','���������� ���������������� ������� � ����������� ���������� ����������','���');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('��������','�����, ���������� ����������������� ����������� � ���������� ����������� �������', '����');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',    '������������� ������ � ����������',                              '���');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',   '����������� � ��������� ������������������',                      '���');    
------------------------------------------------------------------------------------------------------------------------        - DROP  TABLE TEACHER
CREATE TABLE TEACHER
 ( 
  TEACHER       CHAR(10) NOT  NULL,
  TEACHER_NAME  VARCHAR2(50), 
  PULPIT        CHAR(10) NOT NULL, 
  BIRTHDAY      DATE,
  SALARY        NUMBER(5),
  CONSTRAINT PK_TEACHER  PRIMARY KEY(TEACHER), 
  CONSTRAINT FK_TEACHER_PULPIT FOREIGN   KEY(PULPIT)   REFERENCES PULPIT(PULPIT)
 ) ;
 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',    '������ �������� �������������',  '����','03.07.1960',1000);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',    '�������� ��������� ��������',  '����','04.07.1961',600);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',    '���������� ������ ����������', '����','05.08.1955',500);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',    '������ ���� �����������', '����','06.05.1961',550);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',    '������� �������� ��������',  '����','01.08.1963',620);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',    '�������� ������ ���������',  '����','03.03.1971',480);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',     '����� ��������� ����������',  '����','11.09.1965',490);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',     '������� ��������� �����������',  '����','13.02.1960',530);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',     '��������� ����� ��������',  '����','21.04.1964',710);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',     '��������� ������� ����������',  '����','17.07.1973',670);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',  '����������� ������� ����������', '����' ,'13.10.1968',460);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                      values  ('���',     '����� ������� ��������',  '����','23.11.1963',580);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',     '����� ������� �������������',  '����','12.01.1980',490);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',   '���������� ��������� �������������',  '������','09.04.1972',390);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',   '������� ������ ����������',  '������','17.02.1974',380);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',   '����������� ��������� ��������',  '����','21.01.1982',440);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',   '������� ��������� ����������',  '����', '26.10.1975',430);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',   '������ ������ ��������',  '��','19.02.1973',395);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����', '������� ������ ����������',  '������','26.12.1978',320);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',   '���������� �������� ��������',  '��','23.10.1974',750);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',   '������ ���������� ������������',  '��','28.03.1968',630);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',   '��������� �������� ���������',  '�����','26.11.1974',410); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',   '���������� �������� ����������',  '��','05.05.1972',610); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('������',   '��������� ������� ���������',  '��������','07.08.1968',630); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('�����',   '�������� ������ ����������',  '��','12.08.1969',465); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('���',   '����� ������ ��������',  '�����','18.10.1973',345); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',   '������ ������� ���������',  '�������','28.07.1972',415); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('����',   '������� ���� ����������',  '��������','13.04.1955',860); 
---------------------------------------------------------------------------------------------------------------------
CREATE TABLE SUBJECT
    (
     SUBJECT      CHAR(10)     NOT NULL, 
     SUBJECT_NAME VARCHAR2(50)  NOT NULL,
     PULPIT       CHAR(10)     NOT NULL,  
     CONSTRAINT PK_SUBJECT PRIMARY KEY(SUBJECT),
     CONSTRAINT FK_SUBJECT_PULPIT FOREIGN  KEY(PULPIT)  REFERENCES PULPIT(PULPIT)
    );


insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '������� ���������� ������ ������',                   '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('��',     '���� ������',                                        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '�������������� ����������',                          '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',  '������ �������������� � ����������������',            '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������',       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '��������������� ������� ����������',                 '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',     '������������� ������ ��������� ����������',        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '�������������� �������������� ������',              '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',      '������������ ��������� ',                           '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�����',   '��������������� ������, �������� � �������� �����', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '������������ �������������� �������',               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '����������� ���������������� ������������',         '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('��',   '���������� ���������',                     '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('��',   '�������������� ����������������',          '����');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('����', '���������� ������ ���',                     '����');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '��������� ������������������',                       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������',                               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.',      '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�������','������ ��������������� � ������������� ���������',  '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '���������� �������� ',                              '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '�����������',                                        '�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '������������ �����',                                 '��');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ��������� �������',                      '��������'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '������ ��������� ����',                             '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� � ������������ �������������',           '�����'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ',        '�������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ������������',                           '��������');          
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE 
create table AUDITORIUM_TYPE 
(
  AUDITORIUM_TYPE   char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
  AUDITORIUM_TYPENAME  varchar2(30) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
);

delete AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��',   '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�',   '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�', '���������� � ���. ������������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-X', '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-��', '����. ������������ �����');
---------------------------------------------------------------------------------------------------------------------

create table AUDITORIUM 
(
 AUDITORIUM           char(10) primary key,  -- ��� ���������
 AUDITORIUM_NAME      varchar2(200),          -- ��������� 
 AUDITORIUM_CAPACITY  number(4),              -- �����������
 AUDITORIUM_TYPE      char(10) not null      -- ��� ���������
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
);

delete  AUDITORIUM;
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', '��',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', '��-�',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02�-4',   '02�-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', '��',  90);
                        
                        
/*1*/
begin
null;
end;

/*2*/
begin
DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

/*3*/
declare 
x number(3) :=3;
y number(3) :=0;
z number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
z := x/y;
DBMS_OUTPUT.PUT_LINE('z= '||z);
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error = ' || sqlerrm);
end;

/*4*/
declare 
x number(3) :=3;
y number(3) :=0;
z number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE( 'x= ' ||x||', y='||y );
begin
z := x/y;
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error = ' || sqlerrm);
end;
DBMS_OUTPUT.PUT_LINE('z = '||z);
end;

/*5*/
show parameter plsql_warnings;

/*6*/
select keyword from v$reserved_words where length = 1 and keyword !='A'

/*7*/
select keyword from v$reserved_words where length > 1 and keyword != 'A' order by keyword

/*8*/
show parameter plsql

/*10*/
declare 
x number(3) :=3;
y number(3) :=10;
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
end;

/*11*/
declare 
x number(3) :=10;
y number(3) :=3;
z number(10,2);
b number(10,2);
d number(10,2);
g number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
b :=x+y;
d :=x-y;
g :=x*y;
z := x/y;
DBMS_OUTPUT.PUT_LINE('b= '||b);
DBMS_OUTPUT.PUT_LINE('d= '||d);
DBMS_OUTPUT.PUT_LINE('g= '||g);
DBMS_OUTPUT.PUT_LINE('z= '||z);
end;

/*12*/
declare 
n1 number(20,11) :=123456789.12345678911;
n2 number(20,10) :=123456789.12345678911;
n3 number(20) :=123456789.12345678911;
n4 number(20,-1) :=123456789.12345678911;
n5 number(20,-2) :=123456789.12345678911;
n6 number(20,-21) :=123456789.12345678911;
n7 number(20,-25) :=123456789.12345678911;
n8 number(20,-83) :=123456789.12345678911;
n9 number(20,-7) :=0.12345678911;
n10 number(38,10) :=123456789.12345678911;
n11 number(38,10) :=123456789E-12;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
DBMS_OUTPUT.PUT_LINE('n5= '||n5);
DBMS_OUTPUT.PUT_LINE('n6= '||n6);
DBMS_OUTPUT.PUT_LINE('n7= '||n7);
DBMS_OUTPUT.PUT_LINE('n8= '||n8);
DBMS_OUTPUT.PUT_LINE('n9= '||n9);
DBMS_OUTPUT.PUT_LINE('n10= '||n10);
DBMS_OUTPUT.PUT_LINE('n11= '||n11);
end;

/*13*/
declare 
n1 number(20,-1) :=123456789.12345678911;
n2 number(20,-2) :=123456789.12345678911;
n3 number(20,-21) :=123456789.12345678911;
n4 number(20,-25) :=123456789.12345678911;
n5 number(20,-83) :=123456789.12345678911;
n6 number(20,-7) :=0.12345678911;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
DBMS_OUTPUT.PUT_LINE('n5= '||n5);
DBMS_OUTPUT.PUT_LINE('n6= '||n6);
end;

/*14*/
declare 
n1 binary_float := 123456789.12345678911;
n2 binary_float := 123456.12345678911;
begin
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
end;

/*15*/
declare 
n1 binary_double := 123456789.12345678911;
n2 binary_double := 123456.12345678911;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
end;

/*16*/
declare
n1 number(20,4) :=123456789.12345678911;
n2 number(20,3) :=123456789.12345678911;
n3 number(38,10) :=123456789E-12;
n4 number(38,10) :=1234567E+10;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
end;

/*17*/
declare 
b1 boolean := true;
b2 boolean := false;
b3 boolean;
begin 
if b1 then DBMS_OUTPUT.PUT_LINE('b1= '||'true'); end if;
if not b2  then DBMS_OUTPUT.PUT_LINE('b2= '||'false'); end if; 
if b3 is null then DBMS_OUTPUT.PUT_LINE('b3= '||'null'); end if;
end;

/*18*/
declare 
n1 constant number(5) :=5;
v1 constant varchar2(25 char) :='dadasda';
c1 constant char(5) := 'dasda';
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
/*v1:= 'fdsfsd'; n1:=10; c1:='dasd'; cun;t*/
DBMS_OUTPUT.PUT_LINE('v1= '||v1);
DBMS_OUTPUT.PUT_LINE('c1= '||c1);
END;

/*19-20*/
declare 
subject system.subject.subject%type;
pulpit system.pulpit.pulpit%type;
faculty_rec system.faculty%rowtype;
begin
subject :='���';
pulpit :='����';
faculty_rec.faculty :='����';
faculty_rec.faculty_name := '��������� ������������� ���� � ����������';
DBMS_OUTPUT.PUT_LINE(subject);
DBMS_OUTPUT.PUT_LINE(pulpit);
DBMS_OUTPUT.PUT_LINE(rtrim(faculty_rec.faculty)||':'||faculty_rec.faculty_name);
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error= '|| sqlerrm);
end;

/*21*/
declare x pls_integer :=17;
begin
if 8>x then DBMS_OUTPUT.PUT_LINE('8> '||x);
end if;
----------------
if 8>x
then DBMS_OUTPUT.PUT_LINE('8> '||x);
else
DBMS_OUTPUT.PUT_LINE('8 <= '||x);
end if;
---------------
if 8>x
then DBMS_OUTPUT.PUT_LINE('8> '||x);
else if 8=x
then DBMS_OUTPUT.PUT_LINE('8 = '||x);
else if 12 > x
then DBMS_OUTPUT.PUT_LINE('12> '||x);
else if 12 = x
then DBMS_OUTPUT.PUT_LINE('12= '||x);
else 
DBMS_OUTPUT.PUT_LINE('12< '||x);
end if; 
end;

/*22*/
declare 
x pls_integer :=17;
begin

case x
  when 1 then DBMS_OUTPUT.PUT_LINE('1');
  when 2 then DBMS_OUTPUT.PUT_LINE('2');
  when 3 then DBMS_OUTPUT.PUT_LINE('3');
  else DBMS_OUTPUT.PUT_LINE('else');
  end case;
  --------------------------------------
case 
    when 8 > x then DBMS_OUTPUT.PUT_LINE('8> '||x);
    when 8 = x then DBMS_OUTPUT.PUT_LINE('8 = '||x);
    when 12 = x then DBMS_OUTPUT.PUT_LINE('12 = '||x);
    when x between 13 and 20 then DBMS_OUTPUT.PUT_LINE('12 <= '||x||' <=20');
    else DBMS_OUTPUT.PUT_LINE('else');
end case;
-----------------------------------------
end;

/*23-25*/
declare
  x pls_integer :=0;
begin
-------------
  loop 
  x := x+1;
  DBMS_OUTPUT.PUT_LINE(x);
  exit when x>5;
  end loop;
  -----------
  for k in 1..5
  loop 
  DBMS_OUTPUT.PUT_LINE(k);
  end loop;
  ---------------
  while (x>0)
  loop
  x:=x-1;
  DBMS_OUTPUT.PUT_LINE(x);
  end loop;
  -----------------
  end;