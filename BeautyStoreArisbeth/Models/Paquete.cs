using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("paquete")]
    public class Paquete
    {
        [Key]

        public Int32 idPaquete
        {
            get; set;
        }
        
        public string decripcion
        {
            get; set;
        }
        public string direccion
        {
            get; set;
        }

        public bool estatus
        {
            get; set;
        }
        public int idPaqueteria
        {
            get; set;
        }
        public int idPedido
        {
            get; set;
        }
        
    }
}