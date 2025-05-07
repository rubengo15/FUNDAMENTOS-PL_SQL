-- por un lado tenemos la declaracion del tipo y por otro lado, tenemos la variable de dicho tipo.ALTER

/
declare
    -- un tipo array para numeros
    type table_numeros is table of number index by binary_integer;
    -- objeto para almacenar varios numeros
    lista_numeros table_numeros;
begin
    -- almacenamos datos en su interior
    lista_numeros(1) := 88;
    lista_numeros(2) := 34;
    lista_numeros(3) := 55;
    dbms_output.put_line(lista_numeros(2));
end;
/
/
declare
    -- un tipo array para numeros
    type table_numeros is table of number index by binary_integer;
    -- objeto para almacenar varios numeros
    lista_numeros table_numeros;
begin
    -- almacenamos datos en su interior
    lista_numeros(1) := 88;
    lista_numeros(2) := 34;
    lista_numeros(3) := 55;
    for i in 1..3 loop
        dbms_output.put_line(lista_numeros(i));
    end loop;
end;
/
/
declare
    -- un tipo array para numeros
    type table_numeros is table of number index by binary_integer;
    -- objeto para almacenar varios numeros
    lista_numeros table_numeros;
begin
    -- almacenamos datos en su interior
    lista_numeros(1) := 88;
    lista_numeros(2) := 34;
    lista_numeros(3) := 55;
    dbms_output.put_line('Numero elementos: ' || lista_numeros.count);
    -- podemos recorrer todos losregistros (numeros) que tengamos
    for i in 1..lista_numeros.count loop
        dbms_output.put_line(lista_numeros(i));
    end loop;
end;
/

-- almacenar a la vez 
-- guardamos un tipo fila de departamento
/ 
declare
    type table_dept is table of dept%rowtype index by binary_integer;
    -- declaramos el objeto para almacenar filas
    lista_dept table_dept;
begin
    select * into lista_dept(1) from dept where dept_no = 10;
    select * into lista_dept(2) from dept where dept_no = 20;
    select * into lista_dept(3) from dept where dept_no = 30;
    for i in 1..lista_dept.count
    loop
        dbms_output.put_line(lista_dept(i).dnombre || ', ' || lista_dept(i).loc);
    end loop;
end;
/
/
DECLARE 
    CURSOR cursorEmpleados is 
        SELECT apellido FROM EMP;
    type c_lista is varray(20) of EMP.apellido%type;
        lista_empleados c_lista := c_lista();
        contador integer:=0;
BEGIN 
    FOR n IN cursorEmpleados LOOP
        contador := contador + 1;
        lista_empleados.extend;
        lista_empleados(contador) := n.apellido;
        dbms_output.put_line('Empleado('||contador ||'):'||lista_empleados(contador));
    END LOOP;
END;
/