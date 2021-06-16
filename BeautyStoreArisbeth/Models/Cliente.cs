using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("cliente")]
    public class Cliente
    {
        [Key]

        public Int32 idCliente
        {
            get; set;
        }
        public string nombre
        {
            get; set;
        }
        public string apPaterno
        {
            get; set;
        }
        public string apMaterno
        {
            get; set;
        }
        public string direccion
        {
            get; set;
        }
        public string telefono
        {
            get; set;
        }
        public string correo
        {
            get; set;
        }

        public bool estatus
        {
            get; set;
        }
       
    }
}