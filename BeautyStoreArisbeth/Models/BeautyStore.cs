using System;
using System.Data.Entity;


namespace BeautyStoreArisbeth.Models
{
    public class BeautyStore:DbContext
    {
        public DbSet<Marca> marca
        {
            get; set;
        }
        public DbSet<Categoria> categoria
        {
            get; set;
        }
        public DbSet<Proveedor> proveedor
        {
            get; set;
        }
        public DbSet<Cliente> clientes
        {
            get; set;
        }
        public DbSet<Empleado> empleados
        {
            get; set;
        }
        public DbSet<Sucursal> sucursal
        {
            get; set;
        }
        public DbSet<Devolucion> devolucion
        {
            get; set;
        }
        public DbSet<FormaPago> formapago
        {
            get; set;
        }
        public DbSet<Almacen> almacen
        {
            get; set;
        }
        public DbSet<Producto> producto
        {
            get; set;
        }
        public DbSet<Pedido> pedidos
        {
            get; set;
        }
        public DbSet<Paqueteria> paqueteria
        {
            get; set;
        }
        public DbSet<Venta> ventas
        {
            get; set;
        }
        public DbSet<Paquete> paquete
        {
            get; set;
        }
        public DbSet<Compra> compra
        {
            get; set;
        }
        public DbSet<PedidoProducto> pedidoproducto
        {
            get; set;
        }
        public DbSet<ProductoAlmacen> productoalmacen
        {
            get; set;
        }

        public DbSet<PedidoDevolucion> pedidodevoluciones
        {
            get; set;
        }
        public DbSet<CompraProducto> compraproductos
        {
            get; set;
        }
    }
}