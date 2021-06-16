using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("marca")]
    public class Marca
    {
        [Key]

        public Int32 idMarca
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