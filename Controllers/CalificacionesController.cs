using Biblioteca_Digital_Interactiva___Lectura_.Data;
using Biblioteca_Digital_Interactiva___Lectura_.Models;
using Microsoft.AspNetCore.Mvc;

namespace Biblioteca_Digital_Interactiva___Lectura_.Controllers
{
    public class CalificacionesController : Controller
    {

        private readonly AppDbContext _context;

        public CalificacionesController(AppDbContext context)
        {
            _context = context;
        }


        [HttpPost]
        public async Task<IActionResult> Calificar(int IdLibro, int Puntuacion)
        {
            if (Puntuacion < 1 || Puntuacion > 5)
            {
                TempData["Error"] = "La puntuación debe estar entre 1 y 5.";
                return RedirectToAction("Index", "Libros");
            }

            var calificacion = new Calificacion
            {
                IdLibro = IdLibro,
                Puntuacion = Puntuacion,
                FechaHora = DateTime.Now
            };

            _context.Calificaciones.Add(calificacion);
            await _context.SaveChangesAsync();

            TempData["Success"] = "¡Gracias por tu calificación!";
            return RedirectToAction("Index", "Libros");
        }

    }
}
