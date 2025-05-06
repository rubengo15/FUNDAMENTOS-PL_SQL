--EJEMPLO PROCEDIMIENTO PARA MOSTRAR UN MENSAJE
--STORED PROCEDURE
create or replace procedure sp_mensaje
as
begin
    --MOSTRAMOS UN MENSAJE
    dbms_output.put_line('Hoy es juernes con música!!!');
end;
--LLAMADA AL PROCEDIMIENTO
begin
    sp_mensaje;
end;
exec sp_mensaje;
--CREAMOS EL PROCEDIMIENTO
create or replace procedure sp_ejemplo_plsql
as
begin
    --procedimiento con bloque pl/sql
    declare
        v_numero number;
    begin 
        v_numero := 14;
        if v_numero > 0 then
            dbms_output.put_line('Positivo');
        else 
            dbms_output.put_line('Negativo');
        end if;
    end;
end;
--LLAMADA
begin
    sp_ejemplo_plsql;
end;
--TENEMOS OTRA SINTAXIS PARA TENER VARIABLES
--DENTRO DE UN PROCEDIMIENTO.
--NO SE UTILIZA LA PALABRA declare
create or replace procedure sp_ejemplo_plsql2
AS
    v_numero number := 14;
begin
    if v_numero > 0 then
        dbms_output.put_line('Positivo');
    else 
        dbms_output.put_line('Negativo');
    end if;    
end;
begin
    sp_ejemplo_plsql2;
end;
--PROCEDIMIENTO PARA SUMAR DOS NUMEROS
create or replace procedure sp_sumar_numeros
(p_numero1 number, p_numero2 number)
as
    v_suma number;
begin
    v_suma := p_numero1 + p_numero2;
    dbms_output.put_line('La suma de ' || p_numero1 
    || ' + ' || p_numero2 || ' es igual a ' || v_suma);
end;
---llamada al procedimiento
begin
    sp_sumar_numeros(5, 6);
end;
--NECESITO UN PROCEDIMIENTO PARA DIVIDIR DOS NUMEROS
--SE LLAMARA sp_dividir_numeros
create or replace procedure sp_dividir_numeros
(p_numero1 number, p_numero2 number)
as
begin
    declare
        v_division number;
    begin
        v_division := p_numero1 / p_numero2;
        dbms_output.put_line('La división entre ' || p_numero1 
        || ' y ' || p_numero2 || ' es igual a ' || v_division);        
    EXCEPTION
        when ZERO_DIVIDE then
            dbms_output.PUT_LINE('División entre cero. PL/SQL inner');
    end;
exception
    when ZERO_DIVIDE then
        dbms_output.put_line('División entre cero PROCEDURE');
end;

declare 
    v_dato number;
begin
    v_dato := 7/0;
    sp_dividir_numeros(7, 0);
EXCEPTION
    when ZERO_DIVIDE then
        dbms_output.put_line('División entre cero, PL/SQL outer');
end;

-- Realizar un procedimiento para insertar un nuevo departamento
/
create or replace PROCEDURE sp_insertardepartamento
(p_id dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
AS
BEGIN
    insert into dept values (p_id, p_nombre, p_localidad);
    -- normalmente dentro de los procedimientos de accion se incluye (commit o rollback) si diera una excepcion
    commit;
end;
/
/
BEGIN
    SP_INSERTARDEPARTAMENTO (11, '11', '11');
end;
/
select * from dept;

-- Version 2
-- Realizar un procedimiento para insertar un nuevo departamento
-- Generamos el ID con el MAX automatico dentro del procedure
/
create or replace PROCEDURE sp_insertardepartamento
(p_nombre dept.dnombre%type, p_localidad dept.loc%type)
AS
    v_max_id dept.dept_no%type;
BEGIN
    -- Realizamos el cursor implicito para buscar el MAX id
    select max(dept_no) + 1 into v_max_id from dept;
    insert into dept values (v_max_id, p_nombre, p_localidad);
    -- normalmente dentro de los procedimientos de accion se incluye (commit o rollback) si diera una excepcion
    commit;
exception
    -- En caso de que no hubiera lineas daria un null y saltaria el error, por eso la excepcion
    when no_data_found then 
        dbms_output.put_line('No existen datos');
        rollback;
end;
/
/
begin
 sp_insertardepartamento ('miercoles', 'miercoles');
end;
/

select * from dept;
select * from emp;

-- Realizar un procedimiento para incrementar el salario de los empleados por un oficio, debemos enviar el oficio y el incremento.

/
create or replace procedure sp_incrementar_salario
(p_oficio emp.oficio%type, p_incremento number)
as
begin
    update emp set salario = salario + p_incremento where upper(oficio) = upper (p_oficio);
end;
/

/
begin
    sp_incrementar_salario ('DIRECTOR',20);
end;
/

-- Necesito un procedimiento para insertar un doctor. Enviaremos todos los datos del doctor excepto el id.
-- Debemos recuperar el maximo id de doctor dentro del procedimiento.
select * from doctor;
/
create or replace procedure sp_insertar_doctor
(p_hospi_cod doctor.hospital_cod%type, p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type)
as
    v_doctor_no doctor.doctor_no%type;
begin
    select max (doctor_no) + 1 into v_doctor_no from doctor;
    insert into doctor values (p_hospi_cod, v_doctor_no, p_apellido, p_especialidad,p_salario);
    -- Si queremos añadir un SQL%ROWCOUNT tiene que ser antes del COMMIT porque sino no cuenta las lineas agregadas.
end;
/

/
begin
    sp_insertar_doctor (23, 'afafaf','nuevo puesto', 100 );
end;
/

-- Necesito un procedimiento para insertar un doctor. Enviaremos todos los datos del doctor excepto el id.
-- Debemos recuperar el maximo id de doctor dentro del procedimiento. Enviamos el nombre del hospital en lugar del ID del hospital.
-- Controlar si no existe el hospital enviado.
select * from doctor;
select * from hospital;
/
create or replace procedure sp_insertar_doctor2
(p_apellido doctor.apellido%type, p_especialidad doctor.especialidad%type, p_salario doctor.salario%type, p_hospi_nombre hospital.nombre%type)
as
    v_hospital_cod hospital.hospital_cod%type;
    v_doctor_no doctor.doctor_no%type;
begin
    select max (doctor_no) + 1 into v_doctor_no from doctor;
    select hospital_cod into v_hospital_cod from hospital where upper(nombre) = upper(p_hospi_nombre);
    insert into doctor values (v_hospital_cod , v_doctor_no, p_apellido, p_especialidad,p_salario);
    -- Si queremos añadir un SQL%ROWCOUNT tiene que ser antes del COMMIT porque sino no cuenta las lineas agregadas.
EXCEPTION
    when no_data_found then
        dbms_output.put_line('No existe el hospital ' || p_hospi_nombre);
end;
/
/
begin
    sp_insertar_doctor2 ('FAAFAF','nuevo puesto', 100, 'LA PAZ');
end;
/

-- Podemos utilizar cursores explicitos dentro de los procedimientos
-- Realizar un procedimiento para mostrar los empleados de un determinado numero de departamento 
select *  from emp;
/
create or replace procedure sp_empleados_dept
(p_dept_no emp.dept_no%type)
as
    cursor cursor_emp is 
        select * from emp where dept_no = p_dept_no;
begin
    for v_reg_emp in cursor_emp 
    loop
        dbms_output.put_line('Apellido: ' || v_reg_emp.apellido || ' , Oficio: ' || v_reg_emp.oficio); 
    end loop;
end;
/
/
begin
sp_empleados_dept (10);
end;
/

-- Procedimientos de SALIDA

-- Vamos a realizar un procedimiento para enviar el nombre del departamento y devolver el numero de dicho departamento
select * from dept;
/
create or replace procedure sp_numerodepartamento
(p_nombre dept.dnombre%type, p_iddept out dept.dept_no%type)
as  
    v_iddept dept.dept_no%type;
begin
    select dept_no into v_iddept from dept where upper(dnombre) = upper(p_nombre);
    p_iddept := v_iddept;
    dbms_output.put_line('El numero de departamento es ' || v_iddept);
end;
/
/
begin
    sp_numerodepartamento ('ventas');
end;
/

-- Necesito un procedimiento para incrementar el salario en 1 de los empleados de un departamento. Enviaremos al procedimiento el nombre del departamento.
select * from emp;
select * from dept;
/
create or replace procedure sp_incremento_sal_dept
(p_nombre dept.dnombre%type)
as  
    v_num dept.dept_no%type;
begin
    -- Recuperamos el id del departamento a partir del nombre:
    -- Llamamos al procedimiento de numero para recuperar el numero a partir del nombre
    -- sp_numerodepartamento
    -- (p_nombre dept.dnombre%type, p_iddept out dept.dept_no%type)
    sp_numerodepartamento(p_nombre, v_num);
    update emp set salario = salario + 1  where dept_no = v_num;
    dbms_output.put_line('Salarios modificados: ' || sql%rowcount);
end;
/
/
begin
    sp_incremento_sal_dept ('ventas');
end;
/