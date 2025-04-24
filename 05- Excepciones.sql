-- Capturar una excepcion del sistema
/
declare
    v_numero1 number := &numero1;
    v_numero2 number := &numero2;
    v_division number;
begin
    v_division := v_numero1 / v_numero2;
    dbms_output.put_line('La division es: ' || v_division);
-- Error: ORA-01476: divisor is equal to zero
exception 
    when zero_divide then
        dbms_output.put_line('Error al dividir entre 0');
end;
/
undefine numero1;
undefine numero2;


-- Cuando los empleados tengan una comision con valor 0 lanzaremos una excepcion.
-- Tendremos una tabla donde almacenaremos los empleados con comision mayor a 0.
Create table emp_comision (apellido varchar2(50), comision number(9));

/
declare
    cursor cursor_emp is select apellido, comision from emp order by comision desc;
    -- Declaramos variable de tipo excepcion.
    exception_comision exception;
begin
    for v_record in cursor_emp 
    loop
        insert into emp_comision values (v_record.apellido, v_record.comision);
        if (v_record.comision = 0) then
            raise exception_comision;
        end if;
    end loop;
exception
    when exception_comision then dbms_output.put_line('Comisiones a zero ');
--Quiero detener esto cuando la comision sea 0.
end;
/

-- Pragma exceptions
/
declare
    exception_nulos exception;
    pragma exception_init(exception_nulos, -1400);
begin
    insert into dept values (null, 'DEPARTAMENTO', 'PRAGMA');
exception 
    when exception_nulos then dbms_output.put_line('No me sirven los nulos... ');
end;
/

-- Funciones asociadas con excepciones:

/
declare 
    v_id number;
begin
    select dept_no into v_id from dept where dnombre = 'bENTAS';
    dbms_output.put_line('Ventas es el numero: ' || v_id);
exception 
    when too_many_rows then 
        dbms_output.put_line('Demasiadas filas en cursor');
    when others then 
        dbms_output.put_line(to_char(sqlcode) || ' ' || sqlerrm);
end;



