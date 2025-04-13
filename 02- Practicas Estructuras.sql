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
    v_ejer1 number; -- Ponemos number ya que con int redondeba
    v_ejer2 int;
    v_ejer3 int;
    v_ejer4 int;
    v_ejer5 int;
    v_ejer6 int;
    v_ejer7 int;
    v_fecha_fin varchar2(20);
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
    v_ejer1 := (((v_mes_nac + 1) * 3)/5); --Almacenamos la variavle del ejercicio 1
    dbms_output.put_line (v_ejer1); -- La pintamos para ver si esta correcta
    -- Ejercicio 2
    v_ejer2 := (v_ano_nac / 4);
    dbms_output.put_line (v_ejer2);
    -- Ejercicio 3
    v_ejer3 := (v_ano_nac / 100);
    dbms_output.put_line (v_ejer3);
    -- Ejercicio 4
    v_ejer4 := (v_ano_nac / 400);
    dbms_output.put_line (v_ejer4);
    -- Ejercicio 5
    v_ejer5 := (v_dia_nac + (v_mes_nac * 2) + v_ano_nac + v_ejer1 + v_ejer2 - v_ejer3 + v_ejer4 + 2); 
    dbms_output.put_line (v_ejer5);
    -- Ejercicio 6
    v_ejer6 := (v_ejer5 / 7);
    dbms_output.put_line (v_ejer6);
    -- Ejercicio 7
    v_ejer7 := v_ejer5 - (v_ejer6 * 7);
    dbms_output.put_line (v_ejer7);
    -- Ejercicio 8
    dbms_output.put_line ('Introduzca su dia de nacimiento ' || v_dia_nac);
    dbms_output.put_line ('Introduzca su mes de nacimiento ' || v_mes_nac);
    dbms_output.put_line ('Introduzca su año de nacimiento ' || v_ano_nac);
    dbms_output.put_line ('Su dia de nacimiento fue: ' );
    if (v_dia_nac = 0 or v_dia_nac = 7 or v_dia_nac = 14 or v_dia_nac = 21 or v_dia_nac = 28)
    then dbms_output.put_line (v_sabado);
    elsif (v_dia_nac = 1 or v_dia_nac = 8 or v_dia_nac = 15 or v_dia_nac = 22 or v_dia_nac = 29)
    then dbms_output.put_line (v_domingo);
    elsif (v_dia_nac = 2 or v_dia_nac = 9 or v_dia_nac = 16 or v_dia_nac = 23 or v_dia_nac = 30)
    then dbms_output.put_line (v_lunes);
    elsif (v_dia_nac = 3 or v_dia_nac = 10 or v_dia_nac = 17 or v_dia_nac = 24 or v_dia_nac = 31)
    then dbms_output.put_line (v_martes);
    elsif (v_dia_nac = 4 or v_dia_nac = 11 or v_dia_nac = 18 or v_dia_nac = 25)
    then dbms_output.put_line (v_miercoles);
    elsif (v_dia_nac = 5 or v_dia_nac = 12 or v_dia_nac = 19 or v_dia_nac = 26)
    then dbms_output.put_line (v_jueves);
    elsif (v_dia_nac = 6 or v_dia_nac = 13 or v_dia_nac = 20 or v_dia_nac = 27)
    then dbms_output.put_line (v_viernes);
    end if;
end;
/
undefine dia;
undefine mes;
undefine ano;


