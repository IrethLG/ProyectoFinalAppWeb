using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeautyStoreArisbeth.Models
{
    [Table("producto")]
    public class Producto
    {
        [Key]

        public Int32 idProducto
        {
            get; set;
        }
        public string nombre
        {
            get; set;
        }
        public string color
        {
            get; set;
        }
        public string detalles
        {
            get; set;
        }
        public decimal precio
        {
            get; set;
        }
        public int existencias
        {
            get; set;
        }
     

        public bool estatus
        {
            get; set;
        }
        public int idMarca
        {
            get; set;
        }
        public int idCategoria
        {
            get; set;
        }
        
    }
}