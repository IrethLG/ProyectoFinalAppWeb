using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("pedidodevolucion")]
    public class PedidoDevolucion
    {
        [Key]

        public Int32 idPedidoDevolucion
        {
            get; set;
        }

        public int idPedido
        {
            get; set;
        }
        public int idDevolucion
        {
            get; set;
        }

        public bool estatus
        {
            get; set;
        }
    }
}