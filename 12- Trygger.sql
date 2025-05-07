-- ejemplo de trigger capturando informacion

----------------- INSERT ---------------------------
/
create or replace TRIGGER tr_dept_before_insert
before insert
on dept
for each row
declare 
begin
    dbms_output.put_line('trigger dept before insert row');
    dbms_output.put_line(:new.dept_no ||', ' || :new.dnombre || ', ' || :new.loc);
end;
/
insert into dept values (111, 'nuevo', 'toledo');

----------------- DELETE ---------------------------
/
create or replace TRIGGER tr_dept_before_delete
before delete
on dept
for each row
declare 
begin
    dbms_output.put_line('trigger dept before delete row');
    dbms_output.put_line(:old.dept_no ||', ' || :old.dnombre || ', ' || :old.loc);
end;
/
delete from dept where dept_no = 111;
/
select * from dept;
rollback;
/

----------------- UPDATE ---------------------------
/
create or replace TRIGGER tr_dept_before_UPDATE
before update
on dept
for each row
declare 
begin
    dbms_output.put_line('trigger dept before update row');
    dbms_output.put_line(:old.dept_no ||', Antigua loc ' || :old.loc || ', Nueva loc ' || :new.loc);
end;
/
update dept set loc = 'GRANADA' where dept_no = 40;

-- trigger control doctor
create or replace trigger tr_doctor_control_salario_update
before update
on doctor
for each row
    when (new.salario > 250000)
declare

begin
    dbms_output.put_line('trigger dept before update row');
    dbms_output.put_line('Dr/Dra: ' || :old.apellido ||', cobra mucho dinero ' || :new.salario || ', antiguo salario ' || :old.salario);
end;
/
update doctor set salario = 150000 where doctor_no = 386;

-- NO PODEMOS TENER DOS TRIGGER DEL MISMO TIPO EN UNA TABLA
/
create or replace TRIGGER tr_dept_control_barcelona
before insert
on dept
for each row
    when (upper(new.loc) = 'BARCELONA')
declare 
begin
    dbms_output.put_line('trigger control barcelona');
        dbms_output.put_line('No se admiten deparatamentos en barcelona');
        RAISE_APPLICATION_ERROR(-20001, 'EN Munich solo ganadores');
end;
/
insert into dept values (5, 'MILAN', 'BARCELONA');

/
create or replace TRIGGER tr_dept_control_localidades
before insert
on dept
for each row
declare 
    v_num number;
begin
    dbms_output.put_line('trigger control localidades');
    select count (dept_no) into v_num from dept where upper(loc) = upper (:new.loc);
        if (v_num > 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Solo un departamento por ciudad ' || :new.loc);
        end if;
end;
/
insert into dept values (6, 'MILAN', 'TERUEL');
select * from dept;