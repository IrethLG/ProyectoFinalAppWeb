using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("almacen")]
    public class Almacen
    {
        [Key]

        public Int32 idAlmacen
        {
            get; set;
        }
        public int entradas
        {
            get; set;
        }
        public int salidas
        {
            get; set;
        }
        public int stock
        {
            get; set;
        }
        public bool estatus
        {
            get; set;
        }
    }
}