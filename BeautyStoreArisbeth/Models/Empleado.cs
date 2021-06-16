using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("empleado")]
    public class Empleado
    {
        [Key]

        public Int32 idEmpleado
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
        public Int32 idSucursal
        {
            get; set;
        }
    }
}