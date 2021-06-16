USE BeautyStore;
GO

-----------------------CONSULTAS CON FUNCIONES
---- Consula donde se muestra el nombre completo de los empleados
 select idEmpleado ,CONCAT(CONCAT (UPPER(LEFT(TRIM(nombre),1)),SUBSTRING (nombre,2,LEN(nombre))) ,SPACE(1),
 CONCAT (UPPER(LEFT(TRIM(ApPaterno),1)),SUBSTRING (ApPaterno,2,LEN(ApPaterno))),SPACE(1),
 CONCAT (UPPER(LEFT(TRIM(ApMaterno),1)), SUBSTRING (ApMaterno,2,LEN(ApMaterno)))),Nombre
 FROM Empleado
  where estatus=1
  GO


 -------Consulta que muestra el nombre del prudcto y nombre de la categoria 
select T1.idProducto, T1.nombre NombreProducto,
Categoria.idCategoria, Categoria.nombre NombreCategoria
from Producto AS T1
inner join Categoria on T1.idCategoria = Categoria.idCategoria
GO

----------------Consulta que muestra por letra que se le indica ,los nombres que estan en la tabla Clientes con la inicial J
select CONVERT (varchar (4),t4.idCliente)+'-'+(T4.Nombre+' '+T4.ApPaterno+' '+T4.ApMaterno)Nombre
FROM Cliente T4
WHERE T4.estatus=1 AND T4.Nombre like('J%')----EL _ hace que respete lo que se indica --

GO

----------------Consulta que muestra por letra que se le indica ,los nombres que estan en la tabla empleados con la inicial M
select CONVERT (varchar (4),t4.idEmpleado)+'-'+(T4.Nombre+' '+T4.ApPaterno+' '+T4.ApMaterno)Nombre
FROM Empleado T4
WHERE T4.estatus=1 AND T4.Nombre like('M%')----EL _ hace que respete lo que se indica --
GO

------

--Consulta que muestra el total de productos y el nombre del producto con la cantidad que tiene
select COUNT (*) as TotalProducto from Producto 
select nombre Nombre, count(*) Cantidad from Producto 
group by nombre
GO
--Consulta que muestra el total de productos y el color del producto con el mismo color que tiene
select COUNT (*) as TotalProducto from Producto 
select color Color, count(*) MismoColor from Producto 
group by color
GO
---Consulta de menor precio
SELECT MIN(precio)MenorPrecio
FROM Producto;
GO
---Consulta de menor existencia
SELECT MIN(existencias)MenorExistencia
FROM Producto;
GO

---Consulta de mayor existencia
SELECT MAX(precio)MayorPrecio
FROM Producto;
GO

---Consulta de mayor existencia
SELECT MAX(existencias)MayorExistencia
FROM Producto;
GO

--ESCALAR
---Consulta que opera sobre la misma fila y el resultado lo devuelve para la misma fila----
select nombre, SUBSTRING(nombre, 1, 3) as Primeras3Letras,
getdate () as fecha
from Marca
GO
select nombre, SUBSTRING(nombre, 1, 3) as Primeras3Letras,
getdate () as fecha
from Producto
GO
---Vamos a obtener el número de pedidos realizados por cada cliente:
SELECT Cliente.Nombre, Count(Pedido.idPedido) AS NumeroPedidos FROM Pedido
LEFT JOIN Cliente
ON Pedido.idCliente=Cliente.idCliente
GROUP BY Nombre;
GO

------------------------------------------
SELECT CONCAT('$', round(total,idVenta)) as totalSimbolo FROM Venta
GO
SELECT CONCAT('$', round(precio,idProducto)) as PrecioSimbolo FROM Producto

GO

-----PROCEDIMIENTOS ALMACENADOS----
   ---  2---Restar existencia
   CREATE PROCEDURE SP_RestarExistencia
   @id_producto as int ,
   @Cantidad as int
   AS
   UPDATE Producto SET existencias=existencias-@Cantidad
   WHERE idProducto=@id_producto
   GO
    exec SP_RestarExistencia  4,9
    SELECT* FROM Producto
	GO

	   ---  3---Sumar existencia
   CREATE PROCEDURE SP_SumarExistencia
   @id_producto as int ,
   @Cantidad as int
   AS
   UPDATE Producto SET existencias=existencias+@Cantidad
   WHERE idProducto=@id_producto
   GO
    exec SP_SumarExistencia  7,623
    SELECT* FROM Producto
	GO
	 --- 4--Insertar registro
   CREATE PROCEDURE SP_InsertarRegistroCliente
   (
     @idCliente int ,
	 @nombre varchar(25),
	 @apPaterno varchar(50),
	 @apMaterno  varchar(20) ,
	 @direccion  varchar(100),
	 @telefono  varchar (20) ,
	 @correo varchar(50) 
	 )
	 AS
	 BEGIN
	 INSERT INTO Cliente(nombre,apPaterno,apMaterno,direccion,correo,telefono)
     VALUES    (@nombre,@apPaterno,@apMaterno,@direccion,@telefono,@correo)
	 END
	 GO

	 exec SP_InsertarRegistroCliente 1,'Maria ','Leyva','Leyva','Cd Deportiva, 25750 Monclova, Coah.','maria@gmail.com','+866-676-16-56'
	 SELECT*FROM Cliente
	 GO

 --- 5--ACTUALIZAR PRECIO PRODUCTO
  CREATE PROC ActualizaPrecioProducto
  (
    @Id INT,
    @Precio DECIMAL(8, 2)
)
AS
BEGIN
    UPDATE Producto
    SET Precio = @Precio
    WHERE idProducto = @Id
END
GO
 exec ActualizaPrecioProducto 3,434

  SELECT*FROM Producto

  GO
 --- 6---- Description: Obtener los productos por marcas.
 CREATE PROCEDURE SP_ProductosMarcas
 (
    @Marca INT
	)
AS
BEGIN
    ---SET NOCOUNT ON
    SELECT * FROM Producto WHERE idMarca = @Marca;
END
GO
EXEC SP_ProductosMarcas
    @Marca = 2;--Parametros de entrada

	GO
	---------7 En el ejemplo anterior, podemos ver que al eliminar un EMPLEADO y
	----este tiene una relación en otra tabla, lo primero que se realiza es eliminar los datos----
	---de la tabla relacionada para terminar de eliminar EMPLEADO y este Id no esté relacionado en tablas secundarias.
	
CREATE PROCEDURE SP_eliminarEmpleado
(
@idEmpleado INT
)
AS
IF EXISTS (SELECT * FROM Venta WHERE idEmpleado = @idEmpleado)
BEGIN

       DELETE FROM Venta WHERE idEmpleado = @idEmpleado
END
DELETE FROM Empleado WHERE idEmpleado = @idEmpleado
GO
EXEC SP_eliminarEmpleado  @idEmpleado = 7

SELECT *FROM Venta
SELECT *FROM Empleado
GO

-----8


CREATE PROCEDURE SP_GuardarActualizar
    @idPaquete int,
     @decripcion varchar(100) ,
	 @direccion varchar(100),
	 @idPaqueteria int,
	 @idPedido int 
AS
----Compara si existe o no existe el ID ya sea para poder actualizar o insertar uno nuevo
IF NOT EXISTS (SELECT * FROM Paquete WHERE idPaquete = @idPaquete)
------Es para poder insertar un registro nuevo
BEGIN
       INSERT INTO Paquete(decripcion,direccion,idPaqueteria,idPedido)
       VALUES (@decripcion,@direccion,@idPaqueteria,@idPedido)
END
-------Es para poder actualizar los campos 
ELSE
BEGIN
       UPDATE Paquete SET
       decripcion = @decripcion,
       direccion = @direccion,
       idPaqueteria = @idPaqueteria,
	     idPedido = @idPedido
       WHERE idPaquete = @idPaquete
END
GO
---Se actualiza uno que ya esta
EXEC SP_GuardarActualizar @idPaquete = 4, @decripcion = 'Mascara para pestanas a prueba de agua false lash', @direccion = 'Brasil #201, Guadalupe, 25750 Monclova, Coah..' ,
@idPaqueteria = 1  ,@idPedido = 9

----este se inserta uno nuevo
EXEC SP_GuardarActualizar 0, @decripcion = 'Protector Solar Facial Control De Brillo Fps 50+, 50ml', @direccion = 'Forever Living, Calz Colón 289, Primero de Cobián Centro, 27000 Torreón, Coah.' ,
@idPaqueteria = 1  ,@idPedido = 6
select *from Paquete
GO
--- 9--Mostrar una fecha
 CREATE PROCEDURE SP_NombreProducto
   AS
  select *from Producto
   where nombre=  'Labial';
   GO
   exec SP_NombreProducto
   GO
   --- 10---- Description: Obtener los productos por categoria.
 CREATE PROCEDURE SP_ProductosCategoria
 (
    @Categoria INT
	)
AS
BEGIN
    ---SET NOCOUNT ON
    SELECT * FROM Producto WHERE idCategoria = @Categoria;
END
GO
EXEC SP_ProductosCategoria
    @Categoria = 2;--Parametros de entrada
   GO


   
-------------TRIGGER 1-------------------------------------
 create table HistorialPaquete
 (
 idHistorialPaquete int identity(1,1) primary key,
 fecha date, 
 accion varchar(100)
 )
 go 
 --
 create trigger TR_insert_paquete
 on paquete for delete
 AS
 BEGIN 
 insert into HistorialPaquete(fecha,accion )
 values (getdate(), 'Se elimino un dato a un paquete')
 end
 go
  --Revisar que el trigger se realizo correctamente
 delete from Paquete where idPaquete= 9
 go
  -------------TRIGGER 2-------------------------------------
---este tiene que ir antes de hacer los insert para que s---
create table HistorialProducto
(
idHistorialProducto int identity(1,1) primary key,
fecha date, 
decripcion varchar(100)
)
go 
CREATE TRIGGER TR_ProductoInsertado
ON Producto for insert
AS
INSERT INTO HistorialProducto values(GETDATE(),'Registro insertado')
GO
------TRIGGER 3--------
CREATE TRIGGER MensajeMarca
ON Marca
FOR INSERT, UPDATE
AS
PRINT 'Se inserto correctamente'
GO
------TRIGGER 4-------

create trigger TR_MuestraAnteriorActualizado
on Sucursal
for update
as
if (update(direccion) or update(codigoPostal))
begin
select d.idSucursal,
(d.direccion+'  '+ d.codigoPostal) as 'registro anterior',
(i.direccion+'-'+ i.codigoPostal) as 'registro actualizado'
from deleted as d
join inserted as i
on d.idSucursal=i.idSucursal
end
go
UPDATE Sucursal SET direccion='Av. Del Estado 307, Tecnológico, 64700 Monterrey, N.L. ' WHERE idSucursal=1
  GO


------TRIGGER 5-------

  create table HistorialActualizar
(
idHistorialActualizar int identity(1,1) primary key,
fecha date,
accion varchar(100)
)
go

create trigger TR_Actualizar
on Cliente for update
AS
BEGIN
insert into HistorialActualizar(fecha,accion )
values (getdate(), 'Se actualizo el dato correcto')
end
go
--Revisar que el trigger se realizo correctamente
UPDATE Cliente SET nombre='Cesar' WHERE idCliente=1
go


  -------------TRIGGER 6------------------------------------
CREATE TRIGGER MensajeProducto
ON Producto
FOR INSERT, UPDATE
AS
PRINT 'Se inserto correctamente'
GO
------TRIGGER 7-------

create trigger TR_MuestraAnterior
on Empleado
for update
as
if (update(nombre))
begin
select d.idEmpleado,
(d.nombre) as 'registro anterior',
(i.nombre) as 'registro actualizado'
from deleted as d
join inserted as i
on d.idEmpleado=i.idEmpleado
end
go
UPDATE Empleado SET nombre='Alexander Gabriel' WHERE idEmpleado=1
GO
 -------------TRIGGER 8------------------------------------
CREATE TRIGGER MensajeEmpleado
ON Empleado
FOR INSERT, UPDATE
AS
PRINT 'Se inserto correctamente'
GO
------TRIGGER 9-------

create trigger TR_MuestraAnt
on Compra
for update
as
if (update(descripcion))
begin
select d.idCompra,
(d.descripcion) as 'registro anterior',
(i.descripcion) as 'registro actualizado'
from deleted as d
join inserted as i
on d.idCompra=i.idCompra
end
go
UPDATE Compra SET descripcion='Sombra de ojos paleta de maquillaje Contorno kit con 2 Polvo facial, 2 colorete, 1 lápiz delineador de ojos, 6 brushs y 6 de la ceja' WHERE idCompra=2
GO
 -------------TRIGGER 10------------------------------------
CREATE TRIGGER MensajeProveedor
ON Proveedor
FOR INSERT, UPDATE
AS
PRINT 'Se inserto correctamente'
GO




 
---------------------------------------------
create view vwConsulta2
as
select T1.idProducto, T1.nombre NombreProducto,
Categoria.idCategoria, Categoria.nombre NombreCategoria
from Producto AS T1
inner join Categoria on T1.idCategoria = Categoria.idCategoria
GO
--------------------------------------------------------
 create view vwConsulta3
as
select CONVERT (varchar (4),t4.idCliente)+'-'+(T4.Nombre+' '+T4.ApPaterno+' '+T4.ApMaterno)Nombre
FROM Cliente T4
WHERE T4.estatus=1 AND T4.Nombre like('J%')
GO
-----------------------------------------------
create view vwConsulta5
as
 SELECT MIN(precio)MenorPrecio
FROM Producto;
  GO
  -----------------------------------------------------------
  create view vwConsulta6
as
 SELECT Cliente.Nombre, Count(Pedido.idPedido) AS NumeroPedidos FROM Pedido
LEFT JOIN Cliente
ON Pedido.idCliente=Cliente.idCliente
GROUP BY Nombre;
  GO
------------------------------------------------------------------
 create view vwConsulta7
as
 select nombre, SUBSTRING(nombre, 1, 3) as Primeras3Letras,
getdate () as fecha
from Marca
  GO
------------------------------------------------------------------
 create view vwConsulta8
as
SELECT MAX(existencias)MayorExistencia
FROM Producto;
GO
----------------------------------------------
 create view vwConsulta9
as

select nombre Nombre, count(*) Cantidad from Producto 
group by nombre
GO
