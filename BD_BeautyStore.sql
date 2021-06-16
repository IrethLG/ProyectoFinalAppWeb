USE master;
GO
IF DB_ID (N'BeautyStore') IS NOT NULL
 DROP DATABASE BeautyStore;
GO
CREATE DATABASE	BeautyStore
ON
(NAME = BeautyStore_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BeautyStore.mdf', 
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
(NAME =BeautyStore_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BeautyStore.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB )
GO
USE BeautyStore;

GO	
---------------------TABLAS----------------------------------------------------
CREATE TABLE Marca
(   
      
	 idMarca int IDENTITY (1,1),
	 nombre varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Marca PRIMARY KEY (idMarca)

);
CREATE TABLE Paqueteria
(   
      
	 idPaqueteria int IDENTITY (1,1),--
	 nombre varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Paqueteria PRIMARY KEY (idPaqueteria)

);
CREATE TABLE Categoria
(   
      
	 idCategoria int IDENTITY (1,1),
	 nombre varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Categoria PRIMARY KEY (idCategoria)

);
CREATE TABLE Proveedor
(   
      
	 idProveedor int IDENTITY (1,1),
	 nombre varchar(25) NOT NULL,
	 apPaterno varchar(20) NOT NULL,
	 apMaterno  varchar(20) NOT NULL,
	 telefono  varchar(20) NOT NULL,
	 correo varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)

);
CREATE TABLE Cliente
(   
      
	 idCliente int IDENTITY (1,1),
	 nombre varchar(25) NOT NULL,
	 apPaterno varchar(50) NOT NULL,
	 apMaterno  varchar(20) NOT NULL,
	 direccion  varchar(100) NOT NULL,
	 telefono  varchar (20) NOT NULL,
	 correo varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)

);
CREATE TABLE Sucursal
(   
      
	 idSucursal int IDENTITY (1,1),
	 direccion  varchar(100) NOT NULL,
	 horario  varchar(100) NOT NULL,
	 codigoPostal  varchar(10) NOT NULL,
	 telefono  varchar (20) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)

);
CREATE TABLE Devolucion
(   
      
	 idDevolucion int IDENTITY (1,1),
	 motivo  varchar(100) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Devolucion PRIMARY KEY (idDevolucion)

);
CREATE TABLE FormaPago
(   
      
	 idFormaPago int IDENTITY (1,1),
	 nombre  varchar(100) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_FormaPago PRIMARY KEY (idFormaPago)

);
CREATE TABLE Almacen
(   
      
	 idAlmacen int IDENTITY (1,1),
	 entradas  int NOT NULL,
	 salidas  int NOT NULL,
	 stock  int NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_Almacen PRIMARY KEY (idAlmacen)

);

CREATE TABLE Empleado
(   
      
	 idEmpleado int IDENTITY (1,1),
	 nombre varchar(25) NOT NULL,
	 apPaterno varchar(50) NOT NULL,
	 apMaterno  varchar(20) NOT NULL,
	 direccion  varchar(100) NOT NULL,
	 telefono  varchar(20) NOT NULL,
	 correo varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idSucursal int NOT NULL
	 CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)

);
CREATE TABLE Producto
(   
      
	 idProducto int IDENTITY (1,1),
	 nombre varchar(50) NOT NULL,
	 color  varchar(50) NOT NULL,
	 detalles varchar(250) NOT NULL,
	 precio  decimal (10,2) NOT NULL,
	 existencias  int NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idMarca int NOT NULL,----FK
	 idCategoria int NOT NULL
	 CONSTRAINT PK_Producto PRIMARY KEY (idProducto)

);
CREATE TABLE Compra
(   
      
	 idCompra int IDENTITY (1,1),
	 descripcion varchar(200) NOT NULL,
	 cantidad  int NOT NULL,
	 precio  decimal (10,2) NOT NULL,
	 total  decimal (10,2) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idProveedor int NOT NULL
	 CONSTRAINT PK_Compra PRIMARY KEY (idCompra)

);

CREATE TABLE Pedido
(   
      
	 idPedido int IDENTITY (1,1),
	 descripcion varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idCliente int NOT NULL
	 
	 CONSTRAINT PK_Pedido PRIMARY KEY (idPedido)

);

CREATE TABLE Venta
(   
      
	 idVenta int IDENTITY (1,1),
	
	 total  decimal (10,2) NOT NULL,
	 cantidad int NOT NULL,
     detalles varchar(50) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idProducto int NOT NULL,
	  idEmpleado int NOT NULL,
	   idCliente int NOT NULL,
	    idFormaPago int NOT NULL
	 CONSTRAINT PK_Venta PRIMARY KEY (idVenta)

);
CREATE TABLE Paquete
(   
      
	 idPaquete int IDENTITY (1,1),
     decripcion varchar(100) NOT NULL,
	 direccion varchar(100) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1,
	 idPaqueteria int NOT NULL,
		 idPedido int NOT NULL
	 CONSTRAINT PK_Paquete PRIMARY KEY (idPaquete)

);
CREATE TABLE PedidoProducto

(   
     idPedidoProducto int IDENTITY (1,1),
	 idPedido int NOT NULL,
	 idProducto int NOT NULL,
	 cantidadProducto int NOT NULL,
	 total decimal(10,2) NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_PedidoProducto PRIMARY KEY (idPedidoProducto)

);

CREATE TABLE ProductoAlmacen

(   
     idProductoAlmacen int IDENTITY (1,1),
	 idProducto int NOT NULL, 
	 idAlmacen int NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_ProductoAlmacen PRIMARY KEY (idProductoAlmacen)

);
CREATE TABLE PedidoDevolucion

(   
     idPedidoDevolucion int IDENTITY (1,1),
	 idPedido int NOT NULL, 
	 idDevolucion int NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_PedidoDevolucion PRIMARY KEY (idPedidoDevolucion)

);
CREATE TABLE CompraProducto

(   
     idCompraProducto int IDENTITY (1,1),
	 idCompra int NOT NULL, 
	 idProducto int NOT NULL,
	 estatus bit NOT NULL DEFAULT 1
	 CONSTRAINT PK_CompraProducto PRIMARY KEY (idCompraProducto)

);
--------------------INDEX---------------------------------
CREATE INDEX IX_Marca ON Marca(idMarca);
CREATE INDEX IX_Categoria ON Categoria(idCategoria);
CREATE INDEX IX_Paqueteria ON Paqueteria(idPaqueteria);
CREATE INDEX IX_Cliente ON Cliente(idCliente);
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal);
CREATE INDEX IX_Devolucion ON Devolucion(idDevolucion);
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor);
CREATE INDEX IX_FormaPago ON FormaPago(idFormaPago);
CREATE INDEX IX_Almacen ON Almacen(idAlmacen);

CREATE INDEX IX_Empleado ON Empleado(idEmpleado);
CREATE INDEX IX_Producto ON Producto(idProducto);
CREATE INDEX IX_Compra ON Compra(idCompra);
CREATE INDEX IX_Pedido ON Pedido(idPedido);
CREATE INDEX IX_Venta ON Venta(idVenta);
CREATE INDEX IX_Paquete ON Paquete(idPaquete);

CREATE INDEX IX_PedidoProducto ON PedidoProducto(idPedido,idProducto);
CREATE INDEX IX_ProductoAlmacen ON ProductoAlmacen(idProducto,idAlmacen);
CREATE INDEX IX_PedidoDevolucion ON PedidoDevolucion(idPedido,idDevolucion);
CREATE INDEX IX_CompraProducto ON CompraProducto(idCompra,idProducto);
GO



--------------------RELACIONES---------------------------------
ALTER TABLE Empleado---nombre de la tabla que tiene la llave foranea
ADD CONSTRAINT FK_EmpleadoSucursal---nombre de tabla junto con la llave foranea
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal);
GO
---
ALTER TABLE Producto---nombre de la tabla que tiene la llave foranea
ADD CONSTRAINT FK_ProductoMarca ---nombre de tabla junto con la llave foranea
FOREIGN KEY (idMarca) REFERENCES Marca(idMarca);
GO
ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoCategoria
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria);
GO

---
ALTER TABLE Compra
ADD CONSTRAINT FK_CompraProveedor
FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor);
GO
----

ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);

----

----
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaFormaPago
FOREIGN KEY (idFormaPago) REFERENCES FormaPago(idFormaPago);
GO

-----
ALTER TABLE Paquete
ADD CONSTRAINT FK_PaquetePaqueteria
FOREIGN KEY (idPaqueteria) REFERENCES Paqueteria(idPaqueteria);
GO
ALTER TABLE Paquete
ADD CONSTRAINT FK_PaquetePedido
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido);
GO
----
ALTER TABLE PedidoProducto
ADD CONSTRAINT FK_PedidoProductoPedido
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido);
GO
ALTER TABLE PedidoProducto
ADD CONSTRAINT FK_PedidoProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO
----
ALTER TABLE ProductoAlmacen
ADD CONSTRAINT FK_ProductoAlmacenAlmacen
FOREIGN KEY (idAlmacen) REFERENCES Almacen(idAlmacen);
GO
ALTER TABLE ProductoAlmacen
ADD CONSTRAINT FK_ProductoAlmacen
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO
----
----
ALTER TABLE PedidoDevolucion
ADD CONSTRAINT FK_PedidoDevolucionPedido
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido);
GO
ALTER TABLE PedidoDevolucion
ADD CONSTRAINT FK_PedidoDevolucionDevolucion
FOREIGN KEY (idDevolucion) REFERENCES Devolucion(idDevolucion);
GO
----
ALTER TABLE CompraProducto
ADD CONSTRAINT FK_CompraProductoCompra
FOREIGN KEY (idCompra) REFERENCES Compra(idCompra);
GO
ALTER TABLE CompraProducto
ADD CONSTRAINT FK_CompraProductoProducto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);
GO



-----------------------------------------




 
--------------------Poblar--------------------------------------
--------------------Insertar Registros-------------------------
---------------------------------------------

INSERT INTO Marca(nombre)
VALUES ('MAC'),
       ('NARS'),
	   ('Bobbi Brown'),
	   ('NYX'),
	   ('L"Oréal'),
	   ('Maybelline'),
	   ('Clinique'),
	   ('Dior'),
	   ('Bissu'),
	   ('Mary Kay'),
	   ('Revlon'),
	   ('Sephora'),
	   ('Anastasia'),
	   ('Kyle'),
	   ('Vogue'),
	   ('Esteer Lauder'),
	   ('NY'),
	   ('Avon'),
	   ('Chanel')
	   INSERT INTO Paqueteria(nombre)
VALUES ('FedEX'),
       ('Estafeta'),
	   ('DHL'),
	   ('UPS'),
	   ('Correos de Mexico'),
	   ('Paquetexpress'),
	   ('Redpack')
	   INSERT INTO Categoria(nombre)
     VALUES    ('Rostro'),
			   ('Labios'),
			   ('Ojos'),
			   ('Accesorios'),
			   ('Perfumes y Fragancias'),
			   ('Cuidado de piel'),
			   ('Cuidado Corporal'),
			   ('Cuidado de cabello')



  
	    INSERT INTO Sucursal(direccion,horario,codigoPostal,telefono)
     VALUES   ('Calle agustin lara no. 69-b	col. Ex-normal tuxtepec Monclova, Coah.','9:00 a 6:30','25750','+866-168-16-56'),
	           ('Av. 5 de mayo no. 583	col.centro Monclova, Coah.','9:00 a 8:30','25790','+866-198-11-56'),
			   ('Av. Ferrocarril s/n.	Col. Centro pueblo nuevo. Papaloapan Frontera, Coah.','9:00 a 6:30','25626','+844-188-56-34'),
			   ('Tamaulipas 717, Los Pinos, 25720 Monclova, Coah.','9:30 a 7:30','25720','+866-111-13-59'),
			   ('Av. Independencia no. 1029	col. La piragua Cd Apodaca, N.L.','9:30 a 6:30','66634','+866-677-23-12'),
			   ('Los Cristales 161, La Fe, 67117 Guadalupe, N.L. ','8:00 a 6:30','67117','+844-190-23-45'),
			   ('Av. Mexico 710, Avante, Guadalupe, N.L.','10:00 a 9:30','34566','+866-166-78-01')
			   			   -------

			   INSERT INTO Devolucion(motivo)
               VALUES   ('No estaba copleto lo que pedi y venia quebrado'),
					   ('No era lo que pedi '),
					   ('Estaba quebrado y no era lo que pedi'),
					   ('No estaba en buenas condiciones'),
					   ('No estaba copleto lo que pedi y venia quebrado'),
					   ('Estaba quebrado y no era lo que pedi'),
					   ('No era lo que pedi')

					   INSERT INTO FormaPago(nombre)
               VALUES   ('Tarjeta de credito '),
					   
					   ('Transferencia electrónica'),
					   ('Pago en línea'),
					   ('Cheque'),
                       ('Efectivo ')
					  
					   INSERT INTO Almacen(entradas,salidas,stock)
						VALUES (33,9,3),
							   (44,6,2),
							   (55,4,1),
							   (35,8,2),
							   (23,1,1),
							   (34,5,1),
							   (54,3,2),
							   (36,7,1),
							   (32,2,1),
							    (34,5,1)
			  
			  INSERT INTO Empleado(nombre,apPaterno,apMaterno,direccion,correo,telefono,idSucursal)
     VALUES    ('Ireth','Leyva','Garcia','Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.','leijaarisbeth@gmail.com','+866-168-16-56',3),
	           ('Jose Luis','Hernandez','Garza','Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.','joseluis@gmail.com','+866-198-11-56',6),
			   ('Flor Elizabeth','Flores','Perez','Brasil #201, Guadalupe, 25750 Monclova, Coah.','florperez@gmail.com','+844-188-56-34',2),
			   ('Marcos','Mireles','Tovar','Valparaíso 212, Guadalupe, 25750 Monclova, Coah.','mirelestovar@gmail.com','+866-111-13-59',4),
			   ('Nataly','Meza','Rodriguez','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.','nataly13@gmail.com','+866-677-23-12',7),
			   ('Samuel Israel','Vazquez','Villarial','Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.','samyisra@gmail.com','+844-190-23-45',1),
			   ('Juan de dios','Del Bosque','Saldua','Carretera 30, Magisterio, 25716 Frontera, Coah.','juan@gmail.com','+866-166-78-01',5)
		
		
			   


	  INSERT INTO Proveedor(nombre,apPaterno,apMaterno,correo,telefono)
     VALUES   ('Jesus Israel','Sanchez','Garcia','sanz@gmail.com','+866-168-16-56'),
	           ('Jose Angel','Galvan','Flores','joseangel@gmail.com','+866-198-11-56'),
			   ('Saul Gil','Suarez','Leyva','gilsuarez@gmail.com','+844-188-56-34'),
			   ('Marco Antonio','Tovar','Alconcer','marcantony@gmail.com','+866-111-13-59'),
			   ('Andre','Acosta','Aro','acostaro@gmail.com','+866-677-23-12'),
			   ('Samuel ','Lopez','Velazquez','velazquez@gmail.com','+844-190-23-45'),
			   ('Sergio','Gonzalez','Ruiz','ruizsergio@gmail.com','+866-166-78-01'),
			   ('Willian','Smith','Saldua','smithsaldua@gmail.com','+866-166-78-01'),
			    ('Fernando ','Mendez','Barrera','barrera@gmail.com','+844-190-23-45'),
			   ('Pedro','Gutierrez','Romero','guitierrez@gmail.com','+866-166-78-01'),
			   ('Alonso','Alvares','Diaz','alonsodiaz@gmail.com','+866-166-78-01')
	         

	  
		INSERT INTO Producto(nombre,color,detalles,precio,existencias,idMarca,idCategoria)
     VALUES  	('Base de maquillaje','Rose Nature','Base de maquillaje de larga duración (24h)',343,18,12,1),
				('Base de Maquillaje','Warm Nude','Maquillaje de cobertura total con protección solar FPS 50',73,6,15,1),
				('Base Labial','Peony Pool','Se aplica suavemente y se mezcla con facilidad',56,29,9,2),
				('Brillo Labial','Vino Cerezo','Acabado mate',389,19,1,2),-------
				('Brochas de silicona','Blanco','Fácil de aplicar capas finas de productos para el cuidado de la piel de manera uniforme.',444,4,4,4),
				('Brochas para maquillaje','Azul marino','Este juego cuenta con 24 brochas que cumplen todas las necesidades.',863,8,8,4),
				('Brochas para maquillaje','Negro','Con 5 brochas grandes y 9 pinceles de precisión es un set de brochas de maquillaje adecuado para uso profesional y doméstico.',433,1,1,4),
				('Brush Cleaner','Multicolor','Limpia, acondiciona y desodoriza pinceles y brochas en un solo paso.',119,10,10,4),
				('Colorantes Labial','Lover Cb','Labial matte de larga duración',24,10,3,2),
				('Corrector','Light','Corrector facial anti-ojeras',222,4,3,1),
				('Delineador Labial','Lead The Way','Obtén un color de labios mate de hasta 8 horas que se desliza sobre el crayón fácilmente',173,9,10,2),
				('Delineador Liquido','Azul marino','Delineado perfecto hasta por 24 horas',363,16,7,3),
				('Delineador líquido','Negro','Acabado Mate',443,4,8,3),
				('Delineadores De Gel ','Diferentes colores','Delineadores de color intenso resistente al agua, sudor y calor. Dura hasta 16 horas y no se corre.',644,10,1,3),
				('Espejo de Aumento','Plateado','Espejo de Maquillaje Iluminado, Regulable Luz',243,6,6,4),
				('Fotoprotector Compact','Compacto','Protege y matifica en un único gesto.',265,10,9,1),
				('Iluminador','Champagne','Fórmula líquida para construir la cobertura y el brillo',939,8,2,1),
				('Labial','Mora Chic','Color intenso y alta cobertura',99,32,2,1),
				('Labial','Red For Me','Sensación cremosa gracias a su fórmula con néctar de miel',133,15,11,2),
				('Labial','Rosa','Labial matte de larga duración',124,23,2,2),
				('Labial','Spice','Hyper Matte se combina con una comodidad cremosa por hasta 8 horas.',265,11,5,2),
				('Lapices Labial','Vino Intenso','Efecto mate que no reseca tus labios.',166,13,12,2),
				('Lapiz Delineador','Deep Brown','Rellena las cejas con este lápiz de cejas definitorio imprescindible, con una punta en forma de lágrima.',143,12,3,3),
				('Limpiador de Brochas','Negro','Limpia y seca tu brocha de maquillaje en 10 segundos profundamente.',653,2,2,4),
				('Maquinilla de afeitar ceja','Diferentes Colores','Afeitadora con cubierta de precisión para mujer (6 piezas)',331,7,7,4),
				('Mascara','Negro','Volumen tridimesional: las pestañas se densifican, se rizan y se separan.',233,2,4,3),
				('Organizador','Very Black','Organizador de bolsas de cosméticos de viaje portátil ',639,9,9,4),
				('Paleta de sombras','Café/Dorado/Terracota/Cremas','Colores cremosos e intensos',345,6,12,3),
				('Paleta de Sombras','Multicolor','Este producto consta de 120 colores diferentes de sombra de ojos',455,8,16,3),
				('Pestañas Magneticas ','Negras','5 Pares Pestañas Postizas Magnéticas ',344,5,5,4),
				('Polvo Compacto Matte','Natural Beige','Acabado mate y natural; desvanece poros y controla el brillo',563,7,17,1),
				('Polvo Compacto','Natural Beige','Acabado mate y natural; desvanece poros y controla el brillo',348,33,7,1),
				('Polvo','Light','Maquillaje en polvo de larga duración',349,14,1,1),
				('Prime Plus ','Blanco','Para piel grasa y poros abiertos.',144,11,11,1),
				('Rimel','Very Black','Su cepillo efecto abanico con cerdas cortas y largas ',739,18,9,3),
				('Rizador de Pestanas','Blancas','Da un mayor efecto de rizado, elevación y definición a tus pestañas de las esquinas internas y externas',555,3,3,3),
				('Sombra en barra ','Rosa','A prueba de pliegues y manchas',731,14,5,3),
				('Sombras Glitter','Multicolor','Textura que se fija fácilmente a tu piel',849,20,1,3),
				('Spray fijador','Sin color','Rocía en tu rostro a una distancia de 5 cm y deja secar',243,10,5,1),
				('Tintes Labial','Speak Up','Labial indeleble y de larga duración que no mancha el cubrebocas',78,2,3,2),

		('Delineador en liquido color negro','Speak Up','Labial indeleble y de larga duración que no mancha el cubrebocas',78,2,3,2)
	
	

	INSERT INTO Compra(descripcion,cantidad,precio,total,idProveedor)
	VALUES('Brochas de silicona',56,120,8937.89,1),
	      ('Iluminador',23,127,4937.89,3),
		  ('Delineador líquido',35,89,7437.89,6),
		  ('Polvo Compacto Matte',56,321,88937.89,7),
		  ('Paleta de sombras',67,382,93937.89,2),
		  ('Pestañas Magneticas ',35,100,3937.89,4),
		  ('Prime Plus ',32,278,4937.89,6),
		  ('Sombras Glitter',34,381,7937.89,8),
		  ('Rizador de Pestanas',45,38,2937.89,5),
		  ('Spray fijador',66,329,7937.89,1)


	 INSERT INTO Cliente(nombre,apPaterno,apMaterno,direccion,correo,telefono)
     VALUES    ('Ireth','Leyva','Garcia','Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.','leijaarisbeth@gmail.com','+866-168-16-56'),
	           ('Jose Luis','Hernandez','Garza','Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.','joseluis@gmail.com','+866-198-11-56'),
			   ('Flor Elizabeth','Flores','Perez','Brasil #201, Guadalupe, 25750 Monclova, Coah.','florperez@gmail.com','+844-188-56-34'),
			   ('Marcos','Mireles','Tovar','Valparaíso 212, Guadalupe, 25750 Monclova, Coah.','mirelestovar@gmail.com','+866-111-13-59'),
			   ('Nataly','Meza','Rodriguez','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.','nataly13@gmail.com','+866-677-23-12'),
			   ('Samuel Israel','Vazquez','Villarial','Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.','samyisra@gmail.com','+844-190-23-45'),
			   ('Juan de dios','Del Bosque','Saldua','Carretera 30, Magisterio, 25716 Frontera, Coah.','juan@gmail.com','+866-166-78-01')
     
	 

	 INSERT INTO Venta(total,cantidad,detalles,idProducto,idEmpleado,idCliente,idFormaPago)
	    VALUES   (234,1,'Paleta de sombras',29,3,3,2),
		         (123,2,'Corrector',10,6,6,4),
				 (433,2,'Iluminador',17,2,1,2),
				 (67,1,'Brochas para maquillaje',6,4,2,1),
				 (256,1,'Mascara',26,1,4,3),
				 (785,2,'Organizador',27,3,5,5),
				 (32,1,'Rizador de pestañas',36,5,3,3),
				 (165,2,'Rimel',35,7,7,2),
			     (436,3,'Polvo Compacto',32,1,4,2)

		INSERT INTO Pedido(descripcion,idCliente)
	 VALUES   ('Paleta de sombras',1),
	          ('Labial mate',3),
			  ('Corrector',5),
			  ('Iluminador',7),
			  ('Brochas para maquillaje',2),
			  ('Mascara',4),
			  ('Organizador',6),
			  ('Rizador de pestañas',1),
			  ('Rimel',3),
			  ('Polvo Compacto',5)
			    INSERT INTO Paquete(decripcion,direccion,idPaqueteria,idPedido)
	    VALUES   ('Polvo Compacto','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.',2,10),
		         ('Iluminador','Carretera 30, Magisterio, 25716 Frontera, Coah.',4,4),
				 ('Brochas para maquillaje','Av. Huemac, Brasil Esq, Anáhuac, 25750 Monclova, Coah.',6,5),
				 ('Rimel','Brasil #201, Guadalupe, 25750 Monclova, Coah.',1,9),
				 ('Corrector','Calle Guatemala S/N, Guadalupe, 25750 Monclova, Coah.',3,3),
				 ('Rizador de pestañas','Cd. Deportiva, Cd Deportiva, 25750 Monclova, Coah.',5,8),
				 ('Labial mate','Brasil #201, Guadalupe, 25750 Monclova, Coah.',7,2),
				 ('Organizador','Blvd Harold R. Pape 6201, Guadalupe, 25750 Monclova, Coah.',1,7),
			     ('Mascara','Valparaíso 212, Guadalupe, 25750 Monclova, Coah.',5,6)

		INSERT INTO PedidoProducto(idProducto,idPedido,cantidadProducto,total)
		VALUES (32,9,3,436),
		       (27,6,2,785),
			   (6,4,1,67),
			   (35,8,2,165),
			   (29,1,1,234),
			   (26,5,1,56),
			   (17,3,2,433),
			   (36,7,1,32),
			   (10,2,1,123)
			   INSERT INTO ProductoAlmacen(idProducto,idAlmacen)
		VALUES (1,9),
		       (2,6),
			   (3,4),
			   (4,8),
			   (5,1),
			   (6,5),
			   (7,3),
			   (8,7),
			   (9,2),
			   (10,9),
		       (11,6),
			   (12,4),
			   (13,8),
			   (14,1),
			   (15,5),
			   (16,3),
			   (17,7),
			   (18,2)
		INSERT INTO PedidoDevolucion(idDevolucion,idPedido)
		VALUES (1,9),
		       (2,6),
			   (3,4),
			   (4,8),
			   (5,1),
			   (6,5),
			   (7,3)

	    INSERT INTO CompraProducto(idCompra,idProducto)
		VALUES (1,9),
		       (2,6),
			   (3,4),
			   (4,8),
			   (5,1),
			   (6,5),
			   (7,3)

SELECT * FROM Marca
SELECT * FROM   Categoria
SELECT * FROM  Paqueteria
SELECT * FROM  Cliente
SELECT * FROM  Sucursal
SELECT * FROM  Devolucion
SELECT * FROM    Proveedor
SELECT * FROM  FormaPago
SELECT * FROM  Almacen

SELECT * FROM  Empleado
SELECT * FROM  Producto
SELECT * FROM  Compra
SELECT * FROM  Pedido
SELECT * FROM Venta
SELECT * FROM   Paquete

SELECT * FROM    PedidoProducto
SELECT * FROM    ProductoAlmacen
SELECT * FROM   PedidoDevolucion
SELECT * FROM    CompraProducto


/*SELECT * FROM    vwConsulta1
SELECT * FROM    vwConsulta2
SELECT * FROM    vwConsulta3
SELECT * FROM    vwConsulta5
SELECT * FROM    vwConsulta6
SELECT * FROM    vwConsulta7
SELECT * FROM    vwConsulta8
SELECT * FROM    vwConsulta9*/


