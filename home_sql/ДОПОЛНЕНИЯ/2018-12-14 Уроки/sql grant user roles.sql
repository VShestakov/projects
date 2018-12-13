-- USER 14.12.2018: 
---------------------------------------------------------------
----        grant user roles
---------------------------------------------------------------

-- ИСТОРИЯ ВЕРСИЙ:
-- 14.12.2018 USER - Первая версия 
/*
-- reset 
drop user aaa;
drop role manager;
drop role clerk;
drop role inv;
/**/
---------------------------------------------------------------

create role manager;
create role clerk;
create role inv;

create user aaa identified by 123;
grant inv to clerk;
grant clerk to manager;
grant clerk to aaa;

select *
  from dba_roles
 where 1=1
 order by 1
;/**/ 

select *
  from dba_users u
 where 1=1
 order by 1
;/**/ 

select *
  from user_role_privs
 where 1=1
 order by 1
;/**/ 

select *
  from role_sys_privs
 where 1=1
 order by 1
;/**/ 
select *
  from dba_ROLE_PRIVS r
 where 1=1
 order by 1
;/**/ 

-- Найдем объекты с текстом %role%
select o.owner, o.object_type, o.object_name, o.*                
  from DBA_OBJECTS O 
  --from ALL_OBJECTS O 
 where o.object_name like upper('%role%') --escape '\'
   --and o.object_type in ('TABLE', 'VIEW', 'SYNONYM')
   --and o.object_type not in ('TABLE PARTITION', 'INDEX PARTITION')
   -- Кроме системных схем 
   /*
   and o.owner not in ('ANONYMOUS','APPQOSSYS','AUDSYS','CTXSYS','DBSNMP'
               ,'DEMO','DIP','DVF','DVSYS','EXFSYS','FRANCK','GSMADMIN_INTERNAL'
               ,'GSMCATUSER','GSMUSER','HR','IX','LBACSYS','MDDATA','MDSYS','OE','OJVMSYS'
               ,'OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','PM'
               ,'RMAN','SCOTT','SH','SI_INFORMTN_SCHEMA','SPATIAL_CSW_ADMIN_USR'
               ,'SPATIAL_WFS_ADMIN_USR','SQLTXADMIN','SQLTXPLAIN','SYS','SYSBACKUP'
               ,'SYSDG','SYSKM','SYSMAN','SYSTEM','TSMSYS','WMSYS','XDB','XS$NULL', 'OWBSYS', 'PUBLIC')
       -- Кроме схем APEX
   and (o.owner not like 'APEX_%') and o.owner not in ('FLOWS_FILES')/**/
 order by o.owner, o.object_type, o.object_name
;/**/  
