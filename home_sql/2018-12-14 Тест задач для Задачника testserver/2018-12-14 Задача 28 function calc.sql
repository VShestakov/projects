-- USER 14.12.2018: 
---------------------------------------------------------------
----        Òåñò çàäà÷è 28
---------------------------------------------------------------
-- ÈÑÒÎĞÈß ÂÅĞÑÈÉ:
-- 14.12.2018 USER - Ïåğâàÿ âåğñèÿ 

-- https://testserver.pro/run/test/Oracle-PL-SQL/
-- Âîïğîñ 31


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
select * from scott.emp; 
select * from dual where 1 = 1 and calc(pa => 20, pb => 20) = 20;

select * from dual where 1 = 1 and calc(pb => 20) = 20;


declare
  v_cnt number;
  v_str varchar2(255);
begin
  v_cnt := calc(pb => 20);
  dbms_output.put_line('v_cnt = ' || v_cnt); --< Äëÿ îòëàäêè 
end;
