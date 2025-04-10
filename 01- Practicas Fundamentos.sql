-- 2) Insertar en la tabla EMP un empleado con código 9999 asignado directamente enla variable con %TYPE, apellido ‘PEREZ’, oficio ‘ANALISTA’ y código del departamento al que pertenece 10.
select *
  from emp;
declare
   v_empleado     emp.emp_no%type;
   v_apellidos    emp.apellido%type;
   v_oficios      emp.oficio%type;
   v_departamento emp.dept_no%type;
begin
   v_empleado := 9999;
   v_apellidos := 'PEREZ';
   v_oficios := 'ANALISTA';
   v_departamento := 10;
   insert into emp (
      emp_no,
      apellido,
      oficio,
      dept_no
   ) values ( v_empleado,
              v_apellidos,
              v_oficios,
              v_departamento );
end;

-- 3) Incrementar el salario en la tabla EMP en 200 EUROS a todos los trabajadores que sean ‘ANALISTA’, mediante un bloque anónimo PL, asignando dicho valor a una variable declarada con %TYPE
select * from emp;
declare
   v_oficios emp.oficio%type;
begin
   v_oficios := 'ANALISTA';
   update emp
      set
      salario = salario + 200
    where oficio = v_oficios;
end;

declare
   v_incremento emp.salario%type := 200;
begin
   update emp
      set
      salario = salario + v_incremento
    where oficio = ‘analista’;
    commit;
end;

-- 4) Realizar un programa que devuelva el número de cifras de un número entero, introducido por teclado, mediante una variable de sustitución
declare
   numero   int;
   longitud int;
begin
   numero := &numero;
    --alamcenar la longitud del texto
   longitud := length(numero);
   dbms_output.put_line(longitud);
end;

-- 5)Crear un bloque PL para insertar una fila en la tabla DEPT. Todos losdatos necesarios serán pedidos desde teclado.
select *
  from dept;
declare
   v_numero    dept.dept_no%type;
   v_nombre    dept.dnombre%type;
   v_localidad dept.loc%type;
begin
   v_numero := &numero;
   v_nombre := '&nombre';
   v_localidad := '&localidad';
   insert into dept values ( v_numero,
                             v_nombre,
                             v_localidad );
end;

-- 6) Crear un bloque PL que actualice el salario de los empleados que no cobran comisión en un 5%
select *
  from emp;
declare
   v_comisiones emp.comision%type;
begin
   v_comisiones := 0;
   update emp
      set
      salario = salario + ( salario * 0.05 )
    where comision = v_comisiones;
end;
rollback;



declare
   v_incremento number := 0.05;
begin
   update emp
      set
      salario = salario + ( salario * v_incremento )
    where comision is null;
end;

-- 7) Crear un bloque PL que almacene la fecha del sistema en una variable. Solicitar un número de meses por teclado y mostrar la fecha del sistema incrementado en ese número de meses.

declare
   v_fecha_sis date;
   v_meses     int;
begin
   v_fecha_sis := sysdate;
   v_meses := '&meses';
   dbms_output.put_line(add_months(
      v_fecha_sis,
      v_meses
   ));
end;

-- 8) Introducir dos números por teclado y devolver el resto de la divisiónde los dos números.

declare
   v_num1  int;
   v_num2  int;
   v_resul int;
begin
   v_num1 := &num1;
   v_num2 := &num2;
   v_resul := v_num1 / v_num2;
   dbms_output.put_line(v_resul);
end;

-- 9) Solicitar un nombre por teclado y devolver ese nombre con la primera inicial en mayúscula

declare
   v_nombre varchar2(25);
begin
   v_nombre := '&nombre';
   dbms_output.put_line(initcap(v_nombre));
end;

-- 10) Crear un bloque anónimo que permita borrar un registro de la tablaemp introduciendo por parámetro un número de empleado.
select * from emp;
declare
   v_num_emp number;
begin
   v_num_emp := &numeros;
   delete from emp where EMP_NO = v_num_emp;
end;