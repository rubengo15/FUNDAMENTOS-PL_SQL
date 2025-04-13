/
declare
    v_salario number;
    v_horas number;
    v_distancia number;
    v_precio_hora number;
    v_horas_extra number;
begin
    v_horas := &horas;
    v_distancia := &distancia;
    v_precio_hora := &precio_hora;
    -- ejercicio 1
    v_horas_extra := greatest(v_horas - 36, 0);
    if (v_horas < 36) then
    dbms_output.put_line ('No tiene horas extras');
    dbms_output.put_line ('Horas extra: 0');
    else
    dbms_output.put_line ('Tiene horas extras');
    dbms_output.put_line ('Horas extra: ' || v_horas_extra);
    end if;
    -- ejercicio 2
    if (v_distancia < 100) then
    dbms_output.put_line('No hay dietas');
    dbms_output.put_line('Cobro en dietas: 0');
    elsif (v_distancia >= 100 and v_distancia <= 250) then
    dbms_output.put_line('Dietas regionales: 200€');
    dbms_output.put_line('Cobro en dietas: 200');
    elsif (v_distancia >= 250 and v_distancia <= 500) then
    dbms_output.put_line('Dietas provinciales: 400€');
    dbms_output.put_line('Cobro en dietas: 400');
    else 
    dbms_output.put_line('Dietas internacionales: 600€');
    dbms_output.put_line('Cobro en dietas: 600');
    end if;
    -- ejercicio 3
    if (v_horas < 36) then
    dbms_output.put_line('Horas computadas: ' || v_horas);
    else
    dbms_output.put_line('Horas computadas: 36');
    end if;
    -- ejercicio 4
    dbms_output.put_line('Precio hora: ' || v_precio_hora);
    -- ejercicio 5
    if (v_distancia < 100) then
    dbms_output.put_line('Salario final :' || ((v_horas * v_precio_hora) + (v_horas_extra * 2)));
    elsif (v_distancia >= 100 and v_distancia <= 250) then
    dbms_output.put_line('Salario final :' || (v_horas * v_precio_hora + (v_horas_extra * 2) + 200));
    elsif (v_distancia >= 250 and v_distancia <= 500) then
    dbms_output.put_line('Salario final :' || (v_horas * v_precio_hora + (v_horas_extra * 2) + 400));
    else
    dbms_output.put_line('Salario final :' || (v_horas * v_precio_hora + (v_horas_extra * 2) + 600));
    end if;
end;
/

undefine horas;
undefine distancia;
undefine precio_hora;