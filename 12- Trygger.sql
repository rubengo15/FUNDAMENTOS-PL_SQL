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


/
create or replace trigger tr_update_dept_cascade
before update
on dept
for each row
declare
begin
    dbms_output.put_line('Dept_no cambiando');
    -- modificamos los datos asociados (emp)
    update emp set dept_no = :new.dept_no where dept_no = :old.dept_no;
end;
/
select * from dept;

-- Impedir insertar un nuevo presidente si ya existe uno en la tabla emp
/
create or replace trigger tr_presidentes_control
before insert
on emp
for each row    
    when (upper(new.oficio) = 'PRESIDENTE')
declare
    v_presidentes number;
begin
    select count (emp_no) into v_presidentes from emp where upper (oficio) = 'PRESIDENTE';
    dbms_output.put_line('presidentes hay ' || v_presidentes);
    IF (v_presidentes > 0) then
    RAISE_APPLICATION_ERROR(-20001, 'existe mas de un presi');
    end if;
end;
/
drop trigger tr_dept_control_localidades_row;
/
select * from emp;

----------------------------------------------------------------------------------------------------
-- No quiero que exista mas de una localidad si hacemos un update
-- Package para almacenar las variables entre triggers
/
create or replace package pk_triggers
as
    v_nueva_localidad dept.loc%type;
end pk_triggers;
/
-- Almacenamos el nuevo valor de la localidad en un trigger
/
create or replace TRIGGER tr_dept_control_localidades_row
before update -- Vamos a comprobar antes de update
on dept
for each row
declare 
begin
    --Almacenamos el valor de la nueva localidad
    pk_triggers.v_nueva_localidad := :new.loc;
end;
/
-- Creamos el nuevo trigger para juntar todo
/
create or replace TRIGGER tr_dept_control_localidades_after
after update
on dept
declare 
    v_numero number;
begin
    select count(dept_no) into v_numero from dept where upper (loc) = upper (pk_triggers.v_nueva_localidad);
    if (v_numero > 0) then
        RAISE_APPLICATION_ERROR(-20001, 'Solo un departamento por localidad');
    end if; 
    dbms_output.put_line('Localidad nueva: ' || pk_triggers.v_nueva_localidad);
end;
/
update dept set loc = 'CADIZ' where dept_no = 5;
select * from dept;


-----------------------------------------------------------------------------------------------------------
--Creamos una vista con todos los datos de un departamento
/
create or replace view vista_departamentos
as
    SELECT * from dept;
/
select * from vista_departamentos;
insert into vista_departamentos values (11, 'vista', 'con trigger');
--Creamos un trigger sobre la vista
/
create or replace trigger tr_vista_dept
instead of insert
on vista_departamentos
declare
begin
    dbms_output.put_line('Insertando en Vista dept');
end;
/

------------------------------------------------------------------------------------------------------------

-- Vamos a crear una vista con los datos de los empleados pero sin sus datos sensibles (salario, comision y fecha alt)
select * from emp;
/
create or replace view vista_empleados
as
    select emp_no, apellido, oficio, dir, dept_no from emp;
/
select *  from vista_empleados;
/
insert into vista_empleados values (556, 'el nuevo', 'BECARIO 2', 7567, 30);
/
-- Vamos a crear un trigger rellenando los huecos que quedan al añadir una fila en una vista
create or replace trigger tr_vista_empleados
instead of insert
on vista_empleados
declare
begin
    -- Con :new capturamos los datos que vienen en la vista y rellenamos el resto
    insert into emp values (:new.emp_no, :new.apellido, :new.oficio, :new.dir, sysdate, 0, 0, :new.dept_no);
end;
/

-----------------------------------------------------------------------------------------------------
-- Vamos a crear una vista para mostrar los doctores
create or replace view vista_doctores
as
    select doctor.doctor_no, doctor.apellido, doctor.especialidad, doctor.salario, hospital.nombre from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod;
/
select * from vista_doctores;
/
insert into vista_doctores values (557, 'nuevo 3', 'especialista', 20, 'la paz');
/
create or replace trigger tr_vista_doctores
instead of insert
on vista_doctores
declare 
    v_hospital hospital.hospital_cod%type;
begin
    select hospital_cod into v_hospital from hospital where upper(nombre) = upper (:new.nombre);
    insert into doctor values (v_hospital, :new.doctor_no, :new.apellido, :new.especialidad, :new.salario);
end;
/
select * from doctor;
