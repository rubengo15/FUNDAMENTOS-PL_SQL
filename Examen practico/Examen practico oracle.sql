create table peliculas 
    (IDPELICULA NUMBER NOT NULL, 
    IDDISTRIBUIDOR NUMBER, 
    IDGENERO NUMBER, 
    TITULO VARCHAR2(50), 
    IDNACIONALIDAD NUMBER, 
    ARGUMENTO VARCHAR2(250), 
    FOTO VARCHAR2(50), 
    FECHA_ESTRENO DATE, 
    ACTORES VARCHAR2(50), 
    DIRECTOR VARCHAR2(50), 
    DURACION NUMBER, 
    PRECIO NUMBER);

alter table peliculas add constraint pk_peliculas primary key (IdPelicula);

create table distribuidoras
    (IDDISTRIBUIDOR NUMBER NOT NULL, 
    DISTRIBUIDOR VARCHAR2(50), 
    DIRECCION VARCHAR2(50), 
    EMAIL VARCHAR2(50), 
    PAGINAWEB VARCHAR2(50), 
    TELEFONO NUMBER, 
    CONTACTO VARCHAR2(50), 
    LOGO VARCHAR2(50));

alter table distribuidoras add constraint pk_distribuidoras primary key (IdDistribuidor);

create table generos
   (IDGENERO NUMBER NOT NULL, 
    GENERO VARCHAR2(50));

alter table generos add constraint pk_generos primary key (IdGenero);

create table nacionalidad
   (IDNACIONALIDAD NUMBER NOT NULL, 
    NACIONALIDAD VARCHAR2(50), 
    BANDERA VARCHAR2(50));

alter table nacionalidad add constraint pk_nacionalidad primary key (IdNacionalidad);

create table pedidos
   (IDPEDIDO NUMBER NOT NULL,
    IDCLIENTE NUMBER, 
    IDPELICULA NUMBER, 
    CANTIDAD NUMBER, 
    FECHA DATE, 
    PRECIO NUMBER);

alter table pedidos add constraint pk_pedidos primary key (idpedido);

create table clientes
   (IDCLIENTE NUMBER NOT NULL, 
    NOMBRE VARCHAR2(50), 
    DIRECCION VARCHAR2(50), 
    EMAIL VARCHAR2(50), 
    CPOSTAL NUMBER, 
    PAGINAWEB VARCHAR2(50), 
    IMAGEN_CLIENTE VARCHAR2(50));

alter table clientes add constraint pk_clientes primary key (IdCliente);

-- FOREIGN KEY --

alter table peliculas add constraint fk_peliculas_distribuidoras foreign key (iddistribuidor) references distribuidoras (iddistribuidor);

alter table peliculas add constraint fk_peliculas_generos foreign key (idgenero) references generos (idgenero);

alter table peliculas add constraint fk_peliculas_nacionalidad foreign key (idnacionalidad) references nacionalidad (idnacionalidad);

alter table pedidos add constraint fk_pedidos_clientes foreign key (idcliente) references clientes (idcliente);

alter table pedidos add constraint fk_pedidos_peliculas foreign key (idpelicula) references peliculas (idpelicula);


------------------------- INSERTAR CAMPOS A LAS TABLAS -----------------------------------------

Insert into peliculas (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (1,2,3,'EL EXAMEN',1,'ELEXAMEN.JPG',SYSDATE,'RUBEN',90,10,'FSAGFASDGAEGDSAGEDGEEDGEGEG','NADIE');
Insert into peliculas (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (2,2,3,'EL EXAMEN 1',1,'ELEXAMEN2.JPG',SYSDATE,'RUBEN 2',95,15,'GSDGFAFGAFWASFWSAFWAFWAFAF','NADIE X 2');
Insert into peliculas (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (3,4,1,'EL EXAMEN 2',2,'ELEXAMEN3.JPG',SYSDATE,'RUBEN 3',100,20,'GFESAGEAGESDGESGHEDGEGE','NADIE X 3');
Insert into peliculas (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (4,4,1,'EL EXAMEN 3',2,'ELEXAMEN4.JPG',SYSDATE,'RUBEN 4',105,25,'DHGSGAEG<EGWSE<G<EWSGES<G<EWSGEEGG','NADIE X 4');

Insert into distribuidoras (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (1,'PELIS EXAMEN','C\ AMARGURA 1','PE@GMAIL.COM','HTTP://WWW.EXAMEN.ES',915555555,'CONTACTO','FOTO.JPG');
Insert into distribuidoras (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (2,'EXAMEN PELIS','C\ AMARGURA 2','EP@GMAIL.COM','HTTP://WWW.EXAMEN.ES',916666666,'CONTACTO','FOTO1.JPG');
Insert into distribuidoras (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (3,'PELIS EXAMEN1','C\ AMARGURA 1','PE1@GMAIL.COM','HTTP://WWW.EXAMEN.ES',917777777,'CONTACTO','FOTO2.JPG');
Insert into distribuidoras (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (4,'EXAMEN PELIS1','C\ AMARGURA 2','EP1@GMAIL.COM','HTTP://WWW.EXAMEN.ES',918888888,'CONTACTO','FOTO3.JPG');

Insert into generos (IDGENERO,GENERO) values (1,'HUMOR');
Insert into generos (IDGENERO,GENERO) values (2,'DRAMA');
Insert into generos (IDGENERO,GENERO) values (3,'ACCION');
Insert into generos (IDGENERO,GENERO) values (4,'TERROR');

Insert into nacionalidad (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (1,'ESPAÑA','ESPANA.JPG');
Insert into nacionalidad (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (2,'FRANCIA','FRANCIA.JPG');
Insert into nacionalidad (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (3,'ALEMANIA','ALEMANIA.JPG');
Insert into nacionalidad (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (4,'ITALIA','ITALIA.JPG');

Insert into clientes (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (1,'JUAN','C/ PARDO 1','JUAN@GMAIL.COM',28690,'HTTP://WWW.EXAMEN.ES','JUAN.JPG');
Insert into clientes (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (2,'PEPE','C/ PARDO 2','PEPE@GMAIL.COM',28690,'HTTP://WWW.EXAMEN.ES','PEPE.JPG');
Insert into clientes (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (3,'PACO','C/ PARDO 3','PACO@GMAIL.COM',28690,'HTTP://WWW.EXAMEN.ES','PACO.JPG');
Insert into clientes (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (4,'MANOLO','C/ PARDO 4','MANOLO@GMAIL.COM',28690,'HTTP://WWW.EXAMEN.ES','MANOLO.JPG');

Insert into pedidos (IDPEDIDO,IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (10,1,1,1,SYSDATE,10);
Insert into pedidos (IDPEDIDO,IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (11,2,2,2,SYSDATE,15);
Insert into pedidos (IDPEDIDO,IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,3,3,3,SYSDATE,20);
Insert into pedidos (IDPEDIDO,IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (13,4,4,4,SYSDATE,25);


select * from clientes;
select * from distribuidoras;
select * from generos;
select * from nacionalidad;
select * from pedidos;
select * from peliculas;

------------------------------------EJERCICIOS-----------------------------------------------

-- 3) Crear un procedimiento almacenado para la posible incorporación de un cliente. En el procedimiento almacenado pasaremos tantos parámetros como campos tenga la tabla.
select * from clientes;
/
create or replace procedure insertar_cliente
    (p_idcliente clientes.idcliente%type,
    p_nombre clientes.nombre%type,
    p_direccion clientes.direccion%type,
    p_email clientes.email%type,
    p_cpostal clientes.cpostal%type,
    p_paginaweb clientes.paginaweb%type,
    p_imagen_cliente clientes.imagen_cliente%type) 
as
begin
    insert into clientes (IDCLIENTE, NOMBRE, DIRECCION, EMAIL, CPOSTAL, PAGINAWEB, IMAGEN_CLIENTE)
    values (p_idcliente, p_nombre, p_direccion, p_email, p_cpostal, p_paginaweb, p_imagen_cliente);
    commit;
end;
/
begin
    insertar_cliente (5,'RAUL','C/ PARDO 5','RAUL@GMAIL.COM',28690,'HTTP://WWW.EXAMEN.ES','RAUL.JPG');
end;
/
-- 4) Crear una función que nos devuelva el precio de una película (pasándole el idPelicula como parámetro de entrada).
select idpelicula, precio from peliculas;

/
create or replace procedure obtener_precio_pelicula 
    (p_idpelicula peliculas.idpelicula%type,
    p_precio OUT peliculas.precio%type) 
as
begin
    select precio into p_precio from peliculas where IdPelicula = p_idpelicula;
END;
/
declare
    v_precio peliculas.precio%type;
begin
    obtener_precio_pelicula(1, v_precio);
    DBMS_OUTPUT.PUT_LINE('Precio de la película: ' || v_precio);
end;
/

-- 5) Crear un procedimiento para modificar el email y dirección de un cliente.
select * from clientes;
/
create or replace procedure modificar_cliente
    (p_idcliente clientes.idcliente%type,
    p_direccion clientes.direccion%type,
    p_email clientes.email%type) 
as
begin
    update clientes set direccion = p_direccion, email = p_email where idcliente = p_idcliente;
    if sql%rowcount = 0 then
        dbms_output.put_line('No existe cliente con ID: ' || p_idcliente);
    else
        dbms_output.put_line('Cliente modificado correctamente.');
    end if;
    commit;
end;

/
begin
  modificar_cliente(5, 'C/ PARDO 6', 'RAUL7@GMAIL.COM');
  modificar_cliente(6, 'C/ PARDO 6', 'RAUL7@GMAIL.COM');
end;
/

-- 6) Desarrollar una función en la que al pasarle un título de película nos devuelva la duración.
select * from peliculas;

/
create or replace function f_duracion_pelicula 
    (p_titulo peliculas.titulo%type)
    return peliculas.duracion%type
is
    v_duracion peliculas.duracion%type;
begin
    select duracion into v_duracion from peliculas where titulo = p_titulo;
    return v_duracion;
end;
/
declare 
  v_duracion peliculas.duracion%type;
begin
  v_duracion := f_duracion_pelicula ('EL EXAMEN');
  dbms_output.put_line('La duracion de la peli es: ' || v_duracion);
end;
/

-- 7) Crear una vista que nos muestre los siguientes datos de las películas:  Título, Fecha, Actores, Argumento, Nombre del género y nombre de la nacionalidad.
select * from peliculas;
select * from generos;
select * from nacionalidad;
/
create or replace view vista_peliculas
as
select peliculas.titulo,peliculas.fecha_estreno as fecha, peliculas.actores ,peliculas.argumento, generos.genero as nombre_del_genero, nacionalidad.nacionalidad as nombre_nacionalidad
from peliculas join generos ON peliculas.idgenero = generos.idgenero join nacionalidad ON peliculas.idnacionalidad = nacionalidad.idnacionalidad;
/
select * from vista_peliculas;
/
-- 8) Crear procedimiento con un cursor que muestre todos los datos de la vista anterior con un bucle FOR.  (Mostrar el título, el nombre del género y la nacionalidad)

create or replace procedure mostrar_peliculas is
begin
    for v_peliculas in 
    (select titulo, nombre_del_genero, nombre_nacionalidad from vista_peliculas)
    loop
        dbms_output.put_line('Título: ' || v_peliculas.titulo || ' Genero: ' || v_peliculas.nombre_del_genero || ' Nacionalidad: ' || v_peliculas.nombre_nacionalidad);
    end loop;
end;
/
begin
    mostrar_peliculas;
end;
