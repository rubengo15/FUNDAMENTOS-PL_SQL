DROP TABLE CLIENTES CASCADE CONSTRAINTS;
DROP TABLE DISTRIBUIDORAS CASCADE CONSTRAINTS;
DROP TABLE GENEROS CASCADE CONSTRAINTS;
DROP TABLE NACIONALIDAD CASCADE CONSTRAINTS;
DROP TABLE PEDIDOS CASCADE CONSTRAINTS;
DROP TABLE PELICULAS CASCADE CONSTRAINTS;

  CREATE TABLE CLIENTES
   (  IDCLIENTE NUMBER(11,0) NOT NULL, 
  NOMBRE VARCHAR2(50), 
  DIRECCION VARCHAR2(50), 
  EMAIL VARCHAR2(50 CHAR), 
  CPOSTAL NUMBER(11,0), 
  PAGINAWEB VARCHAR2(50 CHAR), 
  IMAGEN_CLIENTE VARCHAR2(50)
   );


  CREATE TABLE DISTRIBUIDORAS
   (  IDDISTRIBUIDOR NUMBER(11,0) NOT NULL, 
  DISTRIBUIDOR VARCHAR2(50), 
  DIRECCION VARCHAR2(50), 
  EMAIL VARCHAR2(50), 
  PAGINAWEB VARCHAR2(50), 
  TELEFONO NUMBER(11,0), 
  CONTACTO VARCHAR2(50), 
  LOGO VARCHAR2(50)
   );
 


  CREATE TABLE GENEROS 
   (  IDGENERO NUMBER(11,0) NOT NULL, 
  GENERO VARCHAR2(50)
   );



  CREATE TABLE NACIONALIDAD
   (  IDNACIONALIDAD NUMBER(11,0) NOT NULL, 
  NACIONALIDAD VARCHAR2(50), 
  BANDERA VARCHAR2(50));


 

  CREATE TABLE PEDIDOS
   (  IDCLIENTE NUMBER(11,0), 
  IDPELICULA NUMBER(11,0), 
  CANTIDAD NUMBER(11,0) DEFAULT 0, 
  FECHA DATE, 
  PRECIO NUMBER(11,0) DEFAULT 0);



  CREATE TABLE PELICULAS
   (  IDPELICULA NUMBER(11,0) NOT NULL, 
  IDDISTRIBUIDOR NUMBER(11,0), 
  IDGENERO NUMBER(11,0), 
  TITULO VARCHAR2(255), 
  IDNACIONALIDAD NUMBER(11,0) DEFAULT 0, 
  ARGUMENTO CLOB, 
  FOTO VARCHAR2(50), 
  FECHA_ESTRENO DATE, 
  ACTORES CLOB, 
  DIRECTOR VARCHAR2(50), 
  DURACION NUMBER(11,0) DEFAULT 0, 
  PRECIO NUMBER(5,0) DEFAULT 0);
 
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (1,'DELORIAN','C/ Paseo Castellana, 150','blockbuster@video.es',28020,'http://www.delorian.es','delorian.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (2,'RICARDO TUBBS','C/ Islas Canarias, 19','miamivice@video.es',28020,'http://www.ricardotubss.es','tubbs.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (3,'ARENALES','C/ Rosalia, 22','arenales@rosarosae.es',24800,'http://www.arenales.es','arenales.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (4,'JOHNNY UTAH','C/ Piratas, 78','bodhi@pirata.es',66666,'http://www.lellamanbodhi.es','utah.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (5,'PINKY WINKI','C/ Olimpo, 25','pinkywinki@musas.es',78524,'http://www.pinkywinki.es','pinky.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (6,'OPTIMUS PRIME','C/ Transformers, 1','transformers@dvd.es',50212,'http://www.flufy.es','optimusprime.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (7,'MICHAEL SCOFIELD','C/ Anton, 16','teabag@esfera.es',58214,'http://www.lincolnbarrows.es','scodfield.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (8,'CORONEL BRADDOCK','C/ Desaparecido, 80','chucknorris@braddock.es',3663,'http://www.braddock.es','braddock.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (9,'MADMARTIGAN','C/ Dramoga, 91','willow@dramoga.es',55555,'http://www.madmartigan.es','Madmartigan.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (10,'JESUS QUINTANA','C/ Lebowsky, 19','granlebowski@quintana.es',89565,'http://www.jesusquintana.es','jesusquintana.gif');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (11,'MICHAEL KNIGHT','C/ Fantastic car, 21','michaelknight@ninonino.com',3954,'http://www.michaelknight.es','michaelknight.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (12,'MARTY MACFLY','C/ Emmet brown, 20','condensadordefluzo@macfly.es',56454,'http://www.backtothefuture.es','macfly.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (14,'JOHN CONNOR','C/ T-1000','terminator@connor.es',52154,'http://tepasmas.com/curiosidades/t2','johnconnor.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (15,'MICKEY WALS','C/ Valle Goonie, 85','miky@goonies.es',85411,'http://www.punkasspunk.com/goonies/','mikewalls.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (16,'DANIEL LARUSSO','C/ Señor Miyagi,21','danielsan@miyagi.com',3954,'http://www.karatekid.com','larusso.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (17,'CUCO','C/ Franco, 19','cuco@torrente.es',20885,'http://www.torrente.es','cuco.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (18,'ICE MAN','C/ Miramar, 1','maverick@topgun.com',3954,'http://www.topgun.com','iceman.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (19,'MIKE DONOVAN','C/ Diana, 55','milkedonovan@vvvvv.com',65455,'http://thevisitors.info','mike_donovan.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (20,'BASTIAN BALTASAR BUX','C/ Fujur, 8','fujur@neverendingstory.com',55521,'http://www.neverendingstory.com','bastian2.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (21,'CHESTER COPPERPOT','C/ Valle Wallet, 6','cazatesoros@vallegoonie.es',15999,'http://www.chestercopperpot.com','ChesterCopperpot.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (22,'DANNY ZUCO','C/ Grease, 78','grease@zuco.com',21560,'http://www.grease.com','zuco.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (23,'DYLAN MCKAY','C/ Beverly Hills, 90','dylan@cabeza.com',90210,'http://www.beverlyhills.com','90210.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (24,'JACK BURTON','C/ China, 90','littlechina@gmail.com',3954,'http://www.imdb.com/title/tt0090728/','jackburton.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (25,'MATT HOOPER','C/ Jaws, 56','tiburon@hotmail.com',81252,'http://www.filmaffinity.com/es/film242422.html','matthooper.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (26,'IAN MALCOLM','C/ Jurassic Park, 99','jurassicpark@dino.es',14566,'http://www.hoycinema.com/Parque-jurasico-1993.htm','ianmalcolm.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (27,'HARRY CALLAHAN','C/ Sucio San Francisco, 34','dirtyharry@sucio.com',89566,'http://www.dirtyharry.com','harrycallahan.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (28,'ELLEN RIPLEY','C/ Nostromo, 20','alien@octavopasajero.com',78954,'http://www.alien.com','EllenRipley.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (29,'TOM HIGHWAY','C/ Seccion reconocimiento, 46','sargentodehierro@marines.com',12345,'http://www.sargentodehierro.com','highway.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (30,'AL BUNDY','C/ Matrimonio con hijos, 89','matrimonioconhijos@albandy.com',78956,'http://www.matrimonioconhijos.com','Albundy.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (31,'MARK LENDERS','C/ Tiro mortal, 42','campeones@oliveraton.com',78954,'http://www.losmagosdelbalon.com','marklenders.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (32,'ZACK MORRIS','C/ Salvados por la campana, 65','kellykapowsky@zackmorris.com',78956,'http://www.savedbythebell.com','zackmorris.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (33,'IVAN DRAGO','C/ Rusia, 23','rockyIV@sovietica.com',78956,'http://www.rocky4.com','ivandrago.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (34,'CARLTON BANKS','C/ Bel Air, 21','principebelair@carlton.com',17895,'http://www.thefreshprince.com','carltonbanks.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (35,'BALKI BARTOKOMOUS','C/ Primos Lejanos, 98','primobalki@primoslejanos.com',14565,'http://www.primoslejanos.com','balki.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (36,'WALDO FALDO','C/ Cosas de casa, 84','waldogeraldofaldo@winslow.com',58965,'http://www.waldofaldo.com','waldofaldo.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (37,'PAUL PFEIFFER','C/ recuerdos, 78','aquellosmaravillososaños@pfeiffer.com',78944,'http://www.aquellosmaravillososaños.com','paulpfeiffer.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (38,'TEMPLETON PECK','C/ Fenix, 45','fenix@equipoA.com',12456,'http://www.elequipoA.com','templetonpecks.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (39,'BIFF TANNEN','C/ Estiercol, 56','regresoalfuturo@bifftannen.com',26987,'http://www.backtothefuture.com','bifftannen.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (40,'CAREY MAHONEY','C/ Loca academia de policia','mahoney@locaacademiadepolicia.com',32564,'http://www.locaacademiadepolicia.com','mahoney.jpg');
Insert into CLIENTES (IDCLIENTE,NOMBRE,DIRECCION,EMAIL,CPOSTAL,PAGINAWEB,IMAGEN_CLIENTE) values (41,'AXEL FOLEY','C/ Beverly Hills, 89','superdetectiveenhollywood@hotmail.com',87546,'http://www.superdetectiveenhollywood.com','axelfoley.jpg');


Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (9,'20TH CENTURY FOX','C\ Miami Vice, 19','sonnycrokett@century.es','http://www.fox.es',915555555,'Sonny Crockett','century.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (1,'SONY PICTURES','C\ Invasores, 5','mikedonovan@sony.es','http://www.sonypictures.es/',912526546,'Mike Donovan','sonypictures.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (2,'BUENA VISTA INTERNACIONAL','C\ Hollywood, 9','axelfolley@disney.com','http://www.disney.es',913849400,'Axel Foley','buenavista.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (3,'LAUREN FILMS','C\ Isla Tortuga, 205','jacksparrow@laurenfilm.es','http://www.laurenfilm.es',932553525,'Jack Sparrow','LaurenFilms.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (4,'TRIPICTURES','C\ Conejo Blanco, 6','neo@tripictures.es','http://www.tripictures-spain.com',915225252,'Neo Trinity','tripictures.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (5,'FILMAX','C\ Nuevo Papa, 19','skywalker@filmax.es','http://www.filmax.com',915424545,'Luke SkyWalker','filmax.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (6,'MANGA FILMS','C\ Halcon Milenario, 67','hansolo@mangafilms.es','http://www.mangafilms.es',935464646,'Han Solo','mangafilms.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (7,'PIXAR','C\ Coche Fantastico, 88','kit@pixar.es','http://www.pixar.com',255587489,'Michael Knight','pixar.jpg');
Insert into DISTRIBUIDORAS (IDDISTRIBUIDOR,DISTRIBUIDOR,DIRECCION,EMAIL,PAGINAWEB,TELEFONO,CONTACTO,LOGO) values (8,'WARNER BROTHERS','C\ Delorian, 8','macfly@warnerbrothers.es','http://www.warnerbros.com',917688800,'Marty MacFly','warner.jpg');


Insert into GENEROS (IDGENERO,GENERO) values (1,'Accion');
Insert into GENEROS (IDGENERO,GENERO) values (2,'Humor');
Insert into GENEROS (IDGENERO,GENERO) values (3,'Terror');
Insert into GENEROS (IDGENERO,GENERO) values (4,'Drama');
Insert into GENEROS (IDGENERO,GENERO) values (5,'Romántica');
Insert into GENEROS (IDGENERO,GENERO) values (6,'Suspense');
Insert into GENEROS (IDGENERO,GENERO) values (7,'Aventuras');
Insert into GENEROS (IDGENERO,GENERO) values (8,'Ciencia Ficción');
Insert into GENEROS (IDGENERO,GENERO) values (9,'Animación');
Insert into GENEROS (IDGENERO,GENERO) values (10,'Western');


Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (1,'EEUU','EEUU.jpg');
Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (2,'ESPAÑA','ES.jpg');
Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (3,'ALEMANIA','Alemania.jpg');
Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (4,'REINO UNIDO','UK.jpg');
Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (5,'CANADA','CA.jpg');
Insert into NACIONALIDAD (IDNACIONALIDAD,NACIONALIDAD,BANDERA) values (6,'ITALIA','IT.jpg');


Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,2,1,to_timestamp('19/02/07','DD/MM/RR HH24:MI:SSXFF'),16);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,15,2,to_timestamp('24/02/05','DD/MM/RR HH24:MI:SSXFF'),32);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,19,2,to_timestamp('24/07/08','DD/MM/RR HH24:MI:SSXFF'),48);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,32,1,to_timestamp('18/08/06','DD/MM/RR HH24:MI:SSXFF'),25);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,33,2,to_timestamp('19/08/06','DD/MM/RR HH24:MI:SSXFF'),36);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,4,4,to_timestamp('20/03/07','DD/MM/RR HH24:MI:SSXFF'),84);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,1,1,to_timestamp('22/01/05','DD/MM/RR HH24:MI:SSXFF'),14);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (1,17,3,to_timestamp('15/03/08','DD/MM/RR HH24:MI:SSXFF'),36);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (7,11,1,to_timestamp('12/12/07','DD/MM/RR HH24:MI:SSXFF'),15);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (7,16,1,to_timestamp('12/05/07','DD/MM/RR HH24:MI:SSXFF'),14);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (7,25,1,to_timestamp('01/03/08','DD/MM/RR HH24:MI:SSXFF'),18);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (7,28,1,to_timestamp('30/06/08','DD/MM/RR HH24:MI:SSXFF'),16);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (7,21,1,to_timestamp('28/06/07','DD/MM/RR HH24:MI:SSXFF'),19);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,9,3,to_timestamp('16/05/06','DD/MM/RR HH24:MI:SSXFF'),51);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,5,1,to_timestamp('06/06/08','DD/MM/RR HH24:MI:SSXFF'),21);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,6,2,to_timestamp('05/08/04','DD/MM/RR HH24:MI:SSXFF'),30);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,7,1,to_timestamp('09/10/05','DD/MM/RR HH24:MI:SSXFF'),18);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,19,2,to_timestamp('07/04/08','DD/MM/RR HH24:MI:SSXFF'),48);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (8,24,2,to_timestamp('06/05/05','DD/MM/RR HH24:MI:SSXFF'),30);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (10,3,2,to_timestamp('01/08/08','DD/MM/RR HH24:MI:SSXFF'),34);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (10,13,3,to_timestamp('27/09/05','DD/MM/RR HH24:MI:SSXFF'),60);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (10,11,1,to_timestamp('18/11/05','DD/MM/RR HH24:MI:SSXFF'),15);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (10,2,1,to_timestamp('02/09/05','DD/MM/RR HH24:MI:SSXFF'),16);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (11,2,1,to_timestamp('20/12/07','DD/MM/RR HH24:MI:SSXFF'),16);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,19,2,to_timestamp('11/08/09','DD/MM/RR HH24:MI:SSXFF'),48);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,21,3,to_timestamp('11/12/07','DD/MM/RR HH24:MI:SSXFF'),57);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,2,1,to_timestamp('10/09/02','DD/MM/RR HH24:MI:SSXFF'),21);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,9,1,to_timestamp('02/02/08','DD/MM/RR HH24:MI:SSXFF'),17);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,8,1,to_timestamp('04/04/08','DD/MM/RR HH24:MI:SSXFF'),18);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (12,5,1,to_timestamp('21/12/06','DD/MM/RR HH24:MI:SSXFF'),21);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,21,4,to_timestamp('15/08/05','DD/MM/RR HH24:MI:SSXFF'),76);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,8,1,to_timestamp('09/05/08','DD/MM/RR HH24:MI:SSXFF'),18);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,15,1,to_timestamp('06/09/03','DD/MM/RR HH24:MI:SSXFF'),16);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,18,1,to_timestamp('11/12/05','DD/MM/RR HH24:MI:SSXFF'),23);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,14,1,to_timestamp('05/07/06','DD/MM/RR HH24:MI:SSXFF'),20);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,36,2,to_timestamp('08/06/06','DD/MM/RR HH24:MI:SSXFF'),42);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,37,2,to_timestamp('07/11/04','DD/MM/RR HH24:MI:SSXFF'),38);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (15,38,3,to_timestamp('25/08/09','DD/MM/RR HH24:MI:SSXFF'),36);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (16,17,1,to_timestamp('16/09/05','DD/MM/RR HH24:MI:SSXFF'),12);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (16,22,1,to_timestamp('31/08/11','DD/MM/RR HH24:MI:SSXFF'),14);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,12,4,to_timestamp('29/06/08','DD/MM/RR HH24:MI:SSXFF'),76);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,18,2,to_timestamp('22/04/06','DD/MM/RR HH24:MI:SSXFF'),46);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,39,1,to_timestamp('20/02/08','DD/MM/RR HH24:MI:SSXFF'),15);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,40,2,to_timestamp('17/10/08','DD/MM/RR HH24:MI:SSXFF'),24);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,25,3,to_timestamp('19/10/07','DD/MM/RR HH24:MI:SSXFF'),54);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,24,3,to_timestamp('14/01/07','DD/MM/RR HH24:MI:SSXFF'),45);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (17,21,4,to_timestamp('25/12/07','DD/MM/RR HH24:MI:SSXFF'),76);
Insert into PEDIDOS (IDCLIENTE,IDPELICULA,CANTIDAD,FECHA,PRECIO) values (19,25,1,to_timestamp('19/12/04','DD/MM/RR HH24:MI:SSXFF'),18);



Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (24,3,1,'Le Llaman Bodhi',1,'lellamanbodhi.jpg',to_timestamp('19/07/91','DD/MM/RR HH24:MI:SSXFF'),'Kathryn Bigelow',125,15,'Un joven agente del FBI se introduce en los ambientes del surf como primer paso para desmantelar una organización delictiva.  Asi conoce al lider del grupo, Bodhi, un hombre que vive al límite y cuya personalidad acaba atrayendo al policía a su forma de ver el mundo.','Keanu Reeves, Patrick Swayze, Gary Busey, Lori Petty, James LeGros, John Philbin, John McGinley');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (25,4,2,'Dos tontos muy tontos',1,'dostontosmuytontos.jpg',to_timestamp('19/08/94','DD/MM/RR HH24:MI:SSXFF'),'Peter Farrelly',106,18,'Lloyd y Harry son dos amigos bastantes idiotas cuyas vidas son un auténtico desastre. El primero trabaja como chófer de una limousine, mientras que su amigo se dedica a transportar perros. Un día sus existencias se complican aún más cuando Lloyd se enamora de una chica adinerada que desaparece dejando olvidado un maletín. A partir de ese instante Lloyd embarcará a Harry en un viaje por todo el país para devolver el maletín a su amada.','Jim Carrey, Jeff Daniels, Bruce Dern, Lauren Holly, Teri Garr, Charles Rocket, Karen Duffy, Mik Starr, Victoria Rowell, Cam Neely, Felton Perry');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (26,5,1,'The Italian Job',1,'THEITALIANJOB.jpg',to_timestamp('26/09/03','DD/MM/RR HH24:MI:SSXFF'),'F. Gary Gray',104,20,'El plan era impecable... se ejecutó a la perfección... tenían libre la vía de escape. El único factor de riesgo que la mente maestra del crimen Charlie Croker (Mark Whalberg) no pudo prevenir procedía de uno de los miembros de la banda, que estaba formada por su contacto interno Steve (Edward Norton), el genio de los ordenadores Lyle (Seth Green), el conductor Rob el Guapo (Jason Statham), el experto en explosivos Oido-Izquierdo (Mos Def) y el veterano reventador de cajas fuertes John Bridger (Donald Sutherland). Después de dar un asombroso golpe millonario en un palazzo veneciano fuertemente custodiado, Charlie y la banda se quedan asombrados al descubrir que uno de ellos les ha traicionado. Ahora la cosa ya no tiene que ver con el botín sino con la venganza... Entra en escena la bella con nervios de acero Stella (Charlize Theron), una experta reventadora de cajas fuertes que se une a Charlie y a la banda cuando regresan a California en pos del traidor. Su plan para recuperar el oro es simple, recuperar lo que es suyo.','Mark Wahlberg, Edward Norton, Charlize Theron, Seth Green, Jason Statham, Donald Sutherland');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (27,6,4,'Dirty Dancing',1,'dirtydancing.jpg',to_timestamp('21/08/87','DD/MM/RR HH24:MI:SSXFF'),'Emile Ardolino',97,15,'En el verano de 1963, la joven Baby (Jennifer Gray), pasa sus vacaciones con sus padres en un resort, Una noche, ella se acerca al alojamiento de los funcionarios del lugar, encantada por la música que venia del lugar. Y es alli donde se encuentra con Johnny (Patrick Swayze), el instructor de baile del hotel, un hombre lleno de encanto y glamur. De ese encuentro, surge un irresistible romance entre los dos.','Patrick Swayze, Jennifer Grey, Cynthia Rhodes, Jerry Orbach, Jane Brucker, Jack Weston, Lonny Price');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (28,7,6,'El Efecto Mariposa',1,'elefectomariposa.jpg',to_timestamp('30/04/04','DD/MM/RR HH24:MI:SSXFF'),'Eric Bress y J. Mackye Gruber',113,16,'Evan Treborn ha perdido la noción del tiempo. Desde una edad muy temprana, momentos cruciales en su vida han desaparecido en el agujero negro del olvido; su infancia se ha visto marcada por una serie de acontecimientos aterradores que no es capaz de recordar. Lo que queda es el fantasma de los recuerdos y las vidas rotas que le rodean: las de sus amigos de la niñez, Kayleigh, Lenny y Tommy. Durante todo su infancia Evan asistió a sesiones de terapia con un psicólogo que le animaba a escribir un diario con todos los detalles de su vida cotidiana. Más adelante, en la universidad, decide leer uno de sus diarios y de repente e inexplicablemente se encuentra en el pasado. Finalmente se da cuenta de que los diarios que guarda debajo de la cama son un vehículo para regresar al pasado y recuperar sus recuerdos.','Ashton Kutcher, Amy Smart, Kevin Schmidt, Melora Walters');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (29,3,1,'Las Cronicas de Riddick',1,'lascronicasderiddick.jpg',to_timestamp('27/08/04','DD/MM/RR HH24:MI:SSXFF'),'David Twohy',115,20,'Los planetas, uno tras otro, caen ante un ejército infernal de necróferos, guerreros que en sus conquistas ofrecen una elección muy simple a los mundos que asolan: convertirse o morir. Los que se atreven a rechazar su dominio esperan en vano que alguien o algo interrumpa el progreso de los necróferos. Pero, a veces, la única forma de detener el mal no es con el bien, sino con otro tipo de demonio. No queda más remedio que sacar a una figura inesperada de su exilio y pedirle que se una a la contienda. Se trata de Riddick (Vin Diesel) al que le importa un comino quién gobierna el universo mientras le dejen tranquilo. Desde que hace años huyó de un planeta dejado de la mano de Dios (y lleno de criaturas) en el sistema planetario Tauro, el fugitivo no ha vuelto a mirar atrás. Divide su tiempo entre evitar que le cap-turen y deshacerse de los mercenarios que van tras él. Este ejército compuesto por un único hombre sólo quiere salvar el pellejo. Si alguien se cruza en su camino, no tendrá inconveniente en quitarle de en medio. Pero algo está cambiando y la futura confrontación empuja a Riddick a participar en una serie de batallas épicas donde se juega el todo por el todo.','Vin Diesel, Colm Feore, Thandie Newton, Judi Dench, Karl Urban, Alexa Davalos');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (30,5,1,'Spiderman 2',1,'spiderman2.jpg',to_timestamp('14/07/04','DD/MM/RR HH24:MI:SSXFF'),'Sam Raimi',127,21,'Han pasado dos años desde que el tranquilo Peter Parker (Tobey Maguire) dejó a su amor de toda la vida, Mary Jane Watson (Kirsten Dunst) y decidió seguir el camino de la responsabilidad como Spider-Man. Peter debe afrontar nuevos desafíos mientras lucha contra "el don y la maldición" de sus poderes equilibrando sus identidades duales como el escurridizo superhéroe Spider-Man y la vida como estudiante universitario. Las relaciones con las personas que más aprecia están ahora en peligro de ser descubiertas con la aparición del poderoso villano de múltiples tentáculos Doctor Octopus, "Doc Ock" (Alfred Molina). Su atracción de siempre por M.J. se hace incluso más fuerte mientras lucha contra el impulso de abandonar su vida secreta y declarar su amor. Mientras tanto, M.J. ha seguido con su vida. Se ha embarcado en su carrera de actriz y tiene un nuevo hombre en su vida. La relación de Peter con su mejor amigo Harry Osborn (James Franco) se ha ensombrecido por la creciente venganza de Harry contra Spider-Man, al que considera responsable de la muerte de su padre. La vida de Peter se convierte en aún más complicada cuando ha de enfrentarse con su poderoso nuevo enemigo, el Dr. Otto Octavius (Molina) - "Doc Ock". Peter debe aprender ahora a aceptar su destino y a utilizar todos sus talentos como superhéroe para detener a este loco diabólico de ocho brazos.','Tobey Maguire, Kirsten Dunst, Alfred Molina, James Franco, Elizabeth Banks, Bruce Campbell, Rosemary Harris, J.K. Simmons, Vanessa Ferlito');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (31,4,2,'Y si no, nos enfadamos',6,'y_si_no_nos_enfadamos.jpg',to_timestamp('01/01/74','DD/MM/RR HH24:MI:SSXFF'),'Marcello Fondato',92,22,'Kid y Ben, amigos pero rivales, participan en una carrera de coches cuyo premio es un estupendo "dune-buggy", un minibólido rojo con capota amarilla. Después de innumerables peripecias, Kid y Ben llegan juntos a la meta, por lo que el minibólido les pertenece a los dos. Kid propone que se lo jueguen a "cervezas y salchichas".','Terence Hill, Bud Spencer, Deogratias Huerta, John Sharp, Patty Shepard, Manuel de Blas, Luis Barbero, Donald Pleasence, Emilio Laguna');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (32,1,7,'Willow',1,'Willow.jpg',to_timestamp('05/06/88','DD/MM/RR HH24:MI:SSXFF'),'Ron Howard',120,25,'Cuento medieval con brujas, enanos y poderes mágicos. En las mazmorras del castillo de la malvada reina hechicera Bavmorda, una prisionera da a luz una niña que, de acuerdo a una antigua profecía, pondrá fin al reinado de la hechicera. La comadrona salva a la niña de la ira de Bavmorda, pero se ve obligada a arrojar su cuna al río cuando es alcanzada por sus perros de presa. La corriente le hace alcanzar un pueblo de enanos en donde es adoptada por el valiente Willow.','Val Kilmer, Joanne Whalley-Kilmer, Warwick Davis, Jean Marsh, Patricia Hayes, Billy Barty, Pat Roach');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (33,3,1,'Top Gun',1,'top_gun.jpg',to_timestamp('21/02/86','DD/MM/RR HH24:MI:SSXFF'),'Tony Scott',110,18,'El top Tom vuela y, de paso, enamora a la profe. Así de simple. De menos a más: el póster de esta entretenida película forró millones de carpetas de quinceañeras, las solicitudes para entrar en la aviación militar americana sufrieron un considerable aumento, la película (simple y vacía, comercial y previsible) se convirtió en un icono de la juventud sin ideas que había en los años ochenta, y Tom Cruise se consagró como una estrella de cine que no ha dejado de brillar.','Tom Cruise, Kelly McGillis, Tom Skerritt, Anthony Edwards, Val Kilmer, Meg Ryan, Michael Ironside, John Stockwell, Rick Rossovich, Tim Robbins');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (34,1,1,'Rambo',1,'rambo.jpg',to_timestamp('08/08/82','DD/MM/RR HH24:MI:SSXFF'),'Ted Kotcheff',97,15,'John Rambo, antiguo boina verde, va a visitar a un antiguo compañero de armas y recibe la noticia de que éste ha muerto como consecuencia de los efectos de la guerra. A pocos días, la policía detiene a Rambo por vagabundo y se ensaña con él. Entonces recuerda las torturas que sufrió en Vietnan y reacciona violentamente.','Sylvester Stallone, Richard Crenna, Brian Dennehy, David Caruso, Jack Starrett, Michael Talbott, Chris Fulkey');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (35,7,5,'La Historia Interminable',3,'historia_interminable.jpg',to_timestamp('21/07/84','DD/MM/RR HH24:MI:SSXFF'),'Wolfgang Petersen',94,14,'Escondido en el desván de su colegio, Bastian devora durante las horas de clase un libro enigmático, ”La historia interminable”, que relata la paulatina destrucción del Reino de Fantasía. Una especie de ”Nada” misteriosa destruye todo el país y a todas las criaturas que lo habitan. A medida que avanza en su lectura, Bastian se da cuenta de que la salvación de Fantasía depende de él. De que consiga entrar dentro del libro...','Barret Oliver, Noah Hathaway, Moses Gunn, Tami Stronach, Patricia Hayes, Sydney Bromley');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (36,7,8,'Terminator 2: el juicio final',1,'terminator2.jpg',to_timestamp('05/05/91','DD/MM/RR HH24:MI:SSXFF'),'James Cameron',135,21,'Sarah Connor, la madre soltera del rebelde John Connor, está ingresada en un psiquiátrico. Tras haber sido informada por un viajero del tiempo de que su hijo se convertiría en el salvador de la humanidad del futuro amenazada por un diabólico mundo de máquinas, se ha convertido en una especie de guerrera que ha educado a John en tácticas de supervivencia, pero todos creen que está loca y que es peligrosa, por lo que está encerrada. Cuando un nuevo androide mejorado proveniente del futuro, un T-1000, llega para asesinar a John, un viejo modelo T-800 será enviado para protegerle.','Arnold Schwarzenegger, Linda Hamilton, Edward Furlong, Robert Patrick, Earl Boen, Joe Morton');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (37,2,1,'Volar por los aires',1,'volar_por_los_aires.jpg',to_timestamp('11/12/94','DD/MM/RR HH24:MI:SSXFF'),'Stephen Hopkins',120,19,'Un peligroso terrorista provoca diversas explosiones en el centro de Boston. Un policía especializado en desactivar explosivos emprende la caza del criminal por toda la ciudad. En esta lucha el policía ve cómo renacen en él sus temores de antaño, mientras que el terrorista utiliza a la familia del policía para chantajearle.','Jeff Bridges , Tommy Lee Jones , Lloyd Bridges , Forest Whitaker');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (38,2,2,'Los Bingueros',2,'los_bingueros.jpg',to_timestamp('04/04/79','DD/MM/RR HH24:MI:SSXFF'),'Mariano Ozores',90,12,'Amadeo es un mediocre empleado de banca que nunca alcanzará ese tranquilo nivel económico con el que todo el mundo sueña. Tampoco Fermín tiene muy seguro su futuro. Cobra el paro y hace chapuzas vendiendo libros y haciendo contratos de entierros pagados a plazos. Por distintas razones llegan a la conclusión de que el bingo puede llegar a ser la solución de sus males, y ambos personajes se conocen en la cola de entradas a un local del bingo. Aúnan sus esfuerzo,s pero ni siquiera así logran sacar dinero al juego. Pero ya están atrapados por el vicio. Y siguen jugando aunque para ello tengan que recurrir a todo tipo de trucos para lograr el dinero necesario...','Fernando Esteso, Andrés Pajares, Antonio Ozores, África Prat, Isabel Luque, Florinda Chico, Norma Duval, Pilar Muñoz, Rafael Alonso, Luis Barbero');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (39,6,1,'Sospechosos Habituales',1,'sospechosos_habituales.jpg',to_timestamp('11/07/95','DD/MM/RR HH24:MI:SSXFF'),'Bryan Singer',105,15,'Dave Kujan, un agente especial que trabaja para el servicio de aduanas de EEUU, está investigando las consecuencias de un incendio a bordo de un barco en el puerto de San Pedro de Los Ángeles, con un balance de 27 víctimas mortales, todas aparentemente asesinadas. La única fuente de información de Kujan es Roger Kint, un estafador lisiado que sobrevivió al incendio. Kint cuenta que todo comenzó 6 semanas atrás en Nueva York cuando 5 delincuentes, 5 "sospechosos habituales", fueron detenidos para una rueda de reconocimiento referente al robo de un camión de armas...','Kevin Spacey, Chazz Palminteri, Benicio del Toro, Gabriel Byrne, Stephen Baldwin, Pete Postlethwaite, Giancarlo Esposito, Dan Hedaya, Suzy Amis, Kevin Pollak');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (40,2,1,'Depredador',1,'depredador.jpg',to_timestamp('12/06/87','DD/MM/RR HH24:MI:SSXFF'),'John McTiernan',107,12,'Un comando de mercenarios es contratados por la CIA para rescatar a unos pilotos apresados por las guerrillas en la selva Centroamericana. La misión resulta satisfactoria, pero durante su viaje de regreso se dan cuenta de que algo invisible está dándoles caza uno a uno. Ese algo resulta ser un cazador alienígena que se queda con las calaveras de sus víctimas como trofeos.','Arnold Schwarzenegger, Carl Weathers, Elpidia Carrillo, Bill Duke, Kevin Peter Hall, Sonny Landham, R.G. Armstrong');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (41,4,10,'Por un puñado de dólares',6,'por_un_puñado_de_dolares.jpg',to_timestamp('05/01/64','DD/MM/RR HH24:MI:SSXFF'),'Sergio Leone',101,14,'Tras la muerte de Juárez, en México dominan la injusticia y el terror. Joe llega al pueblo fronterizo de San Miguel, donde dos familias se disputan el poder, y entra al servicio del clan Rojo. Una noche Joe es testigo del intercambio de oro por armas entre mexicanos y soldados de la Unión.','Clint Eastwood, Marianne Koch, Gian Mª Volonte, Jose Calvo');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (42,5,2,'Porky´s',1,'porkys.jpg',to_timestamp('20/08/82','DD/MM/RR HH24:MI:SSXFF'),'Bob Clark',98,16,'En Florida, durante la década de los cincuenta, un grupo de pícaros adolescentes que van juntos a la escuela descubren el sexo y el amor. Para dar rienda suelta a sus necesidade intentan entrar en un local de alterne, pero, al negarles la entrada el dueño del establecimiento, conciben todo tipo de gamberradas contra él. A partir de entonces le harán la vida imposible con tal de lograr tener acceso a las chicas.','Roger Wilson, Bill Hindman, Jack Mulcahy, Mark Herrier, Wyatt Knight, Susan Clark, Art Hindle, Wayne Maunder');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (43,6,10,'Cometieron dos errores',6,'cometieron_dos_errores.jpg',to_timestamp('15/07/67','DD/MM/RR HH24:MI:SSXFF'),'Ted Post',105,18,'Jed Cooper va a ser ahorcado acusado de haber robado ganado. En el último instante, es salvado por un comisario a las órdenes del juez Fentom. Cooper es aconsejado por el juez para que se olvide del pasado y le ofrece un puesto como comisario de todo el territorio ocupándose de las misiones más complicadas y trayendo a los acusados para que sean juzgados por el propio juez. La vida de Cooper, sin embargo, está marcada por la cicatriz que le dejó la soga en el cuello, y además un día es atacado por cinco de los nueve hombres, quedando malherido. Raquel le atiende y le pide que descubra quien mató a su marido y luego la ultrajó. Cuando se repone de sus heridas, Cooper es autorizado por el juez para que se encargue de la detención de los cinco bandidos que le atacaron.','Clint Eastwood, Inger Stevens, Ed Begley, Pat Hingle, Ben Johnson, Charles McGraw, Ruth White, Bruce Dern');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (44,7,9,'La bella y la bestia',1,'bella_y_bestia.jpg',to_timestamp('08/07/91','DD/MM/RR HH24:MI:SSXFF'),'Gary Trousdale, Kirk Wise',84,19,'Bella es una hermosa campesina que vive con su padre, un viejo inventor, en un pequeño pueblo. Un día su padre es secuestrado por una horrible bestia que es el dueño y señor de un inmenso castillo. A cambio de su liberación, el monstruo le exigirá un deseo que deberá cumplir o morir.','');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (45,7,9,'La Sirenita',1,'la_sirenita.jpg',to_timestamp('21/12/89','DD/MM/RR HH24:MI:SSXFF'),'Ron Clements, John Musker',76,20,'Lila es la princesa de las sirenas. Está a punto de celebrarse su fiesta de cumpleaños y su mayor ilusión sería la de poder visitar a los humanos, puesto que nunca los ha visto. Ayudada por la bruja Cassandra, Lila conseguirá subir a la superficie donde salvará de morir ahogada a un hermoso príncipe cuyo barco acaba de naufragar y del que se enamorará perdidamente. No obstante el príncipe es finalmente recogido del mar por una ambiciosa princesa cuyo padre, el Rey, le dice que en compensación debe casarse con ella. Mientras tanto, Lila ha vuelto al fondo del mar y le pide a Cassandra que la convierta en ser humano para poderse casar con el príncipe. Pero Cassandra sólo la convertirá en humana con una condición: si finalmente no se casa con el príncipe, se convertirá en espuma marina. Ella acepta y va en busca del príncipe, quien también se enamora de ella. Pero el padre de la princesa despechada entrará en guerra con el del príncipe si éste no se casa con su ambiciosa hija.','');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (46,6,7,'Karate Kid',1,'karate_kid.jpg',to_timestamp('20/03/84','DD/MM/RR HH24:MI:SSXFF'),'John G. Avildsen',122,21,'Daniel llega a Los Angeles y encara la difícil tarea de hacer nuevos amigos. Se hace objeto de las burlas de los "Cobras", una temerosa banda de estudiantes de karate, cuando se relaciona con Ali, la ex-novia del jefe de los "Cobras". Deseoso de contraatacar, para impresionar a su nueva amiga, le pide ayuda a su amigo Miyagi, un maestro de las artes marciales, para que le enseñe karate.','Ralph Macchio, Pat Morita, Elizabeth Shue, Martin Kove');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (47,4,7,'Conan el Bárbaro',1,'conan_el_barbaro.jpg',to_timestamp('05/09/82','DD/MM/RR HH24:MI:SSXFF'),'John Milius',130,15,'Un niño habitante de una aldea bárbara graba en sus memoria los rostros y distintivos de aquellos guerreros que han exterminado a su familia, entregándole a él a unos mercaderes de esclavos.','Arnold Schwarzenegger, James Earl Jones, Max von Sydow, Sandahl Bergman, Ben Davidson, Gerry Lopez, Mako, Valérie Quennessen, William Smith, Luis Barboo');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (48,2,8,'Tron',1,'tron.jpg',to_timestamp('20/03/82','DD/MM/RR HH24:MI:SSXFF'),'Steven Lisberger',96,18,'Un hacker es dividido en moléculas y transportado a las entrañas de un ordenador en el que un malvado programa controla los comportamientos a su antojo.','Jeff Bridges, Bruce Boxleitner, David Warner, Cindy Morgan, Barnard Hughes, Dan Shor, Peter Jurasik, Tony Stephano');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (49,4,6,'Juegos de Guerra',1,'juegos_de_guerra.jpg',to_timestamp('21/08/83','DD/MM/RR HH24:MI:SSXFF'),'John Badham',114,12,'A David Lughtman, estudiante de diecisiete años, le han suspendido varias asignaturas. Pero haciendo uso de su gran habilidad con las computadoras, logra cambiar las notas y aprobar el curso. Un día, jugando con su máquina, David entra en contacto con "Joshua", la computadora del Departamento de Defensa de los Estados Unidos, y decide "jugar a la guerra". El muchacho cree que es un juego más pero, sin darse cuenta, desafía a "Joshua" a un escalofriante juego de guerra termonuclear mundial. Entre las dos máquinas planean desplegar todas las estrategias y opciones para una Tercera Guerra Mundial.','Matthew Broderick, Dabney Coleman, John Wood, Ally Sheedy, Barry Corbin, Juanin Clay, Kent Williams, Dennis Lipscomb');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (1,1,4,'Cadena Perpetua',1,'Cadena_Perpetua.jpg',to_timestamp('23/09/94','DD/MM/RR HH24:MI:SSXFF'),'Frank Darabont',142,14,'Acusado del asesinato de su mujer, Andrew Dufresne (Tim Robbins) es enviado a la prisión de Shawshank para ser encerrado de por vida. Con el paso de los años conseguirá ganarse la confianza del director del centro y el respeto de sus compañeros presidiarios, especialmente de Red (Morgan Freeman), el jefe de la mafia de los sobornos.','Tim Robbins, Morgan Freeman, Bob Gunton, James Whitmore, Gil Bellows, William Sadler');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (2,6,3,'El Resplandor',1,'El_Resplandor.jpg',to_timestamp('23/05/80','DD/MM/RR HH24:MI:SSXFF'),'Stanley Kubrick',146,16,'Película de Terror basada en un novela de Stephen King','Jack Nicholson, Shelley Duvall, Danny Lloyd, Scatman Crothers, Barry Nelson, Philip Stone, Joe Turkel, Lia Beldman, Billie Gibson, Barry Denne, David Baxt, Manning Redwood, Kisa Burns, Louise Burns, Alison Coleridge, Norman Gay');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (3,2,9,'El Rey Leon',1,'El_Rey_Leon.jpg',to_timestamp('24/06/94','DD/MM/RR HH24:MI:SSXFF'),'Rob Minkoff, Roger Allers',87,17,'Narra la aventuras en la sabana africana de Simba, un pequeño león, heredero al trono, que se exilia al ser injustamente acusado de la muerte de su padre, pero que hace buenas amistades y regresa para recuperar lo que es suyo.','');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (4,4,1,'Gangs Of New York',1,'Gangs_Of_New_York.jpg',to_timestamp('28/02/03','DD/MM/RR HH24:MI:SSXFF'),'Martin Scorsese',168,21,'Reconstrucción de la historia de Nueva York a principio de siglo','Leonardo DiCaprio, Daniel Day-Lewis, Cameron Diaz, Jim Broadbent, John C. Reilly, Henry Thomas, Brendan Gleeson, Liam Neeson, David Hemmings, Stephen Graham, Gary Lewis');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (5,8,7,'Indiana Jones y el Templo Maldito',1,'Indiana_Jones_Y_El_Templo_Maldito.jpg',to_timestamp('01/01/84','DD/MM/RR HH24:MI:SSXFF'),'Steven Spielberg',118,21,'1935. Shanghai. El intrépido arqueólo Indiana Jones, tras meterse en jaleos en un local nocturno, consigue escapar, junto a una bella cantante, en compañía de su joven acompañante, un chico oriental con el que siempre está discutiendo. Tras un accidentado vuelo, los tres acaban en la India, donde intentarán ayudar a los habitantes de un pequeño poblado, cuyos niños han sido raptados.','Harrison Ford, Kate Capshaw, Ke Huy Quann, Amrish Puri, Dan Aykroyd, Philip Stone, Roshan Seth, David Yip');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (6,3,1,'A todo gas',1,'A_TODO_GAS.JPG',to_timestamp('20/06/01','DD/MM/RR HH24:MI:SSXFF'),'Rob Cohen',109,15,'Pelicula de flipaillos con coches','Paul Walker, Vin Diesel, Michelle Rodriguez, Jordana Brewster, Rick Yune, Chad Lindberg, Johnny Strong, Ted Levine');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (7,5,2,'Torrente, el brazo tonto de la ley',2,'torrente.jpg',to_timestamp('16/04/98','DD/MM/RR HH24:MI:SSXFF'),'Santiago Segura',97,18,'Torrente es un policía español, fascista, machista, racista, alcohólico y del Atleti. En su mismo inmueble vive un chaval, Rafi, al que le gustan las peliculas de acción y las pistolas, y que vive con su madre y su prima Amparito, una ninfómana. Juntos, Torrente y Rafi, patrullarán por la noche las calles de la ciudad.','Santiago Segura, Javier Cámara, Neus Asensi, Chus Lampreave, Tony Leblanc, Daniel Monzón, Nuria Carbonell, Carlos Lucas, Santiago Barullo, Julio Sanjuán, Carlos Perea, Jorge Sanz, Fernando Trueba, El Gran Wyoming, Gabino Diego, Espartaco Santoni');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (8,8,1,'La Roca',1,'La_Roca.jpg',to_timestamp('07/06/96','DD/MM/RR HH24:MI:SSXFF'),'Michael Bay',125,18,'Francis Hummel pretende que se indemnice a las familias de los soldados muertos en misiones secretas. Tras robar 16 misiles equipados con gas venenoso, toma Alcatraz y amenaza con lanzarlos sobre San Francisco. Para resolver la situación, el F.B.I. envía a la isla a un especialista en armamento biológico y al único fugado de la famosa prisión.','Sean Connery, Nicolas Cage, Ed Harris, Michael Biehn, William Forsythe, John Spencer, David Morse, Vanessa Marcil, John C. McGinley, James Caviezel (AKA Jim Caviezel), Tony Todd, Bokeem Moodbine');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (9,6,3,'Al Final De La Escalera',5,'AL_FINAL_DE_LA_ESCALERA.JPG',to_timestamp('01/01/79','DD/MM/RR HH24:MI:SSXFF'),'Peter Medak',109,17,'Un Psicologo experimenta en su casa fenomenos paranormales después de la muerte de su mujer e hija','George C. Scott, Trish Van Devere, Melvyn Douglas, John Colicos, Jean Marsh, Barry Morse, Madeleine Thornton-Sherwood, Helen Burns, Ruth Springford');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (10,1,3,'Los Otros',2,'Los_Otros.jpg',to_timestamp('01/01/01','DD/MM/RR HH24:MI:SSXFF'),'Alejandro Amenábar',104,19,'En la segunda guerra mundial una mujer comienza a tener visiones mientras espera la vuelta de su marido del frente','Nicole Kidman, Fionnula Flanagan, Christopher Eccleston, Alakina Mann, James Bentley, Eric Sykes, Elaine Cassidy, Renée Asherson');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (11,8,2,'Los Padres de Ella',1,'Los_Padres_De_Ella.jpg',to_timestamp('22/12/00','DD/MM/RR HH24:MI:SSXFF'),'Jay Roach',108,15,'Disparatada comedia sobre un joven algo patoso que, tras anunciar su compromiso, tiene que pasar unos días con los padres de su novia. Robert de Niro interpreta al padre de la novia, un hombre protector que ha trabajado para la CIA, lo que da pie a numerosas y cómicas escenas. Obtuvo un gran éxito de taquilla.','Robert De Niro, Ben Stiller, Blythe Danner, Teri Polo, James Rebhorn, Jon Abrahams, Owen Wilson, Nicole Dehuff');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (12,8,8,'Matrix',1,'Matrix.jpg',to_timestamp('19/06/99','DD/MM/RR HH24:MI:SSXFF'),'Andy Wachowski, Larry Wachowski',131,19,'Un programador pirata recibe un día una misteriosa visita... Nada más se debe contar de la sinopsis de Matrix.','Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, Joe Pantoliano, Marcus Chong, Paul Goddard, Mary Alice');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (13,1,2,'Mejor Imposible',1,'Mejor_Imposible.jpg',to_timestamp('27/02/98','DD/MM/RR HH24:MI:SSXFF'),'James L. Brooks',138,20,'Melvin Udall, un escritor obsesivo y maniático, es uno de los seres más desagradables y desagradecidos que uno pueda tener como vecino. Pero, un buen día, tiene que hacerse cargo de un perro al que odia a muerte. La presencia en su vida del animal ablandará su corazón.','Jack Nicholson, Helen Hunt, Greg Kinnear, Cuba Gooding Jr., Skeet Ulrich, Shirley Knight, Jesse James, Lawrence Kasdan');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (14,6,8,'Regreso al Futuro',1,'Regreso_Al_Futuro.jpg',to_timestamp('03/07/85','DD/MM/RR HH24:MI:SSXFF'),'Robert Zemeckis',116,20,'Marty McFly, un joven estudiante de Hill Valley High. es amigo de un excéntrico científico que ha inventado una máquina del tiempo con la sorprendente forma de un coche "DeLorean". Durante la prueba son sorprendidos por unos terroristas árabes y es Marty quien se traslada al año 1955. En esa dimensión, conoce a una joven pareja, Lorraine Baines y George McFly, que, en el futuro, serán sus padres. La situación se complica cuando es su propia madre quien se enamora de él.','Michael J. Fox, Christopher Lloyd, Lea Thompson, Crispin Glover, Claudia Wells, Thomas F. Wilson, Billy Zane, Sachi Parker');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (15,3,2,'Snatch. Cerdos y diamantes',4,'Snatch.jpg',to_timestamp('03/11/00','DD/MM/RR HH24:MI:SSXFF'),'Guy Ritchie',104,16,'Franky es una ladrón de diamantes que tiene que entregar una enorme pieza a su jefe Avi, pero en el camino es tentado por Boris para apostar en un combate ilegal de boxeo. En realidad, es una trampa para atracarle por lo que, cuando Avi se entera, contrata a Tony para encontrar a Franky y el diamante. Pronto se descubre el triste destino de Franky, y la caza y captura de la gema desaparecida lleva a todo el mundo a un juego de locos que corre el riesgo de descontrolarse.','Brad Pitt, Dennis Farina, Benicio del Toro, Vinnie Jones, Rade Serbedzija, Stephen Graham, Ewen Bremner, Jason Statham, Sorcha Cusack, Sam Douglas, Austin Drage, Andy Beckwith, Jason Flemyng');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (16,4,5,'La Princesa Prometida',1,'La_Princesa_Prometida.jpg',to_timestamp('01/01/87','DD/MM/RR HH24:MI:SSXFF'),'Rob Reiner',98,14,'Habiendo marchado en busca de fortuna, y después de 5 años de ausencia, Westley retorna a su tierra para casarse con su amada Buttercup, a la que juró amor eterno y verdadero. Para recuperarla, tendrá que enfrentarse a serios obstáculos (Vizzini y sus esbirros), pero, una vez superados éstos, aún quedará lo peor: el príncipe Humperdinck pretende desposar a la desdichada Buttercup, pese a que ésta no le ama, ya que le sigue queriendo a él.','Robin Wright Penn, Cary Elwes, Mandy Patinkin, Chris Sarandon, Wallace Shawn, Billy Crystal, Carol Kane, Peter Falk, Peter Cook, Fred Savage, Mel Smith, Christopher Guest, André the Giant, Mel Smith');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (17,4,4,'Leyendas de Pasión',1,'LEYENDAS_DE_PASION.jpg',to_timestamp('11/12/94','DD/MM/RR HH24:MI:SSXFF'),'Edward Zwick',134,12,'Narra la historia de tres hermanos, de caracteres muy diferentes, que viven con su padre -un militar retirado desencantado de la sociedad- en un apartado rancho de Montana. La Primera Guerra Mundial y una bella mujer cambiarán el destino de cada uno para siempre.','Brad Pitt, Anthony Hopkins, Julia Ormond, Aidan Quinn, Henry Thomas, Karina Lombard, Tantoo Cardinal, Gordon Tootoosis, Paul Desmond');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (18,7,9,'Buscando a Nemo',1,'Buscando_a_Nemo.jpg',to_timestamp('03/07/03','DD/MM/RR HH24:MI:SSXFF'),'Andrew Stanton , Lee Unkrich',101,23,'El pequeño Nemo, un pequeño pececillo hijo único, muy querido y protegido por su padre, ha sido sacado de la gran barrera del arrecife australiano y ahora vive en una pequeña pecera en la oficina de un dentista de Sidney. El tímido padre de Nemo se embarcará en una peligrosa aventura con Dory al rescate de su hijo. Pero Nemo y sus nuevos amigos tienen también un astuto plan para escapar de la pecera y volver al mar.','');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (19,8,8,'La Guerra de las Galaxias',1,'La_guerra_de_las_galaxias.jpg',to_timestamp('25/05/77','DD/MM/RR HH24:MI:SSXFF'),'George Lucas',121,24,'La princesa Leia, líder del movimiento rebelde que desea reinstaurar la República en la galaxia en los tiempos ominosos del Imperio, es capturada por las malévolas Fuerzas Imperiales, capitaneadas por el implacable Darth Vader, el sirviente más fiel del emperador. El intrépido Luke Skywalker, ayudado por Han Solo, capitán de la nave espacial "El Halcón Milenario", y los androides, R2D2 y C3PO, serán los encargados de luchar contra el enemigo y rescatar a la princesa para volver a instaurar la justicia en el seno de la Galaxia.','Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing, Alec Guinness, David Prowse, Peter Mayhew, Anthony Daniels, Kenny Baker, Phil Brown, Shelagh Fraser, Alex McCrindle, Jack Purvis');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (20,2,7,'Piratas del Caribe: la maldición de la Perla Negra',1,'Piratas_del_Caribe.jpg',to_timestamp('09/07/03','DD/MM/RR HH24:MI:SSXFF'),'Gore Verbinski',143,18,'La historia transcurre en el Mar Caribe en el siglo XVIII. El aventurero capitán Jack Sparrow (Johnny Depp) recorre las aguas caribeñas. Pero su andanzas terminan cuando su enemigo, el Capitán Barbossa (Geoffrey Rush) le roba su barco, el Perla Negra, y ataca la ciudad de Port Royal, secuestrando a Elizabeth Swann (Keira Knightley), hija del Gobernador (Jonathan Pryce). Will Turner (Orlando Bloom), el amigo de la infancia de Elizabeth, se une a Jack para rescatarla y recuperar el Perla Negra. Pero el prometido de Elizabeth, Comodoro Norrington (Jack Davenport) los persigue a bordo del HMS Dauntless. Además, Barbossa y su tripulación son víctimas de un conjuro por el que están condenados a vivir eternamente, y a transformarse cada noche en esqueletos vivientes, en fantasmas guerreros. El conjuro sólo puede romperse si devuelven lo que robaron: una pieza de oro azteca, y saldan una deuda de sangre. El rescate de la bella Elizabeth será una tarea difícil, pues la maldición es real y será difícil enfrentarse con quienes no pueden morir...','Johnny Depp, Geoffrey Rush, Orlando Bloom, Keira Knightley, Jonathan Price, Jack Davenport, Mackenzie Crook, Naomie Harris');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (21,4,7,'Los Goonies',1,'Los_Goonies.jpg',to_timestamp('07/06/85','DD/MM/RR HH24:MI:SSXFF'),'Richard Donner',111,19,'Mikey es un muchacho de trece años que, junto con su hermano mayor y sus amigos, que se hacen llamar "Los Goonies", deciden subir a jugar al desván de su casa, donde su padre guarda antigüedades. Allí encuentran el mapa de un tesoro... Simpática película de aventura para adolescentes, con historia de Steven Spielberg y guión de Chris Columbus.','Corey Feldman, Martha Plimpton, Joe Pantoliano, Sean Astin, Josh Brolin, Jeff Cohen, Kerri Green, Ke Huy Quan, Anne Ramsey');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (22,8,8,'El Imperio Contraataca',1,'EL_IMPERIO_CONTRAATACA.jpg',to_timestamp('15/08/80','DD/MM/RR HH24:MI:SSXFF'),'Irvin Kershner',124,21,'Tras un ataque sorpresa de las tropas imperiales a la alianza rebelde, Luke Skywalker parte en busca de Yoda, el maestro Yedi para que le enseñe los secretos de la fuerza.','Mark Hamill, Harrison Ford, Carrie Fisher, Alec Guinness, Billy Dee Williams, Anthony Daniels, David Prowse, Kenny Baker');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (23,1,2,'Las Aventuras de Ford Fairlane',1,'Las_aventuras_de_Ford_Fairlane.jpg',to_timestamp('25/05/90','DD/MM/RR HH24:MI:SSXFF'),'Renny Harlin',104,12,'Andrew Dice Clay es Ford Fairlane, el detective más sexy (y más descarado de Los Ángeles). Tomar Sambucas sin parar con las estrellas del rock y alternar con tías buenas a todas horas es un duro trabajo... pero alguien tiene que hacerlo. Pero cuando la estrella del Heavy, Bobby Black, muere en mitad de una actuación, el trabajo de Ford da un peligroso giro. Andrew Dice Clay es Ford Fairlane, el detective más sexy (y más descarado de Los Ángeles). Tomar Sambucas sin parar con las estrellas del rock y alternar con tías buenas a todas horas es un duro trabajo... pero alguien tiene que hacerlo. Pero cuando la estrella del Heavy, Bobby Black, muere en mitad de una actuación, el trabajo de Ford da un peligroso giro.','Andrew Dice Clay, Wayne Newton, Priscilla Presley, Lauren Holly, Maddie Corman, Gilbert Gottfried, David Patrick Kelly, Robert Englund, Ed ONeill');

Insert into PELICULAS (IDPELICULA,IDDISTRIBUIDOR,IDGENERO,TITULO,IDNACIONALIDAD,FOTO,FECHA_ESTRENO,DIRECTOR,DURACION,PRECIO,ARGUMENTO, ACTORES) values (50,9,8,'Avatar',1,'avatar.jpg','18/12/09','James Cameron',161,21,'Año 2154. Jake Sully (Sam Worthington), un ex-marine condenado a vivir en una silla de ruedas, sigue siendo, a pesar de ello, un auténtico guerrero. Precisamente por ello ha sido designado para ir a Pandora, donde algunas empresas están extrayendo un mineral extraño que podría resolver la crisis energética de la Tierra. Para contrarrestar la toxicidad de la atmósfera de Pandora, se ha creado el programa Avatar, gracias al cual los humanos "conductores" mantienen sus conciencias unidas a un avatar: un cuerpo biológico controlado de forma remota que puede sobrevivir en el aire letal. Esos cuerpos han sido creados con ADN humano, mezclado con ADN de los nativos de Pandora, los Navi. Convertido en avatar, Jake puede caminar otra vez. Su misión consiste en infiltrarse entre los Navi, que se han convertido en el mayor obstáculo para la extracción del mineral. Pero cuando Neytiri, una bella Navi (Zoe Saldana), salva la vida de Jake, todo cambia: Jake es admitido en su clan, tras superar muchas pruebas. Mientras, los hombres esperan que la información obtenida por Jake les sea útil.','Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang, Michelle Rodríguez, Giovanni Ribisi, Joel Moore, Wes Studi, CCH Pounder, Laz Alonso, Dileep Rao');

ALTER TABLE PELICULAS 
ADD CONSTRAINT PK_PELICULAS
PRIMARY KEY (IDPELICULA);

ALTER TABLE PEDIDOS
ADD CONSTRAINT PK_PEDIDOS
PRIMARY KEY (IDCLIENTE, IDPELICULA);

ALTER TABLE NACIONALIDAD
ADD CONSTRAINT PK_NACIONALIDAD
PRIMARY KEY (IDNACIONALIDAD);

ALTER TABLE GENEROS
ADD CONSTRAINT PK_GENEROS
PRIMARY KEY (IDGENERO);

ALTER TABLE DISTRIBUIDORAS
ADD CONSTRAINT PK_DISTRIBUIDORAS
PRIMARY KEY (IDDISTRIBUIDOR);

ALTER TABLE CLIENTES
ADD CONSTRAINT PK_CLIENTES
PRIMARY KEY (IDCLIENTE);

ALTER TABLE PEDIDOS
ADD CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (IdCliente) REFERENCES CLIENTES(IdCliente);

ALTER TABLE PEDIDOS
ADD CONSTRAINT FK_Pedidos_Peliculas FOREIGN KEY (IdPelicula) REFERENCES PELICULAS(IdPelicula);

ALTER TABLE PELICULAS
ADD CONSTRAINT FK_Peliculas_Distribuidoras FOREIGN KEY (IdDistribuidor) REFERENCES DISTRIBUIDORAS(IdDistribuidor);

ALTER TABLE PELICULAS
ADD CONSTRAINT FK_Peliculas_Generos FOREIGN KEY (IdGenero) REFERENCES GENEROS(IdGenero);

ALTER TABLE PELICULAS
ADD CONSTRAINT FK_Peliculas_Nacionalidad FOREIGN KEY (IdNacionalidad) REFERENCES NACIONALIDAD(IdNacionalidad);
