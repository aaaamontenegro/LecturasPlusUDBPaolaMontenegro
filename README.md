# 📚 Biblioteca Digital Interactiva – Lectura+

**Descripción:**  
Aplicación web desarrollada con ASP.NET Core MVC y SQL Server que permite explorar libros digitales, calificarlos, ver un ranking de los más valorados y gestionar el catálogo mediante un CRUD completo.

---

## 🚀 Requisitos

- Visual Studio 2022 o superior con ASP.NET y desarrollo web habilitado.
- .NET SDK 8.0 o superior.
- SQL Server Express o instancia local de SQL Server.
- Navegador web moderno (Chrome, Edge, etc.).

---

## ⚙️ Configuración y ejecución

1. **Clonar o descargar el repositorio.**

2. **Abrir el proyecto en Visual Studio.**

3. **Ejecutar el script SQL:**

   - Archivo: `Database/LecturaPlus-Paola-Montenegro.sql`
   - Esto creará la base de datos y poblará las tablas `Libros` y `Calificaciones`.

4. **Verificar la cadena de conexión:**

   En `appsettings.json`:

   ```json
   "ConnectionStrings": {
     "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=LecturaPlusDB;Trusted_Connection=True;"
   }
🔧 Ajustar si usás otra instancia de SQL Server.

Ejecutar el proyecto con Ctrl + F5 o presionar el botón de "Iniciar".

## ✨ Funcionalidades principales

- 📖 **Catálogo paginado** de libros (5 por página).
- 🔍 **Búsqueda** por título y género.
- ⭐ **Calificación** de 1 a 5 estrellas sin necesidad de iniciar sesión.
- 🥇 **Ranking** de los 5 libros mejor valorados.
- ✏️ **CRUD completo**: crear, editar, eliminar libros.

---



Creado por:
Andrea Paola Montenegro Paz – MP101106
