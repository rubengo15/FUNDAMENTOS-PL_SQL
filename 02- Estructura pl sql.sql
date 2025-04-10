-- DEBEMOS COMPROBAR SI UN NUMERO ES POSITIVO O NEGATIVO
DECLARE
    v_numero int;
BEGIN
    --pedimos el numero al usuario
    v_numero := &numero;
    --preguntamos por el propio numero
    if (v_numero >= 0) THEN
        dbms_output.put_line('Positivo: ' || v_numero);
    ELSE
        dbms_output.put_line('Negativo: ' || v_numero);
    end if;
    dbms_output.put_line('Fin de programa');
end;
undefine numero;

-- COMPROBAMOS SI ES NEGATIVO, POSITIVO O NEUTRO
-- SIEMPRE ES IF -- ELSIF (LOS QUE QUERAMOS) -- ELSE (SI QUEREMOS)

DECLARE
    v_numero int;
BEGIN
    --pedimos el numero al usuario
    v_numero := &numero;
    --preguntamos por el propio numero
    if (v_numero > 0) THEN
        dbms_output.put_line('Positivo: ' || v_numero);
    elsif (v_numero < 0) then
        dbms_output.put_line('Negativo: ' || v_numero);
    else 
        dbms_output.put_line('Neutro: ' || v_numero);
    end if;
    dbms_output.put_line('Fin de programa');
end;
undefine numero;


DECLARE
    v_numero int;
BEGIN
    v_numero := &numero;
    if (v_numero = 1) THEN
        dbms_output.put_line('Primavera');
    elsif (v_numero = 2) THEN
        dbms_output.put_line('Verano');
    elsif (v_numero = 3) THEN
        dbms_output.put_line('Otoño');
    elsif (v_numero = 4) THEN
        dbms_output.put_line('Invierno');
    else 
        dbms_output.put_line('Esta mal');
    end if;
    dbms_output.put_line('Fin del programa');
END;
undefine numero;

-- pedimos dos numeros al usuario y debemos devolver que numero es mayor

DECLARE
    v_num1 int;
    v_num2 int;
BEGIN
    v_num1 := &numero1;
    v_num2 := &numero2;
    if (v_num1 < v_num2) then
        dbms_output.put_line('El segundo numero es mayor y es: ' || v_num2);
    elsif (v_num1 > v_num2) then
        dbms_output.put_line('El primer numero es mayor y es: ' || v_num1);
    end if;
    dbms_output.put_line('Fin del programa');
end;
undefine numero1;
undefine numero2;


-- Pedir un numero al usuario e indicar si es par o impar

DECLARE
    v_num int;
BEGIN
    v_num := &numero;
    if (mod (v_num, 2) = 0) THEN
    dbms_output.put_line('El numero es par');
    ELSE
    dbms_output.put_line('el numero es impar');
    end if;
    dbms_output.put_line('Fin del programa');
end;
undefine numero;

-- por supuesto, podemos perfectamente utilizar cualquier operador
-- tanto de comparacion, como relacional en nuestros codigos.

--Pedir una letra al usuario. Si la letra es vocal (a,e,i,o,u) pintamos vocal, sino, consonante.
/
DECLARE
    v_letra varchar2(1);
BEGIN
    v_letra := lower ('&letra');    
    if (v_letra = 'a' or v_letra = 'e' or v_letra = 'i' or v_letra = 'o' or v_letra = 'u') THEN
        dbms_output.put_line('Vocal ' || v_letra);
    else 
        dbms_output.put_line('Consonante ' || v_letra);
    end if;
end;
/
undefine letra;


-- Pedir tres numeros al usuario y debemos mostrar el mayor y el menor de ellos

/
declare
    v_num int;
    v_num1 int;
    v_num2 int;
    v_mayor int;
    v_menor int;
    v_intermedio int;
    v_suma int;
begin
    v_num := &numero;
    v_num1 := &numero1;
    v_num2 := &numero2;
    if (v_num > v_num1 and v_num > v_num2) then
        v_mayor := v_num;
    elsif (v_num1 > v_num and v_num1 > v_num2) then
        v_mayor := v_num1;
    else v_mayor := v_num2;
    end if;
    if (v_num < v_num1 and v_num < v_num2) then
        v_menor := v_num;
    elsif (v_num1 < v_num and v_num1 < v_num2) then
        v_menor := v_num1;
    else v_menor := v_num2;
    end if; 
    v_suma := v_num + v_num1 + v_num2;
    v_intermedio := v_suma - v_mayor - v_menor;
    dbms_output.put_line('Mayor: ' || v_mayor);
    dbms_output.put_line('Menor: ' || v_menor);
    dbms_output.put_line('Intermedio: ' || v_intermedio);
end;
/
undefine numero;
undefine numero1;
undefine numero2;

