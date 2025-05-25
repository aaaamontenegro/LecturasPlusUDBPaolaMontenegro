using Microsoft.EntityFrameworkCore;
using Biblioteca_Digital_Interactiva___Lectura_.Models;

namespace Biblioteca_Digital_Interactiva___Lectura_.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options) { }

        public DbSet<Libro> Libros { get; set; }
        public DbSet<Calificacion> Calificaciones { get; set; }
    }
}