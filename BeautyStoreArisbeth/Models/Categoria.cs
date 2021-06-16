using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("categoria")]
    public class Categoria
    {
        [Key]

        public Int32 idCategoria
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