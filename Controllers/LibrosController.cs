using Biblioteca_Digital_Interactiva___Lectura_.Data;
using Biblioteca_Digital_Interactiva___Lectura_.Models;
using Biblioteca_Digital_Interactiva___Lectura_.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Biblioteca_Digital_Interactiva___Lectura_.Controllers
{
    public class LibrosController : Controller
    {

        private readonly AppDbContext _context;

        public LibrosController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(string buscarGenero, string buscarTitulo, int pagina = 1)
        {
            int tamanoPagina = 6;

            var libros = _context.Libros.AsQueryable();

            if (!string.IsNullOrEmpty(buscarGenero))
                libros = libros.Where(l => l.Genero.Contains(buscarGenero));

            if (!string.IsNullOrEmpty(buscarTitulo))
                libros = libros.Where(l => l.Titulo.Contains(buscarTitulo));

            int totalLibros = await libros.CountAsync();

            var librosPaginados = await libros
                .OrderBy(l => l.IdLibro)
                .Skip((pagina - 1) * tamanoPagina)
                .Take(tamanoPagina)
                .ToListAsync();

            ViewBag.PaginaActual = pagina;
            ViewBag.TotalPaginas = (int)Math.Ceiling((double)totalLibros / tamanoPagina);
            ViewBag.BuscarGenero = buscarGenero;
            ViewBag.BuscarTitulo = buscarTitulo;

            return View(librosPaginados);
        }


        public async Task<IActionResult> TopLecturas()
        {
            var topLibros = await _context.Libros
                .Where(l => l.Calificaciones.Any())
                .Select(l => new
                {
                    Libro = l,
                    Promedio = l.Calificaciones.Average(c => c.Puntuacion)
                })
                .OrderByDescending(l => l.Promedio)
                .ThenBy(l => l.Libro.Titulo)
                .Take(5)
                .ToListAsync();

            var viewModel = topLibros.Select((x, i) => new TopLibroViewModel
            {
                Libro = x.Libro,
                Promedio = x.Promedio,
                Posicion = i + 1
            }).ToList();

            return View(viewModel);
        }

        public async Task<IActionResult> IndexCrud()
        {
            var libros = await _context.Libros.ToListAsync();
            return View(libros);
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Titulo,Autor,Genero,Sinopsis,Portada_Url")] Libro libro)
        {
            if (ModelState.IsValid)
            {
                _context.Add(libro);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Libro agregado exitosamente.";
                return RedirectToAction(nameof(IndexCrud));
            }
            TempData["Error"] = "Ocurrió un error al guardar el libro.";
            return View(libro);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
                return NotFound();

            var libro = await _context.Libros.FindAsync(id);
            if (libro == null)
                return NotFound();

            return View(libro);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdLibro,Titulo,Autor,Genero,Sinopsis,Portada_Url")] Libro libro)
        {
            if (id != libro.IdLibro)
                return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(libro);
                    await _context.SaveChangesAsync();
                    TempData["Success"] = "Libro actualizado exitosamente.";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!_context.Libros.Any(e => e.IdLibro == id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(IndexCrud));
            }

            TempData["Error"] = "Ocurrió un error al actualizar el libro.";
            return View(libro);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var libro = await _context.Libros.FindAsync(id);
            if (libro != null)
            {
                _context.Libros.Remove(libro);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Libro eliminado correctamente.";
            }
            else
            {
                TempData["Error"] = "No se encontró el libro.";
            }

            return RedirectToAction(nameof(IndexCrud));
        }





    }
}
