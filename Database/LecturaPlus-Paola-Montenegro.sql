
CREATE DATABASE LecturaPlusDB;
GO

USE LecturaPlusDB;
GO

CREATE TABLE Libros (
    idLibro INT PRIMARY KEY IDENTITY(1,1),
    titulo NVARCHAR(100) NOT NULL,
    autor NVARCHAR(100) NOT NULL,
    genero NVARCHAR(50) NOT NULL,
    sinopsis NVARCHAR(MAX),
    portada_url NVARCHAR(MAX),
);
GO

CREATE TABLE Calificaciones (
    idCalificacion INT PRIMARY KEY IDENTITY(1,1),
    idLibro INT NOT NULL,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    fechaHora DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (idLibro) REFERENCES Libros(idLibro) ON DELETE CASCADE
);
GO


INSERT INTO Libros (titulo, autor, genero, sinopsis, portada_url) VALUES
('Fundamentos de Administración', 'Robbins y Coulter', 'Administración', 'Una introducción clara a los principios de administración moderna.', 'https://m.media-amazon.com/images/I/71Xk8RaM-6L.jpg'),
('Contabilidad Financiera', 'Horngren', 'Contabilidad', 'Conceptos clave de contabilidad financiera para estudiantes universitarios.', 'https://m.media-amazon.com/images/I/81E1EaqfAwL._AC_UF1000,1000_QL80_.jpg'),
('Cálculo Diferencial e Integral', 'James Stewart', 'Matemáticas', 'Libro de referencia para cursos de cálculo en universidades.', 'https://images-na.ssl-images-amazon.com/images/P/9706865446.01.LZZZZZZZ.jpg'),
('Marketing', 'Philip Kotler', 'Marketing', 'Una guía completa sobre los fundamentos del marketing.', 'https://www.ingebook.com/ib/pimg/Ingebook/00100_0000003600_5979.png'),
('Estructura de Datos', 'Nell Dale', 'Informática', 'Explicación clara de estructuras como pilas, colas, listas y árboles.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK1bx4Rsy5L9XUTMqjewXOWf6CLMQF85QWaw&s'),
('Bases de Datos', 'Elmasri y Navathe', 'Informática', 'Principios fundamentales del diseño y gestión de bases de datos.', 'https://m.media-amazon.com/images/I/A1plqjZnUCL._AC_UF1000,1000_QL80_.jpg'),
('Macroeconomía', 'Dornbusch y Fischer', 'Economía', 'Fundamentos de la macroeconomía aplicada al contexto universitario.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNZRQG_XkpsWY0tPC6cFJjHEMxJZQMlDobUg&s'),
('Psicología General', 'David G. Myers', 'Psicología', 'Un recorrido por los principios básicos de la psicología humana.', 'https://images.cdn3.buscalibre.com/fit-in/360x360/97/e6/97e6c0c5e19a15cc5e276ada6ca7b036.jpg'),
('Introducción al Derecho', 'Ernesto Gutiérrez y González', 'Derecho', 'Fundamentos del derecho moderno para estudiantes universitarios.', 'https://m.media-amazon.com/images/I/71V8uF6HMcL._AC_UF894,1000_QL80_.jpg'),
('Física Universitaria', 'Sears y Zemansky', 'Física', 'Libro clásico para cursos de física general en ingeniería.', 'https://libreria.ues.edu.sv/media/catalog/product/cache/4653e5302991b11f57c0fe9df9f26f45/s/c/scan_0058_4.jpg'),
('Química General', 'Chang y Goldsby', 'Química', 'Una introducción moderna a la química en el ámbito universitario.', 'https://m.media-amazon.com/images/I/61FaIXQlNgL._AC_UF1000,1000_QL80_.jpg'),
('Análisis Matemático', 'Walter Rudin', 'Matemáticas', 'Tratamiento riguroso del análisis para estudiantes avanzados.', 'https://m.media-amazon.com/images/I/51z1Nt9+UAL._AC_UF1000,1000_QL80_.jpg'),
('Estadística Aplicada', 'Mario Triola', 'Estadística', 'Aplicaciones reales de estadística con ejemplos universitarios.', 'https://www.ingebook.com/ib/pimg/Ingebook/00100_0000003175_8235.png'),
('Ética Profesional', 'Adela Cortina', 'Filosofía', 'Reflexión sobre ética aplicada a la vida profesional.', 'https://www.planetadelibros.com/usuaris/libros/thumbs/f198a172-e3f3-4265-a036-8ab5b3c4912a/d_360_620/portada_para-que-sirve-realmente-la-etica__201705300801.webp'),
('Sistemas Operativos', 'Abraham Silberschatz', 'Informática', 'Diseño y funcionamiento de sistemas operativos modernos.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1677791759i/574407.jpg');

GO;
