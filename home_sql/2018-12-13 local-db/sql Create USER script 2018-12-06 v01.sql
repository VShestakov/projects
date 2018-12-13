---------------------------------------------------------------
----               Create USER script
---------------------------------------------------------------

-- Создаем табличное пространство
create tablespace tbs_oper
  datafile 'TBS_OPER.dat' 
    size 10m
    reuse
    autoextend on next 10m maxsize 200m;
    
-- Создаем пользователя    
create user VSHESTAKOV identified by 12321
default tablespace TBS_OPER 
temporary tablespace TEMP;

grant unlimited tablespace to VSHESTAKOV;

-- Гранты
grant create session to VSHESTAKOV
/
grant create table to VSHESTAKOV
/
grant create procedure to VSHESTAKOV
/
grant create trigger to VSHESTAKOV
/
grant create view to VSHESTAKOV
/
grant create sequence to VSHESTAKOV
/

grant alter any table to vshestakov
/
grant alter any procedure to vshestakov
/
grant alter any trigger to vshestakov
/
grant alter profile to vshestakov
/
grant delete any table to VSHESTAKOV  
/
grant drop any table to VSHESTAKOV
/
grant drop any procedure to VSHESTAKOV
/
grant drop any trigger to VSHESTAKOV
/
grant drop any view to VSHESTAKOV
/
grant drop profile to VSHESTAKOV
/
