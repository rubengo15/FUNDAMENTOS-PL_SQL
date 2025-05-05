/
declare
    numero number;
    v_numero number;
    potencia number;
    i number;
begin
    numero := &numero;
    v_numero := 0;
    potencia := LENGTH(numero);
    for i in 1...potencia loop
        v_numero := v_numero + power(SUBSTR(numero,i,1)potencia);  
    end loop;
    if v_numero = numero then
        dbms_output.put_line('ES UN NÚMERO NARCISITA');
    else
        dbms_output.put_line('NO ES UN NÚMERO NARCISITA');
    end if;
end;
/