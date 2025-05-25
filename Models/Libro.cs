using System.ComponentModel.DataAnnotations;

namespace Biblioteca_Digital_Interactiva___Lectura_.Models
{
    public class Libro
    {

        [Key]
        public int IdLibro { get; set; }
        public required string Titulo { get; set; }
        public required string Autor { get; set; }

        public required string Genero { get; set; }

        public required string Sinopsis { get; set; }

        public required string Portada_Url { get; set; }

        public virtual List<Calificacion> Calificaciones { get; set; } = new();
    }
}

