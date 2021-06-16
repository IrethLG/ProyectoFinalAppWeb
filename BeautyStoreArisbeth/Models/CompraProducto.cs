using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("compraproducto")]
    public class CompraProducto
    {
        [Key]

        public Int32 idCompraProducto
        {
            get; set;
        }
        public int idCompra
        {
            get; set;
        }
        public int idProducto
        {
            get; set;
        }
       
        public bool estatus
        {
            get; set;
        }
    }
}