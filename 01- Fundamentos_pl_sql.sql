declare
    -- declaramos una variable
   numero int;
   texto  varchar2(50);
begin
   texto := 'mi primer pl/sql';
   dbms_output.put_line('mensaje:' || texto);
   dbms_output.put_line('mi primer bloque anonimo');
   numero := 33;
   dbms_output.put_line('valor numero:' || numero);
   numero := 22;
   dbms_output.put_line('valor numerico nuevo:' || numero);
end;

-- Pedir un nombre 
DECLARE
    nombre varchar2(30);
BEGIN
    nombre := '&dato_que_pedira_el_campo';
    dbms_output.put_line('Su nombre es ' || nombre);
end;


DECLARE
    fecha date;
    texto varchar2(50);
    longitud int;
BEGIN
    fecha := sysdate;
    dbms_output.put_line('hoy es: ' || fecha);
    texto := '&data';
    --alamcenar la longitud del texto
    longitud := length(texto);
end;


DECLARE
    primer_num int;
    segundo_num int;
    suma int;
BEGIN
    primer_num := '&numero1';
    segundo_num := '&&numero2';
    suma := primer_num + segundo_num;
    dbms_output.put_line('La suma de ' ||primer_num || ' + ' || segundo_num || 'es ' || (primer_num + segundo_num) ); --si no declaramos la variable suma
    dbms_output.put_line('La suma de ' ||primer_num || ' + ' || segundo_num || 'es ' || suma );
end;

--QUITAR LA DEFINICION DE LAS VARIABLES
undefine primer_num;
undefine segundo_num;



declare 
    --declaramos una variante para almacenar el numero de departamento
    v_departamento int;
begin
    --pedimos un numero al usuario
    v_departamento := '&dept';
    update emp set salario = salario + 1 where dept_no = v_departamento;
end;
undefine dept;


-- Bloque para insertar un departamento
-- Como agregar datos a una tabla
DECLARE
    v_numero dept.dept_no%type; -- &type: coge los valores que hay en esa columna de la tabla, para no tener errores
    v_nombre dept.dnombre%type;
    v_localidad dept.loc%type;
BEGIN
    v_numero := &numero;
    v_nombre := '&nombre';
    v_localidad := '&localidad';
    insert into dept values (v_numero, v_nombre, v_localidad);
end;

select * from dept;
undefine numero;
undefine nombre;
undefine localidad;





