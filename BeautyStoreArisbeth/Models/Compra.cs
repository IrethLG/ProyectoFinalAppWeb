using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("compra")]
    public class Compra
    {
        [Key]

        public Int32 idCompra
        {
            get; set;
        }
        public string descripcion
        {
            get; set;
        }
        public int cantidad
        {
            get; set;
        }
        public decimal precio
        {
            get; set;
        }
        public decimal total
        {
            get; set;
        }
        
        public bool estatus
        {
            get; set;
        }
        public int idProveedor
        {
            get; set;
        }
    }
}