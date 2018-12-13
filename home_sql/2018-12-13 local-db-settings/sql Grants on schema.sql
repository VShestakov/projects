-- USER 14.12.2018: 
---------------------------------------------------------------
----        grants on schema
---------------------------------------------------------------

-- ������� ������:
-- 14.12.2018 USER - ������ ������ 


-- -- Grant/Revoke object privileges 
grant all on scott.emp to vshestakov;
grant select, insert, update, delete, references, alter, index, debug on scott.emp to vshestakov;
revoke all on scott.dept from vshestakov;

--select any table to vshestakov;

-- grant privelege
begin
  -- ������ ���� �� ��� ������� ����� ������������
  for rec in (
    select 'grant all on ' || o.owner || '.' || o.table_name || ' TO VSHESTAKOV' as s
           --'revoke all on ' || o.owner || '.' || o.table_name || ' from VSHESTAKOV' as s
      from ALL_TABLES o where o.owner = 'SCOTT'
  ) loop
    execute immediate rec.s;
    dbms_output.put_line(rec.s); --< ��� ������� 
  end loop;  
end; 
