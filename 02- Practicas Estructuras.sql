/
declare
    v_sabado varchar2(20);
    v_domingo varchar2(20);
    v_lunes varchar2(20);
    v_martes varchar2(20);
    v_miercoles varchar2(20);
    v_jueves varchar2(20);
    v_viernes varchar2(20);
    v_dia_nac int;
    v_mes_nac int;
    v_ano_nac int;
begin
    v_sabado := 'Sabado';
    v_domingo := 'Domingo';
    v_lunes := 'Lunes';
    v_martes := 'Martes';
    v_miercoles := 'Miercoles';
    v_jueves := 'Jueves';
    v_viernes := 'Viernes';   
    v_dia_nac := '&dia';
    v_mes_nac := '&mes';
    v_ano_nac := '&ano';
    dbms_output.put_line(v_dia_nac || '/' || v_mes_nac || '/' || v_ano_nac);   
    -- Ejercicio 1
    dbms_output.put_line(((v_mes_nac + 1) * 3)/5);
end;
/