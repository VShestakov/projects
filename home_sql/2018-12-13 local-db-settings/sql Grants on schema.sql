-- USER 14.12.2018: 
---------------------------------------------------------------
----        grants on schema
---------------------------------------------------------------

-- ИСТОРИЯ ВЕРСИЙ:
-- 14.12.2018 USER - Первая версия 

---------------------------------------------------------------
----                  links
---------------------------------------------------------------
/* 
How to Create a User and Grant Permissions in Oracle
  https://chartio.com/resources/tutorials/how-to-create-a-user-and-grant-permissions-in-oracle/
  
	
Create tablespace in Oracle
  http://www.adp-gmbh.ch/ora/sql/create_tablespace.html  
  
  
 /**/

---------------------------------------------------------------
----                  SQLs
---------------------------------------------------------------

-- -- Grant/Revoke object privileges 
grant all on scott.emp to vshestakov;
grant select, insert, update, delete, references, alter, index, debug on scott.emp to vshestakov;
revoke all on scott.dept from vshestakov;

--select any table to vshestakov;

-- grant privelege
begin
  -- Выдача прав на все таблицы схемы пользователю
  for rec in (
    select 'grant all on ' || o.owner || '.' || o.table_name || ' TO VSHESTAKOV' as s
           --'revoke all on ' || o.owner || '.' || o.table_name || ' from VSHESTAKOV' as s
      from ALL_TABLES o where o.owner = 'SCOTT'
  ) loop
    execute immediate rec.s;
    dbms_output.put_line(rec.s); --< Для отладки 
  end loop;  
end; 
