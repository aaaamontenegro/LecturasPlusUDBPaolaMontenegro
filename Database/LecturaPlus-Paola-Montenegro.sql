
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
('Fundamentos de Administraci�n', 'Robbins y Coulter', 'Administraci�n', 'Una introducci�n clara a los principios de administraci�n moderna.', 'https://m.media-amazon.com/images/I/71Xk8RaM-6L.jpg'),
('Contabilidad Financiera', 'Horngren', 'Contabilidad', 'Conceptos clave de contabilidad financiera para estudiantes universitarios.', 'https://m.media-amazon.com/images/I/81E1EaqfAwL._AC_UF1000,1000_QL80_.jpg'),
('C�lculo Diferencial e Integral', 'James Stewart', 'Matem�ticas', 'Libro de referencia para cursos de c�lculo en universidades.', 'https://images-na.ssl-images-amazon.com/images/P/9706865446.01.LZZZZZZZ.jpg'),
('Marketing', 'Philip Kotler', 'Marketing', 'Una gu�a completa sobre los fundamentos del marketing.', 'https://www.ingebook.com/ib/pimg/Ingebook/00100_0000003600_5979.png'),
('Estructura de Datos', 'Nell Dale', 'Inform�tica', 'Explicaci�n clara de estructuras como pilas, colas, listas y �rboles.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK1bx4Rsy5L9XUTMqjewXOWf6CLMQF85QWaw&s'),
('Bases de Datos', 'Elmasri y Navathe', 'Inform�tica', 'Principios fundamentales del dise�o y gesti�n de bases de datos.', 'https://m.media-amazon.com/images/I/A1plqjZnUCL._AC_UF1000,1000_QL80_.jpg'),
('Macroeconom�a', 'Dornbusch y Fischer', 'Econom�a', 'Fundamentos de la macroeconom�a aplicada al contexto universitario.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNZRQG_XkpsWY0tPC6cFJjHEMxJZQMlDobUg&s'),
('Psicolog�a General', 'David G. Myers', 'Psicolog�a', 'Un recorrido por los principios b�sicos de la psicolog�a humana.', 'https://images.cdn3.buscalibre.com/fit-in/360x360/97/e6/97e6c0c5e19a15cc5e276ada6ca7b036.jpg'),
('Introducci�n al Derecho', 'Ernesto Guti�rrez y Gonz�lez', 'Derecho', 'Fundamentos del derecho moderno para estudiantes universitarios.', 'https://m.media-amazon.com/images/I/71V8uF6HMcL._AC_UF894,1000_QL80_.jpg'),
('F�sica Universitaria', 'Sears y Zemansky', 'F�sica', 'Libro cl�sico para cursos de f�sica general en ingenier�a.', 'https://libreria.ues.edu.sv/media/catalog/product/cache/4653e5302991b11f57c0fe9df9f26f45/s/c/scan_0058_4.jpg'),
('Qu�mica General', 'Chang y Goldsby', 'Qu�mica', 'Una introducci�n moderna a la qu�mica en el �mbito universitario.', 'https://m.media-amazon.com/images/I/61FaIXQlNgL._AC_UF1000,1000_QL80_.jpg'),
('An�lisis Matem�tico', 'Walter Rudin', 'Matem�ticas', 'Tratamiento riguroso del an�lisis para estudiantes avanzados.', 'https://m.media-amazon.com/images/I/51z1Nt9+UAL._AC_UF1000,1000_QL80_.jpg'),
('Estad�stica Aplicada', 'Mario Triola', 'Estad�stica', 'Aplicaciones reales de estad�stica con ejemplos universitarios.', 'https://www.ingebook.com/ib/pimg/Ingebook/00100_0000003175_8235.png'),
('�tica Profesional', 'Adela Cortina', 'Filosof�a', 'Reflexi�n sobre �tica aplicada a la vida profesional.', 'https://www.planetadelibros.com/usuaris/libros/thumbs/f198a172-e3f3-4265-a036-8ab5b3c4912a/d_360_620/portada_para-que-sirve-realmente-la-etica__201705300801.webp'),
('Sistemas Operativos', 'Abraham Silberschatz', 'Inform�tica', 'Dise�o y funcionamiento de sistemas operativos modernos.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1677791759i/574407.jpg');

GO;
