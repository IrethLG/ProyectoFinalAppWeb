using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("venta")]
    public class Venta
    {
        [Key]

        public Int32 idVenta
        {
            get; set;
        }
      
        public decimal total
        {
            get; set;
        }
        public int cantidad
        {
            get; set;
        }
        public string detalles
        {
            get; set;
        }
        
        public bool estatus
        {
            get; set;
        }
        public int idEmpleado
        {
            get; set;
        }
        public int idProducto
        {
            get; set;
        }
        public int idCliente
        {
            get; set;
        }
        public int idFormaPago
        {
            get; set;
        }
    }
}