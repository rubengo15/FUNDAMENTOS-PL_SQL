-- Realizar una Funcion para sumar dos numeros
/
create or replace function f_sumarnumeros
-- si lleva parametros se añaden entre parentesis
(p_numero1 number, p_numero2 number)
return number
as
    v_suma number;
begin
    v_suma := nvl(p_numero1, 0) + nvl(p_numero2, 0); -- NVL hace que si no hay un valor devuelva el valor que pongamos de base en este caso un 0
    -- Siempre un Return
    return v_suma;
end;
/
-- Llamada con codigo PL/SQL
/
declare
    v_resultado number;
begin
    v_resultado := f_sumarnumeros (10, 15);
    dbms_output.put_line('La suma es: ' || v_resultado);
end;
/

-- Llamada con Select
/
select f_sumarnumeros (20,26) as SUMA from dual;
/
/
select f_sumarnumeros (null,26) as SUMA from dual; -- Al haber puesto NVL el null tiene valor 0 
/
/
select apellido, f_sumarnumeros (salario, comision) as Total from emp;
/

-- Funcion ara saber el numero de personas en un oficio
/
create or replace function num_personas_oficio
(p_oficio emp.oficio%type)
return number
as
    v_personas int;
begin
    select count(emp_no) into v_personas from emp where lower(oficio) = lower(p_oficio);
    return v_personas;
end;
/
-- Llamada con Select
/
select num_personas_oficio ('analista') as Personas from dual;
/
-- Llamada con PL/SQL
/
declare 
    v_personas int;
begin
    v_personas
end;
/

-- Realizar una funcion para devolver el mayor de dos numeros
/
create or replace function f_mayor_dos_numeros
(numero1 number, numero2 number)
return number
as
    v_mayor number;
begin
    if (numero1 > numero2) then
        v_mayor := numero1;
    else
        v_mayor := numero2;
    end if;
    return v_mayor;
end;
/
select f_mayor_dos_numeros (10, 22) as mayor from dual;

-- Realizar una funcion para devolver el mayor de tres numeros, sin usar IF, buscar en google una funcion para que nos devuelva el mayor.
/
CREATE OR REPLACE FUNCTION mayor_de_tres (
    num1 IN NUMBER,
    num2 IN NUMBER,
    num3 IN NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN GREATEST(num1, num2, num3);
END;
/
select mayor_de_tres (10, 55, 22) as Mayor from dual;

-- Tenemos los parametros por defecto dentro de las funciones

select 100 * 1.21 as iva from dual;
/
create or replace function calcular_iva
(p_precio number, p_iva number := 1.18)
return number
as

begin
    return p_precio * p_iva;
end;
/
select calcular_iva (100, 1.22) as total from dual;