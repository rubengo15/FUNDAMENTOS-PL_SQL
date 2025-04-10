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




DECLARE 
    texto varchar2(50);
    fecha date;
    longitud int;
BEGIN
    fecha := sysdate;
    texto :='&data';
    --ALAMACENAMOS LA LONGITUD DEL TEXTO
    longitud := length(texto);
    --LA LONGITUD DE TU TEXTO ES 41
    dbms_output.put_line('la longitud del texto es ' || longitud);
    -- hoy es miercoles
    dbms_output.put_line('hoy es ' || to_char (fecha, 'day'));
    dbms_output.put_line(texto);
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

