using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{

    [Table("pedido")]
    public class Pedido
    {
        [Key]

        public Int32 idPedido
        {
            get; set;
        }
        public string descripcion
        {
            get; set;
        }
       
        public bool estatus
        {
            get; set;
        }
        public int idCliente
        {
            get; set;
        }
    }
}