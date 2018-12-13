-- USER 14.12.2018: 
---------------------------------------------------------------
----        ���� ������ 28
---------------------------------------------------------------
-- ������� ������:
-- 14.12.2018 USER - ������ ������ 

-- https://testserver.pro/run/test/Oracle-PL-SQL/
-- �� ������ 28
-- 2 ���������� ������ 1 � 3


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

-- ������ ����� �� 1 ��������
select e.ename
  from scott.emp e
 where e.sal = calculate(p_per_day => 40);
/* 
ENAME
SMITH
/**/  

-- ������ ����� �� 3 ��������
/*
begin
  
  delete from scott.EMP e
   where e.sal = CALCULATE(20, 40);  
   
  dbms_output.put_line('sql%rowcount = ' || sql%rowcount); --< ��� �������
  
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
  dbms_output.put_line('v_cnt = ' || v_cnt); --< ��� ������� 
end;
