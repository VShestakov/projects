-- USER 14.12.2018: 
---------------------------------------------------------------
----        Тест задачи 28
---------------------------------------------------------------
-- ИСТОРИЯ ВЕРСИЙ:
-- 14.12.2018 USER - Первая версия 

-- https://testserver.pro/run/test/Oracle-PL-SQL/
-- На Вопрос 28
-- 2 правильных ответа 1 и 3


select * from v$version;
/* 
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
PL/SQL Release 11.2.0.1.0 - Production
 /**/
 
 
drop function calculate;
/
create or replace function calculate(
  p_days    number default 20,
  p_per_day number 
) return number is
begin
  return p_days * p_per_day;
end;
/

-- Верный ответ из 1 варианта
select e.ename
  from scott.emp e
 where e.sal = calculate(p_per_day => 40);
/* 
ENAME
SMITH
/**/  

-- Верный ответ из 3 варианта
/*
begin
  
  delete from scott.EMP e
   where e.sal = CALCULATE(20, 40);  
   
  dbms_output.put_line('sql%rowcount = ' || sql%rowcount); --< Для отладки
  
end; 

-- sql%rowcount = 1
/**/

 
select * from dual where 1 = 1 and calc(pa => 20, pb => 20) = 20;

select * from dual where 1 = 1 and calc(pb => 20) = 20;


declare
  v_cnt number;
  v_str varchar2(255);
begin
  v_cnt := calc(pb => 20);
  dbms_output.put_line('v_cnt = ' || v_cnt); --< Для отладки 
end;
