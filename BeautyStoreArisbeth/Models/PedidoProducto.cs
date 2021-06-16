using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("pedidoproducto")]
    public class PedidoProducto
    {
        [Key]

        public Int32 idPedidoProducto
        {
            get; set;
        }
        public int idPedido
        {
            get; set;
        }
        public int idProducto
        {
            get; set;
        }
        public int cantidadProducto
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
    }
}