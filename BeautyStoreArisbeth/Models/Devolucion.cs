using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("devolucion")]
    public class Devolucion
    {
        [Key]

        public Int32 idDevolucion
        {
            get; set;
        }
        public string motivo
        {
            get; set;
        }
        public bool estatus
        {
            get; set;
        }
    }
}