-- Ejemplos de Bucles

-- 1) LOOP..END LOOP
-- Vamos a mostrar la suma de los primeros 100 numeros
/
DECLARE
    -- Variables conador suelen denominarse con una sola letra: i, z, k...
    i int;
    suma int;
begin
    -- Debemos iniciar la variable (i), sino sera null
    i := 1;
    -- Inicializamos (suma)
    suma := 0;
    loop 
        -- intsrucciones
        suma := suma + i;
        -- incrementamos lavariable (i)
        i := i + 1;
        -- Debemos indicar cuando queremos que el bucle finalice
        exit when i > 100;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 numeros es: ' || suma);
end;
/


-- 2) WHILE..LOOP
-- LA CONDICION SE EVALUA ANTES DE ENTRAR

/
DECLARE
    i int;
    suma int;
begin
    -- Debemos iniciar las variables
    i := 1;
    suma := 0;
    while i <= 100 loop -- Si no añadimos el (=) nos calcula solo hasta el 99
        -- Insrucciones
        suma := suma + i;
        i := i + 1;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 numeros es: ' || suma);
END;
/


-- 3) FOR..LOOP (CONTADOR)
-- Lo usamos cuando sabemos el inicio y el fin

/
declare 
    suma int;
begin
    suma := 0;
    for i in 1..100 loop
        suma := suma + i;
    end loop;
    dbms_output.put_line('La suma de los primeros 100 numeros es: ' || suma);
end;
/


-- 4) ETIQUETAS - GOTO
-- Ejemplo de GOTO - Etiquetas

/
declare 
    suma int;
begin
    suma := 0;
    dbms_output.put_line('inicio');
    goto codigo;
    dbms_output.put_line('antes del bucle');
    for i in 1..100 loop
        suma := suma + i;
    end loop;
    <<codigo>>
    dbms_output.put_line('despues del bucle');
    dbms_output.put_line('La suma de los primeros 100 numeros es: ' || suma);
end;
/

-- 5) Orden NULL

/
declare
    i int;
begin
    i := 1;
    if (i >= 1) then
        dbms_output.put_line('i es mayor a 1');
    else
        null;
    end if;
end;
/




-- Ejemplos
-- Bucle para msotrar los numeros entre 1 y 10
-- 1) Bucle while
/
declare
    i int;
begin
    i := 1;
    while i <= 10 loop
        dbms_output.put_line('numeros entre el 1 y el 10 son ' || i );
        i := i + 1;
    end loop;
end;
/

-- 2) Bucle For
/
declare
    
begin
    
    for i in 1..10 loop
        dbms_output.put_line('numeros entre el 1 y el 10 son ' || i );
    end loop;
end;
/


-- Pedir al usuario un numero inicial &inicio y un numero final
-- Mostrar los numeros comprendidos entre dichos rangos
/
declare
    inicio int;
    fin int;
begin
    inicio := &inicio;
    fin := &final;
    for a in inicio..fin loop
    dbms_output.put_line('numeros que hay entre medias de ' || inicio || ' y ' || fin || ' son: ' || a);
    end loop;
end;
/
undefine inicio;
undefine final;

-- Si el numero inicial es mayor, lo indicamos y no hacemos el bucle
/
declare
    inicio int;
    fin int;
begin
    inicio := &inicio;
    fin := &final;
    -- Preguntamos por los valores de los numeros
    if (inicio >= fin) then
        dbms_output.put_line('El numero de inicio ( ' || inicio || ') debe ser menor al numero de fin (' || fin || ')');
    else
        for a in inicio..fin loop
            dbms_output.put_line('numeros que hay entre medias de ' || inicio || ' y ' || fin || ' son: ' || a);
        end loop;
    end if;
end;
/
undefine inicio;
undefine final;


-- Queremos un bucle pidiendo un inicio y un fin
-- Mostrar los numeros pares comprendidos enre dicho inicio y fin
/
declare
    inicio int;
    fin int;
begin
    inicio := &inicio;
    fin := &final;
    -- Preguntamos por los valores de los numeros
    if (inicio >= fin) then
        dbms_output.put_line('El numero de inicio ( ' || inicio || ') debe ser menor al numero de fin (' || fin || ')');
    else
        for a in inicio..fin loop
            if (mod (a, 2) = 0) then
            dbms_output.put_line('numeros pares que hay entre medias de ' || inicio || ' y ' || fin || ' son: ' || a);
            end if;
        end loop;
    end if;
end;
/
undefine inicio;
undefine final;

-- Congetura de Collatz
-- La teoria de que cualquier numero siempre llegara a ser 1 siguiendo una serie de instrucciones
-- Las instrucciones son: Si el numero es par se divide entre 2, si el numero es impar se multiplica por 3 y sumamos 1
-- ejemplo: 6,3,10,5,16,8,4,2=1

/ 
declare
    numero int;
begin
    numero := &numero;
    while (numero <> 1) loop
    -- Averiguamos si es par o impar
        if (mod (numero, 2) = 0) then
            numero := numero / 2;
        else
            numero := (numero * 3) + 1;
        end if;
        dbms_output.put_line (numero);
    end loop;
end;
/
undefine numero;


-- Mostrar la tabla de multiplicar de un numero que pidamos al usuario
/ 
declare
    numero int;
    mult int;
    total int;
begin
    numero := &numero;
    mult := 0;
    loop
    mult := mult + 1;
    total := mult * numero;
    dbms_output.put_line(numero || '*' || mult || '=' || total);
    exit when mult = 10;
    end loop;
end;
/

-- Otra forma de hacerlo

/
declare 
    numero int;
    total int;
begin
    numero := &numero;
    for i in 1..10 loop
        total := numero * i;
        dbms_output.put_line(numero || '*' || i || '=' || total);
    end loop;
end;
/
undefine numero;


-- Quiero un programa que nos pedira un texto, debemos recorrer dicho texto letra a letra. Es decir, mostrar cada letra de forma individual.

/
declare
    v_texto varchar2(50);
    v_longitud int;
    v_letra varchar2(1);
begin
    v_texto := '&texto';
    -- Un elemento en oracle empieza en 1
    -- En un lugar de la mancha...
    v_longitud := LENGTH(v_texto);
    for i in 1..v_longitud loop
        v_letra := SUBSTR (v_texto,i,1);
        dbms_output.put_line(v_letra);
    end loop;
end;
/
undefine texto;

-- Necesito un programa donde introducir un texto numerico: 1234
-- Necesito mostrar la suma de todos los caracteres numericos en un mensaje

/
declare
    v_texto varchar2(50);
    v_longitud int;
    v_letra CHAR(1);
    v_numero int;
    v_suma int;
begin
    v_suma := 0;
    v_texto := &texto;
    v_longitud := LENGTH(v_texto);
    for i in 1..v_longitud loop
        v_letra := SUBSTR (v_texto,i,1);
        v_numero := TO_NUMBER(v_letra);
        v_suma := v_suma + v_numero;
    end loop;
    dbms_output.put_line(v_suma);
end;
/
undefine texto;


