using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("productoalmacen")]
    public class ProductoAlmacen
    {
        [Key]

        public Int32 idProductoAlmacen
        {
            get; set;
        }
        
        public int idProducto
        {
            get; set;
        }
        public int idAlmacen
        {
            get; set;
        }
       
        public bool estatus
        {
            get; set;
        }
    }
}