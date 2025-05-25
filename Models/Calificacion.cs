using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Biblioteca_Digital_Interactiva___Lectura_.Models
{
    public class Calificacion
    {
        [Key]
        [Column("idCalificacion")]
        public int IdCalificaciones { get; set; }

        [Range(1,5)]
        public int Puntuacion { get; set; }

        public DateTime FechaHora { get; set; }

        public int IdLibro { get; set; }

        [ForeignKey("IdLibro")]
        public virtual  Libro Libro { get; set; }
    }
}
