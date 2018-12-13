-- USER 14.12.2018: 
---------------------------------------------------------------
----        grants on schema
---------------------------------------------------------------
-- Применимость БД: ???
--
-- ПАРАМЕТРЫ ЗАПУСКА:
--   v_dummy         - Код документа. Пример: 12323
--   RETURNS         - XML в CLOB

--
-- ИСТОРИЯ ВЕРСИЙ:
-- 14.12.2018 USER - Первая версия 

GRANT select, insert, delete ON scott.emp TO VSHESTAKOV;
grant all on scott.emp to vshestakov;
grant all on SCOTT.DEPT TO VSHESTAKOV;
revoke all on scott.DEPT from vshestakov;
select any table to vshestakov;

select o.owner || '.' || o.table_name as tname
      ,o.owner, o.table_name --< для отладки
  from ALL_TABLES o
 where o.owner = 'SCOTT'
;/**/ 

declare 
  v_cnt  number; 
  v_user varchar2(255) := 'VSHESTAKOV'; 
  v_sql  varchar2(4000);
begin

  -- Выдача прав на все таблицы схемы пользователю
  for rec in (-- Все таблицы схемы
            select o.owner || '.' || o.table_name as tname
                  ,o.owner, o.table_name --< для отладки
              from ALL_TABLES o
             where o.owner = 'SCOTT'
            )
  loop
    v_sql := 'grant all on :1 TO :2;';
    execute immediate v_sql using rec.tname, v_user;
    dbms_output.put_line(replace(replace(v_sql, ':1', rec.tname), ':2', v_user)); --< Для отладки 
  end loop;  
end; 
