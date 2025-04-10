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
    longitud int;
BEGIN
    fecha := sysdate;
    texto :='&data';
    --ALAMACENAMOS LA LONGITUD DEL TEXTO
    longitud := length(texto);
end;





