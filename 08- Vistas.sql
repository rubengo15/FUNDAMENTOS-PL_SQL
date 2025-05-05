-- Vamos a crear una vista para tener todos los datos de los empleados sin el salario ni comision ni dir.
/
create or replace view v_empleados
AS
    select emp_no, apellido, oficio, fecha_alt, dept_no, salario from emp;
    select * from v_empleados;
/
select * from v_empleados;

/
create or replace view v_emp_dept
as
select emp.apellido, emp.oficio, emp.salario, dept.dnombre, dept.loc as localidad from emp inner join dept on emp.dept_no = dept.dept_no;
/
select * from v_emp_dept where localidad = 'MADRID';


-- PODEMOS tener campos virtuales
create or replace view v_empleados_virtual
as
    select emp_no, apellido, oficio, salario + comision as total, dept_no from emp;
select * from v_empleados_virtual;

-- Modificar el salario de los empleados Analista
-- tabla:
update emp set salario = salario + 1 where oficio = 'ANALISTA';
-- vista:
update v_empleados set salario = salario + 1 where oficio = 'ANALISTA';
SELECT * from emp where oficio = 'ANALISTA';

-- Eliminamos al empleado con id 7917
delete from v_empleados where emp_no = 7917;
select * from emp;
select * from dept;
-- Insertamos en la vista
insert into v_empleados values (1111, 'lunes', 'Lunes', SYSDATE, 40, 0);


update v_emp_dept set salario = salario + 1 where localidad = 'MADRID';

rollback;

-- Vistas que pueden llegar a ser inutiles
create or replace view v_vendedores
as  
    select emp_no, apellido, oficio, salario, dept_no from emp where oficio = 'VENDEDOR'
    WITH CHECK OPTION;
    

-- modificamos el salario de los vendedores
select * from v_vendedores;
update v_vendedores set salario = salario + 1;
update v_vendedores set oficio = 'VENDIDOS';