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


