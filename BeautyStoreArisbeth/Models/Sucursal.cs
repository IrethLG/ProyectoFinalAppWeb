using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("sucursal")]
    public class Sucursal
    {
        [Key]
        public Int32 idSucursal
        {
            get; set;
        }
        public string direccion
        {
            get; set;
        }
        public string horario
        {
            get; set;
        }
        public string codigoPostal
        {
            get; set;
        }
        public string telefono
        {
            get; set;
        }
        

        public bool estatus
        {
            get; set;
        }
    }
}