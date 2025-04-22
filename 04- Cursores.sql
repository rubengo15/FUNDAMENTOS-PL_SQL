--Bloque para consultas de accion
-- Insertar 5 departamentos en un bloque pl/sql dinamico
/
DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
BEGIN
    -- Vamos a realizar un bucle para insertar 5 departamentos
    for i in 1..5 loop
        v_nombre := 'Departamento ' || i;
        v_loc := 'Localidad ' || i;
        insert into dept values (i, v_nombre, v_loc);

    end loop;
end;
/
select * from dept;

-- Insertamos el maximo del dept_no
/
DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%type;
BEGIN
    -- Vamos a realizar un bucle para insertar 5 departamentos
    for i in 1..5 loop
        v_nombre := 'Departamento ' || i;
        v_loc := 'Localidad ' || i;
        insert into dept values ((select max (dept_no) + 1 from dept), v_nombre, v_loc);
    end loop;
end;
/

-- Realizar un bloque pl/sql que pedira un numero al usuario y mostrara el departamento con dicho numero
-- No funciona
/
declare
    v_id int;
    p_dept_no varchar2(50);
begin
    v_id := &numero;
    select * into p_dept_no from dept where dept_no = v_id;
    dbms_output.put_line(p_dept_no);
end;
/
undefine numero;
select * from dept;

-- CURSORES IMPLICITOS 
-- SOLAMENTE PUEDEN DEVOLVER UNA FILA
-- EJEMPLO, RECUPERAR EL OFICIO DEL EMPLEADO REY

/
DECLARE
    v_oficio  emp.oficio%type;
begin
    select Oficio into v_oficio from emp where upper(apellido) = 'REY';
    dbms_output.put_line('El oficio de REY es ' || v_oficio);
end;
/

-- CURSORES EXPLICITOS
-- PUEDEN DEVOLVER MAS DE UNA FILA Y ES NECESARIO DECLARARLOS
-- EJEMPLO, MOSTRAR EL APELLIDO Y SALARIO DE TODOS LOS EMPLEADOS

/
declare
    v_ape emp.apellido%type;
    v_sal emp.salario%type;
    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP is select apellido, salario from emp;
begin
    -- Abrir el cursor 
    open CURSOREMP;
    -- Bucle infinito
    loop
        -- Extraemos los datos del cursor
        fetch CURSOREMP into v_ape, v_sal;
        -- Dibujamos las variables
        dbms_output.put_line('Apellido: ' || v_ape || ', Salario: ' || v_sal);
        -- Decimos cuando debe parar el cursor
        exit when CURSOREMP%notfound;
    end loop;
    -- Cerramos el cursor
    close CURSOREMP;
end;
/
select * from emp;

-- De esta forma no duplica la ultima fila, seria la correcta
/
declare
    v_ape emp.apellido%type;
    v_sal emp.salario%type;
    -- Declaramos nuestro consultor con una consulta
    -- La consulta debe tener los mismos datos para luego hacer el Fetch
    cursor CURSOREMP is select apellido, salario from emp;
begin
    -- Abrir el cursor 
    open CURSOREMP;
    -- Bucle infinito
    loop
        -- Extraemos los datos del cursor
        fetch CURSOREMP into v_ape, v_sal;
        -- Decimos cuando debe parar el cursor
        exit when CURSOREMP%notfound;
        -- Dibujamos las variables
        dbms_output.put_line('Apellido: ' || v_ape || ', Salario: ' || v_sal);
    end loop;
    -- Cerramos el cursor
    close CURSOREMP;
end;
/


-- ATRIBUTO ROWCOUNT PARA LAS CONSULTAS DE ACCION
-- EJEMPLO, INCREMENTAR EN 1 EL SALARIO DE LOS EMPLEADOS DEL DEPARTAMENTO 10
-- MOSTRAR EL NUMERO DE DEPARTAMENTOS MODIFICADOS
/
declare

begin
    update emp set salario = salario + 1 where dept_no = 10;
    dbms_output.put_line('Empleados modificados ' || SQL%ROWCOUNT);
end;
/
select * from emp;

-- Incrementar en 10.000 al empleado que menos cobre en la empresa
-- ¿Que necesito para ello?
-- 1) El minimo salario, en caso de ser solo uno es (implicito) y en caso de ser varios con el minimo salario es (explicito)
-- 2) Update a ese salario

/
declare
    v_salario  emp.salario%type;
    cursor CURSOREMP1 is select min (salario) from emp;
begin
    open CURSOREMP1;
    loop
        fetch CURSOREMP1 into v_salario;
        exit when CURSOREMP1%notfound;
    end loop;
    update emp set salario = salario + 10000 where salario = v_salario;
    dbms_output.put_line('Empleados modificados ' || SQL%ROWCOUNT);
    close CURSOREMP1;
end;
/
-- Forma correcta
/
DECLARE
    v_salario  emp.salario%type;
    v_apellido emp.apellido%type;
begin
    select min (salario) into v_salario from emp;
    -- Alamcenamos la persona que cobra dicho salario
    select apellido into v_apellido from emp where salario = v_salario;
    update emp set salario = salario + 10000 where salario = v_salario;
    dbms_output.put_line('Salario incrementado al empleado ' || v_apellido || ' siendo el total de empleados modificados ' || sql%ROWCOUNT || ' empleados');
end;
/
select * from emp;

-- Realizar un bloque PL/SQL donde pediremos el numero, nombre y localidad de un departamento.
-- Si el departamento existe modificamos su nombre y localidad
-- Si el departamento no existe lo insertamos

-- primera parte para entender algo

/
declare
    v_numero dept.dept_no%type;
    v_departamento dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe dept.dept_no%type;
begin
    v_numero := &numero;
    v_departamento := '&dep';
    v_localidad := '&loc';
    select dept_no into v_existe from dept where dept_no = v_numero;
        if (v_existe is null) then
            dbms_output.put_line('insert');
        else
            dbms_output.put_line('update');
        end if;
end;
/
undefine numero;
undefine dep;
undefine loc;

-- Hecho por compañero

/
declare
    v_numero dept.dept_no%type;
    v_departamento dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe boolean := false;
    v_recuperar dept.dept_no%type;
    cursor CURSORDEPT is select dept_no from dept;
begin
    v_numero := &numero;
    v_departamento := '&dep';
    v_localidad := '&loc';
    open CURSORDEPT;
        loop
            fetch CURSORDEPT into v_recuperar;
            If (v_recuperar = v_numero) then
                v_existe := true;
                dbms_output.put_line('ha encontrado un departamento');
            end if;
            exit when CURSORDEPT%notfound;
        end loop;

    close CURSORDEPT;

    if v_existe then 
        update dept set dnombre = v_departamento, loc = v_localidad where dept_no = v_numero;
        dbms_output.put_line ('Departamentos modificados ' || SQL%ROWCOUNT);
    else 
        insert into dept values (v_numero, v_departamento, v_localidad);
        dbms_output.put_line ('Departamentos insertados ' || SQL%ROWCOUNT);
    end if;

end;
/
undefine numero;
undefine dep;
undefine loc;
select * from dept;

-- Hecho correctamente
-- Para probar la logica

/
declare
    v_numero dept.dept_no%type;
    v_departamento dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe dept.dept_no%type;
    cursor CURSORDEPT is select dept_no from dept where dept_no = v_numero;
begin
    v_numero := &numero;
    v_departamento := '&dep';
    v_localidad := '&loc';
    open CURSORDEPT;
    fetch CURSORDEPT into v_existe;
        if (CURSORDEPT%found) then
        dbms_output.put_line('update');
        update dept set dnombre = v_departamento, loc = v_localidad where dept_no = v_numero;
        else
        dbms_output.put_line('insert');
        insert into dept values (v_numero, v_departamento, v_localidad);
        end if;
    close CURSORDEPT;
end;
/

undefine numero;
undefine dep;
undefine loc;
select * from dept;

-- Con consulta Count

/
declare
    v_numero dept.dept_no%type;
    v_departamento dept.dnombre%type;
    v_localidad dept.loc%type;
    v_existe dept.dept_no%type;
begin
    v_numero := &numero;
    v_departamento := '&dep';
    v_localidad := '&loc';
    select count(dept_no) into v_existe from dept where dept_no = v_numero;
        if (v_existe = 0) then
            dbms_output.put_line('insert');
        else
            dbms_output.put_line('update');
        end if;
end;
/


-- Realizar un codigo PL/SQL para modificar el salario del empleado ARROYO
-- Si el empleado cobra mas de 250.000, le bajamos el sueldo 10.000 y sino le subimos el sueldo en 10.000

/
declare
    v_apellido emp.apellido%type;
    v_salario emp.salario%type;
begin
    select salario into v_salario from emp where apellido = 'arroyo';
        IF (v_salario <= 250000) then
            update emp set salario = salario + 10000 where salario = v_salario;
        else 
            update emp set salario = salario - 10000 where salario = v_salario;
        end if;
end;
/
select * from emp;