using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("paqueteria")]
    public class Paqueteria
    {
        [Key]

        public Int32 idPaqueteria
        {
            get; set;
        }
        public string nombre
        {
            get; set;
        }
        public bool estatus
        {
            get; set;
        }
    }
}