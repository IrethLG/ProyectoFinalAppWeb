using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("formapago")]
    public class FormaPago
    {
        [Key]

        public Int32 idFormaPago
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