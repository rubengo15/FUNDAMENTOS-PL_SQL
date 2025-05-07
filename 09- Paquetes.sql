-- Header
create or replace package pk_ejemplo
AS
    -- En el header solamente se incluyen las declaraciones
    procedure mostrarmensaje;
end pk_ejemplo;
-- Body
/
create or replace package body pk_ejemplo
AS
    -- En el header solamente se incluyen las declaraciones
    procedure mostrarmensaje;
    AS
    begin
        dbms_output.put_line('prueba de paquete');
    end;
end pk_ejemplo;
/
-- Vamos a realizar un paquete que contenga acciones de eliminar sobre emp, dept, doctor y enfermo
/
create or replace package pk_delete
AS
    procedure eliminaremp(p_empno emp.emp_no%type);
    procedure eliminardepartamento(p_deptno dept.dept_no%type);
    procedure eliminardoctor (p_doctorno doctor.doctor_no%type);
    procedure eliminarenfermo (p_inscripcion enfermo.inscripcion%type);
end pk_delete;
/
-- body
create or replace package body pk_delete
AS
    procedure eliminaremp(p_empno emp.emp_no%type)
    AS
    begin
        delete from emp where emp_no = p_empno;
        commit;
    end;
    procedure eliminardepartamento(p_deptno dept.dept_no%type)
        AS
    begin
        delete from dept where dept_no = p_deptno;
        commit;
    end;
    procedure eliminardoctor (p_doctorno doctor.doctor_no%type)
            AS
    begin
        delete from doctor where doctor_no = p_doctorno;
        commit;
    end;
    procedure eliminarenfermo (p_inscripcion enfermo.inscripcion%type)
                AS
    begin
        delete from enfermo where inscripcion = p_inscripcion;
        commit;
    end;
end pk_delete;

select * from dept;

begin
    pk_delete.eliminardepartamento(42);
end;


-- Crear un procedimiento con tres funciones: creamos un paquete para devolver el maximo, minimo y diferencia de todos los empleados (salario)
/
create or replace package pk_empleados_salarios
AS
    function minimo return number;
    function maximo return number;
    function diferencia return number;
end pk_empleados_salarios;
/
-- body
/
create or replace package body pk_empleados_salarios
AS
    function minimo return number
        AS
           v_minimo emp.salario%type; 
        begin
            select min(salario) into v_minimo from emp;
            return  v_minimo;
        end;
    function maximo return number
        AS
           v_maximo emp.salario%type; 
        begin
            select max(salario) into v_maximo from emp;
            return  v_maximo;
        end;
    function diferencia return number
        AS
           v_diferencia number; 
        begin
            v_diferencia := maximo - minimo;
            return  v_diferencia;
        end;
end pk_empleados_salarios;
/
select pk_empleados_salarios.maximo as maximo, pk_empleados_salarios.minimo as minimo, pk_empleados_salarios.diferencia as diferencia from dual;

-- Necesito un paquete para realizar update, insert y delete sobre dept. Llamamos al package pk_departamentos
 /
create or replace package pk_departamentos
AS
    procedure eliminardepartamento(p_deptno dept.dept_no%type);
    procedure insertardepartamento (p_deptnoin dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type);
    procedure actualizardepartamento (p_deptno dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type);
end pk_departamentos;
/
/
create or replace package body pk_departamentos
AS
    procedure eliminardepartamento(p_deptno dept.dept_no%type)
        as
        begin
            delete from dept where dept_no = p_deptno;
            commit;
        end;
    procedure insertardepartamento (p_deptnoin dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
         as
        begin
            insert into dept values (p_deptnoin, p_nombre, p_localidad);
            commit;
        end;
    procedure actualizardepartamento (p_deptno dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
        as
        begin
            update dept set dnombre = p_nombre, loc = p_localidad where dept_no = p_deptno;
            commit;
        end;
end pk_departamentos;
/
select * from dept;

/
begin
    pk_departamentos.insertardepartamento(42, 'nuevo', 'MALAGA');
    pk_departamentos.actualizardepartamento(42, 'nuevo2', 'MALAGAS');
    pk_departamentos.eliminardepartamento(42);
end;
/


-- Necesito una funcionalidad que nos devuelva el apellido, el trabajo, salario y lugar de trabajo (departamento/hospital) de todas las personas de nuestra bbdd.
-- 1) consulta gorda
-- 2) consulta dentro de vista
-- 3) paquete con dos procedimientos
-- 3A) procedimiento para devolver todos los datos de un cursor
-- 3B) procedimiento para devolver todos los datos de un cursor por salario.

-- 1) consulta gorda
/
SELECT emp.apellido, emp.oficio, emp.salario, dept.dnombre FROM emp inner join dept on emp.dept_no = dept.dept_no 
UNION SELECT doctor.apellido, doctor.especialidad, doctor.salario, hospital.nombre FROM doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod
UNION SELECT plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.nombre FROM plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;
/
select * from emp;
select * from doctor;
select * from plantilla;
-- 2) consulta dentro de vista
/
create or replace view v_personas
    as
    SELECT emp.apellido, emp.oficio, emp.salario, dept.dnombre FROM emp inner join dept on emp.dept_no = dept.dept_no 
UNION SELECT doctor.apellido, doctor.especialidad, doctor.salario, hospital.nombre FROM doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod
UNION SELECT plantilla.apellido, plantilla.funcion, plantilla.salario, hospital.nombre FROM plantilla inner join hospital on plantilla.hospital_cod = hospital.hospital_cod;
/
select * from v_personas;
-- 3) paquete con dos procedimientos

declare
    v_ape emp.apellido%type;
    v_ofi emp.oficio%type;
    v_sal emp.salario%type;
    v_dep dept.dnombre%type;

    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP is select * from v_personas;
begin
    -- Abrir el cursor 
    open CURSOREMP;
    -- Bucle infinito
    loop
        -- Extraemos los datos del cursor
        fetch CURSOREMP into v_ape, v_ofi, v_sal, v_dep;
        -- Dibujamos las variables
        dbms_output.put_line('Apellido: ' || v_ape || ', Oficio: ' || v_ofi || ', Salario: ' || v_sal || ', Hospital: ' || v_dep);
        -- Decimos cuando debe parar el cursor
        exit when CURSOREMP%notfound;
    end loop;
    -- Cerramos el cursor
    close CURSOREMP;
end;
/
/
declare
    v_ape emp.apellido%type;
    v_ofi emp.oficio%type;
    v_sal emp.salario%type;
    v_dep dept.dnombre%type;

    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP2 is select * from v_personas  where salario > 300000;
begin
    -- Abrir el cursor 
    open CURSOREMP2;
    -- Bucle infinito
    loop
        -- Extraemos los datos del cursor
        fetch CURSOREMP2 into v_ape, v_ofi, v_sal, v_dep;
        -- Dibujamos las variables
        dbms_output.put_line('Apellido: ' || v_ape || ', Oficio: ' || v_ofi || ', Salario: ' || v_sal || ', Hospital: ' || v_dep);
        -- Decimos cuando debe parar el cursor
        exit when CURSOREMP2%notfound;
    end loop;
    -- Cerramos el cursor
    close CURSOREMP2;
end;
/
/
create or replace procedure p_personas
as
begin
    declare
    v_ape emp.apellido%type;
    v_ofi emp.oficio%type;
    v_sal emp.salario%type;
    v_dep dept.dnombre%type;

    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP is select * from v_personas;
        begin
    -- Abrir el cursor 
        open CURSOREMP;
    -- Bucle infinito
            loop
        -- Extraemos los datos del cursor
                fetch CURSOREMP into v_ape, v_ofi, v_sal, v_dep;
        -- Dibujamos las variables
                dbms_output.put_line('Apellido: ' || v_ape || ', Oficio: ' || v_ofi || ', Salario: ' || v_sal || ', Hospital: ' || v_dep);
        -- Decimos cuando debe parar el cursor
                exit when CURSOREMP%notfound;
            end loop;
    -- Cerramos el cursor
        close CURSOREMP;
    end;
end;
/


-- Necesito una funcionalidad que nos devuelva el apellido, el trabajo, salaro y lugar de trabajo (departamento/hospital) dependiendo del salario.

/
create or replace procedure p_personas2
as
begin
    declare
    v_ape emp.apellido%type;
    v_ofi emp.oficio%type;
    v_sal emp.salario%type;
    v_dep dept.dnombre%type;

    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP2 is select * from v_personas  where salario > 300000;
        begin
    -- Abrir el cursor 
        open CURSOREMP2;
    -- Bucle infinito
            loop
        -- Extraemos los datos del cursor
                fetch CURSOREMP2 into v_ape, v_ofi, v_sal, v_dep;
        -- Dibujamos las variables
                dbms_output.put_line('Apellido: ' || v_ape || ', Oficio: ' || v_ofi || ', Salario: ' || v_sal || ', Hospital: ' || v_dep);
        -- Decimos cuando debe parar el cursor
            exit when CURSOREMP2%notfound;
            end loop;
    -- Cerramos el cursor
        close CURSOREMP2;
    end;
end;
/
begin
    p_personas2;
end;

-- Necesitamos un paquete con procedimiento para modificar el salario de cada doctor de forma individual.
-- La modificacion de los datos de cada doctor sera de forma aleatoria. Debemos comprobar el salario de cada doctor para ajustar el numero aleaorio del incremento.
-- 1) doctor con menos de 200.000: incremenamos aleatorio de 500
-- 2) doctor entre 200.000 y 300.000: incremenamos aleatorio de 300
-- 3) doctor con mayor de 300.000: incremenamos aleatorio de 50
-- El incremento random lo haremos con una funcion dentro del paquete (dbms_random.value(1,500))
select * from doctor;
/
create or replace package p_salario_doctor
as
    function f_salario return number; 

end p_salario_doctor;
/
/
create or replace package body p_salario_doctor
as
    function f_salario return number; 
        as
        v_subida number;
        v_salario doctor.salario%type;     
        begin
        v_subida := v_subida + dbms_random.value(1,500);
        if ( v_salario < 200000) then
        dbms_output.put_line('El salario ');
    else
        for a in inicio..fin loop
            dbms_output.put_line('numeros que hay entre medias de ' || inicio || ' y ' || fin || ' son: ' || a);
        end loop;
    end if;

        end;

end p_salario_doctor;
/

-----------CHATGPT------------
/
CREATE OR REPLACE PACKAGE pk_salario_doctores AS
    -- Procedimiento para actualizar el salario de un doctor individual
    PROCEDURE modificar_salario(p_doctor_id doctor.apellido%TYPE);
END pk_salario_doctores;
/
/
CREATE OR REPLACE PACKAGE BODY pk_salario_doctores AS

    -- Funcion privada para obtener incremento aleatorio segun el salario actual
    FUNCTION obtener_incremento(p_salario doctor.salario%TYPE) RETURN NUMBER IS
        v_incremento NUMBER;
    BEGIN
        IF p_salario < 200000 THEN
            -- Aleatorio entre 1 y 500
            v_incremento := DBMS_RANDOM.VALUE(1, 500);
        ELSIF p_salario BETWEEN 200000 AND 300000 THEN
            -- Aleatorio entre 1 y 300
            v_incremento := DBMS_RANDOM.VALUE(1, 300);
        ELSE
            -- Aleatorio entre 1 y 50
            v_incremento := DBMS_RANDOM.VALUE(1, 50);
        END IF;
        RETURN v_incremento;
    END;

    -- Procedimiento para modificar salario individual
    PROCEDURE modificar_salario(p_doctor_id doctor.apellido%TYPE) IS
        v_salario_actual doctor.salario%TYPE;
        v_incremento NUMBER;
    BEGIN
        -- Obtener salario actual
        SELECT salario INTO v_salario_actual FROM doctor WHERE apellido = p_doctor_id;

        -- Obtener incremento adecuado
        v_incremento := obtener_incremento(v_salario_actual);

        -- Actualizar salario
        UPDATE doctor
        SET salario = salario + v_incremento
        WHERE apellido = p_doctor_id;

        -- Opcional: Mostrar mensaje en consola (para testing)
        DBMS_OUTPUT.PUT_LINE('Doctor ' || p_doctor_id || ' incrementado en: ' || ROUND(v_incremento, 2));
    END;

END pk_salario_doctores;
/
/
BEGIN
    pk_salario_doctores.modificar_salario('Lopez A.'); -- donde 'Lopez A.' es el Apellido del doctor
END;
/

select * from doctor;

---------- Hecho por el profe -------------------
/
create or replace function random_doctor
    (p_iddoctor doctor.doctor_no%type)
return number
as
    v_salario doctor.salario%type;
    v_random number;
begin
    select salario into v_salario from doctor where doctor_no = p_iddoctor;
    if (v_salario < 200000) then
        v_random := trunc(dbms_random.value(1,500));
    ELSIF (v_salario > 300000) then
        v_random := trunc(dbms_random.value(1,50));
    else 
        v_random := trunc(dbms_random.value(1,300));
    end if;
    return v_random;
end;
/
--386 ->500
--522 ->50
select random_doctor(522) as incremento from dual;
/
/
Create or replace package pk_doctores
as
    procedure incremento_random_doctores;
    function function_random_doctores (p_iddoctor doctor.doctor_no%type)
    return number;
end pk_doctores;
/
declare
    cursor c_doctores is
    select doctor_no, apellido, salario from doctor;
    v_random number;
begin
    for v_doc in c_doctores
    loop
        v_random := random_doctor (v_doc.doctor_no);
        update doctor set salario = salario + v_random where doctor_no = v_doc.doctor_no;
        dbms_output.put_line('Doctor ' || v_doc.apellido || ' tiene un incremento de: ' || v_random);
    end loop;
end; 
/
/
Create or replace package body pk_doctores
as
    procedure incremento_random_doctores
    as
        cursor c_doctores is
        select doctor_no, apellido, salario from doctor;
        v_random number;
        begin
            for v_doc in c_doctores
            loop
            v_random := random_doctor (v_doc.doctor_no);
                update doctor set salario = salario + v_random where doctor_no = v_doc.doctor_no;
                dbms_output.put_line('Doctor ' || v_doc.apellido || ' tiene un incremento de: ' || v_random);
            end loop;
        end;
    function function_random_doctores (p_iddoctor doctor.doctor_no%type)
    return number
    as
        v_salario doctor.salario%type;
        v_random number;
    begin
    select salario into v_salario from doctor where doctor_no = p_iddoctor;
        if (v_salario < 200000) then
            v_random := trunc(dbms_random.value(1,500));
        ELSIF (v_salario > 300000) then
            v_random := trunc(dbms_random.value(1,50));
        else 
            v_random := trunc(dbms_random.value(1,300));
        end if;
    return v_random;
end;
end pk_doctores;
/
select PK_DOCTORES.FUNCTION_RANDOM_DOCTORES(386) as incremento from DUAL;