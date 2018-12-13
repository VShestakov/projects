-- USER 14.12.2018: 
---------------------------------------------------------------
----        Тест задачи 31
---------------------------------------------------------------
-- ИСТОРИЯ ВЕРСИЙ:
-- 14.12.2018 USER - Первая версия 

-- https://testserver.pro/run/test/Oracle-PL-SQL/
-- Вопрос 31


select * from v$version;
/* 
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
PL/SQL Release 11.2.0.1.0 - Production
 /**/
 
drop sequence aaa_seq;

create sequence aaa_seq
start with 1000
increment by 5
cache 5;

select aaa_seq.nextval from dual; 
select aaa_seq.currval from dual; 
select aaa_seq.nextval from dual; 
select aaa_seq.nextval + 25 from dual; 


select aaa_seq.nextval from dual; 

/*  
NEXTVAL
1015

/**/
