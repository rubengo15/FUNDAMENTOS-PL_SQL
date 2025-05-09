--3.	Crear un procedimiento almacenado para la posible incorporación de un cliente. En el procedimiento almacenado paremos tantos parámetros como campos tenga la tabla.
/
CREATE OR REPLACE PROCEDURE insertar_cliente(
  p_idcliente     IN CLIENTES.IDCLIENTE%TYPE,
  p_nombre        IN CLIENTES.NOMBRE%TYPE,
  p_direccion     IN CLIENTES.DIRECCION%TYPE,
  p_email         IN CLIENTES.EMAIL%TYPE,
  p_cpostal       IN CLIENTES.CPOSTAL%TYPE,
  p_paginaweb     IN CLIENTES.PAGINAWEB%TYPE,
  p_imagen_cliente IN CLIENTES.IMAGEN_CLIENTE%TYPE
) AS
BEGIN
  INSERT INTO CLIENTES (IDCLIENTE, NOMBRE, DIRECCION, EMAIL, CPOSTAL, PAGINAWEB, IMAGEN_CLIENTE)
  VALUES (p_idcliente, p_nombre, p_direccion, p_email, p_cpostal, p_paginaweb, p_imagen_cliente);
  
  COMMIT;
END insertar_cliente;
/
/
BEGIN
  insertar_cliente(
    50,
    'JUAN PEREZ',
    'C/ Ejemplo 123',
    'juanperez@example.com',
    12345,
    'http://www.juanperez.com',
    'juanperez.jpg'
  );
END;
/

-- 4.	Crear un procedimiento que nos devuelva el precio de una película (pasándole el idPelicula como parámetro de entrada).
/
CREATE OR REPLACE PROCEDURE obtener_precio_pelicula (
  p_idpelicula IN PELICULAS.IDPELICULA%TYPE,
  p_precio OUT PELICULAS.PRECIO%TYPE
) AS
BEGIN
  SELECT Precio
  INTO p_precio
  FROM Peliculas
  WHERE IdPelicula = p_idpelicula;
END obtener_precio_pelicula;
/
/
DECLARE
  v_precio PELICULAS.PRECIO%TYPE;
BEGIN
  obtener_precio_pelicula(32, v_precio);
  DBMS_OUTPUT.PUT_LINE('Precio de la película: ' || v_precio);
END;
/

-- 5.	Crear un procedimiento para modificar el email y dirección de un cliente.
/
CREATE OR REPLACE PROCEDURE actualizar_cliente(
  p_idcliente   IN CLIENTES.IDCLIENTE%TYPE,
  p_direccion   IN CLIENTES.DIRECCION%TYPE,
  p_email       IN CLIENTES.EMAIL%TYPE
) AS
BEGIN
  UPDATE CLIENTES
  SET DIRECCION = p_direccion,
      EMAIL = p_email
  WHERE IDCLIENTE = p_idcliente;
  
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No existe cliente con ID: ' || p_idcliente);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Cliente actualizado correctamente.');
  END IF;
  COMMIT;
END actualizar_cliente;
/
/
BEGIN
  actualizar_cliente(10, 'C/ Nueva Direccion 123', 'nuevoemail@ejemplo.com');
END;
/

-- 6.	Crear una función en la que introduciendo el nombre de un distribuidor, nos devuelva el teléfono del mismo.

CREATE OR REPLACE FUNCTION obtener_telefono_distribuidor (
  p_distribuidor IN DISTRIBUIDORAS.DISTRIBUIDOR%TYPE
) RETURN DISTRIBUIDORAS.TELEFONO%TYPE
IS
  v_telefono DISTRIBUIDORAS.TELEFONO%TYPE;
BEGIN
  SELECT TELEFONO
  INTO v_telefono
  FROM DISTRIBUIDORAS
  WHERE DISTRIBUIDOR = p_distribuidor;
  RETURN v_telefono;
END obtener_telefono_distribuidor;
/
DECLARE
  v_telefono DISTRIBUIDORAS.TELEFONO%TYPE;
BEGIN
  v_telefono := obtener_telefono_distribuidor('SONY PICTURES');
  DBMS_OUTPUT.PUT_LINE('Telefono: ' || v_telefono);
END;
/

-- 7.	Desarrollar una función en la que al pasarle un título de película nos devuelva la duración.
/
create or replace function f_duracion_pelicula (
p_titulo in peliculas.TITULO%type
) return peliculas.DURACION%type
is
  v_duracion peliculas.duracion%type;
begin
  select duracion into v_duracion from peliculas where TITULO = p_titulo;
  return v_duracion;
end f_duracion_pelicula;
/
declare 
  v_duracion peliculas.duracion%type;
begin
  v_duracion := f_duracion_pelicula ('Los Otros');
  dbms_output.put_line('La duracion de la peli es: ' || v_duracion);
end;
/
-- 8.	Devolver mediante un parámetro de salida el importe total de todos los pedidos de un cliente. (Pasar como parámetro de entrada el IdCliente).
/
create or replace procedure sp_pedidos_cliente
(p_idcliente in pedidos.IdCliente%type, p_importe out number)
as
begin
  select sum(precio) into p_importe from pedidos where IdCliente = p_idcliente;
  DBMS_OUTPUT.PUT_LINE('El importe total de los pedidos del cliente ' || p_idcliente || ' es: ' || p_importe);
end sp_pedidos_cliente;
/
DECLARE
  v_importe NUMBER;
BEGIN
  sp_pedidos_cliente(1, v_importe);
  DBMS_OUTPUT.PUT_LINE('Importe total de pedidos: ' || v_importe);
END;
/

-- 9.	Crear un procedimiento que recupere la nacionalidad y la bandera (dos parámetros de salida) de un determinado IdNacionalidad. 
/
create or replace procedure sp_nacionalidad_bandera
(p_idnacionalidad in nacionalidad.IdNacionalidad%type, p_nacionalidad out nacionalidad.nacionalidad%type, p_bandera out nacionalidad.bandera%type)
as
begin
  select nacionalidad, bandera into p_nacionalidad, p_bandera from nacionalidad where IdNacionalidad = p_idnacionalidad;
  dbms_output.put_line('El siguiente ID: ' || p_idnacionalidad || ' tiene la nacionalidad de ' || p_nacionalidad || ' y su bandera es ' || p_bandera);
end sp_nacionalidad_bandera;
/
select * from nacionalidad;
/
declare
  p_idnacionalidad nacionalidad.IdNacionalidad%type;
  p_nacionalidad nacionalidad.Nacionalidad%type;
  p_bandera nacionalidad.Bandera%type;
begin
  sp_nacionalidad_bandera(2, p_nacionalidad,p_bandera);
end;

-- 10.	Crear un procedimiento almacenado con un parámetro de entrada, este procedimiento debe almacenar en una variable de tipo registro el Titulo, duración y precio de la película que pasamos como parámetro. Imprimir la información dentro del procedimiento almacenado para comprobar que es correcto.
/
create or replace procedure sp_peliculas
(p_idpelicula in peliculas.idPelicula%type)
as
type type_peliculas is record (titulo peliculas.titulo%type, duracion peliculas.duracion%type, precio peliculas.precio%type);
v_pelicula type_peliculas;
begin
  select titulo, duracion, precio into v_pelicula from peliculas where idPelicula = p_idpelicula;
  DBMS_OUTPUT.PUT_LINE('Título: ' || v_pelicula.titulo);
  DBMS_OUTPUT.PUT_LINE('Duración: ' || v_pelicula.duracion || ' minutos');
  DBMS_OUTPUT.PUT_LINE('Precio: ' || v_pelicula.precio || ' euros');
end sp_peliculas;
/
BEGIN
  sp_peliculas(32); 
END;
/
-- 11.	Crear un procedimiento almacenado que visualice todos los datos de un  cliente, introduciendo el número de cliente como parámetro de entrada. El programa debe mostrar un mensaje si el número de empleado no existe. Utilizar la excepción NO_DATA_FOUND.
select * from clientes;
/
CREATE OR REPLACE PROCEDURE mostrar_cliente (
  p_idcliente IN CLIENTES.IDCLIENTE%TYPE
) AS
  -- Definir un tipo RECORD local con todos los campos de CLIENTES
  v_cliente CLIENTES%ROWTYPE;
BEGIN
  -- Obtener todos los datos del cliente
  SELECT *
  INTO v_cliente
  FROM CLIENTES
  WHERE IDCLIENTE = p_idcliente;
  
  -- Mostrar los datos
  DBMS_OUTPUT.PUT_LINE('ID Cliente: ' || v_cliente.IDCLIENTE);
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_cliente.NOMBRE);
  DBMS_OUTPUT.PUT_LINE('Dirección: ' || v_cliente.DIRECCION);
  DBMS_OUTPUT.PUT_LINE('Email: ' || v_cliente.EMAIL);
  DBMS_OUTPUT.PUT_LINE('Código Postal: ' || v_cliente.CPOSTAL);
  DBMS_OUTPUT.PUT_LINE('Página Web: ' || v_cliente.PAGINAWEB);
  DBMS_OUTPUT.PUT_LINE('Imagen Cliente: ' || v_cliente.IMAGEN_CLIENTE);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existe ningún cliente con ID: ' || p_idcliente);
END mostrar_cliente;
/
BEGIN
  mostrar_cliente(666); -- ejemplo para cliente con ID 10
END;
/

-- 12.	Procedimiento almacenado con un parámetro de entrada y salida al mismo tiempo que devuelva el precio de una película. Pasaremos como parámetro de entrada el IDPELICULA.
CREATE OR REPLACE PROCEDURE obtener_precio_pelicula_inout (
  p_idpelicula IN OUT PELICULAS.IDPELICULA%TYPE
) AS
  v_precio PELICULAS.PRECIO%TYPE;
BEGIN
  SELECT PRECIO
  INTO v_precio
  FROM PELICULAS
  WHERE IDPELICULA = p_idpelicula;
  
  -- Asignar el precio al mismo parámetro
  p_idpelicula := v_precio;
  
  DBMS_OUTPUT.PUT_LINE('El precio de la película es: ' || p_idpelicula);
END obtener_precio_pelicula_inout;
/
DECLARE
  v_idpelicula PELICULAS.IDPELICULA%TYPE := 32; -- ID de película que queremos consultar
BEGIN
  obtener_precio_pelicula_inout(v_idpelicula);
  DBMS_OUTPUT.PUT_LINE('Precio devuelto: ' || v_idpelicula);
END;
/

-- 13.	Crear un registro para almacenar el email, página web y teléfono de un distribuidor.
select * from distribuidoras;
/
declare
  type type_distribuidor is record (email distribuidoras.email%type, paginaweb distribuidoras.paginaweb%type, telefono distribuidoras.telefono%type);
  v_distribuidor type_distribuidor;
begin
  select email, paginaweb, telefono into v_distribuidor from distribuidoras WHERE iddistribuidor = 1;
  dbms_output.put_line('Email: ' || v_distribuidor.email || ' Pagina web: ' || v_distribuidor.paginaweb || ' Telefono: ' || v_distribuidor.telefono);
end;

-- 14.	Guardar en un Varray el título de las películas cuyo género sea acción (o el género que tengáis insertado). 
/
DECLARE
  TYPE TituloTabla IS TABLE OF VARCHAR2(255) INDEX BY BINARY_INTEGER;
  v_array_titulos TituloTabla;
  v_index NUMBER := 1;
BEGIN
  FOR rec IN (
    SELECT TITULO
    FROM PELICULAS p
    JOIN GENEROS g ON p.IDGENERO = g.IDGENERO
    WHERE UPPER(g.GENERO) = 'ACCION'
  ) LOOP
    v_array_titulos(v_index) := rec.TITULO;
    v_index := v_index + 1;
  END LOOP;
  
  -- Mostrar contenido
  FOR i IN 1 .. v_array_titulos.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Título ' || i || ': ' || v_array_titulos(i));
  END LOOP;
END;
/

-- 15.	Declarar una variable de tipo tabla y guardar los números pares del 1 al 200. Imprimir los valores en pantalla.
/
DECLARE
  -- Definir un arreglo asociativo (tabla indexada) de números
  TYPE numeros_tabla IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  numeros numeros_tabla; 

BEGIN
  -- Llenar la tabla con los números pares del 1 al 200
  FOR i IN 1..100 LOOP
    numeros(i) := i * 2;  -- almacena 2, 4, 6, ..., 200
  END LOOP;

  -- Imprimir cada número guardado en la tabla asociativa
  FOR i IN numeros.FIRST..numeros.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(numeros(i));
  END LOOP;
END;
/

