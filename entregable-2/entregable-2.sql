-- Creacion de Base de Datos

CREATE DATABASE entregable_2;

USE entregable_2;

-- Creacion de tablas
    CREATE TABLE Materias_primas (
        Id_materia_prima INT AUTO_INCREMENT,
        nombre_materia_prima VARCHAR(255),
        usos VARCHAR(255),
        pais_origen VARCHAR(255),
        PRIMARY KEY(Id_materia_prima)
    ); 

    CREATE TABLE Tipos_cerveza (
        Id_tipo_cerveza INT AUTO_INCREMENT,
        nombre_tipo_cerveza VARCHAR(255),
        PRIMARY KEY(Id_tipo_cerveza)
    );

    CREATE TABLE Categorias_cerveza (
        Id_categoria_cerveza INT AUTO_INCREMENT,
        nombre_categoria_cerveza VARCHAR(255),
        PRIMARY KEY(Id_categoria_cerveza)
    );

    CREATE TABLE Cervezas (
        Id_cerveza INT AUTO_INCREMENT,
        nombre_cerveza VARCHAR(255),
        color VARCHAR(255),
        grado_alcohol DECIMAL,
        pais_origen VARCHAR(255),
        fecha_creacion DATE,
        id_categoria INT,
        PRIMARY KEY(Id_cerveza),
        FOREIGN KEY(id_categoria) REFERENCES Categorias_cerveza(Id_categoria_cerveza)
    );

-- Tablas de ralacion

    CREATE TABLE Cervezas_materias_primas (
        id_cerveza INT,
        id_materia_prima INT,
        PRIMARY KEY(id_cerveza, id_materia_prima),
        FOREIGN KEY(id_cerveza) REFERENCES Cervezas(Id_cerveza),
        FOREIGN KEY(id_materia_prima) REFERENCES Materias_primas(Id_materia_prima)
    );

    CREATE TABLE Categorias_tipos (
        id_categoria_cerveza INT,
        id_tipo_cerveza INT,
        PRIMARY KEY(id_categoria_cerveza, id_tipo_cerveza),
        FOREIGN KEY(id_categoria_cerveza) REFERENCES Categorias_cerveza(Id_categoria_cerveza),
        FOREIGN KEY(id_tipo_cerveza) REFERENCES Tipos_cerveza(Id_tipo_cerveza)
    );

-- Ingreso de informacion a las tablas

    INSERT INTO Categorias_cerveza (nombre_categoria_cerveza) VALUES 
    ('Lagers'),
    ('Ales');

    INSERT INTO Tipos_cerveza (nombre_tipo_cerveza) VALUES 
    ('Dark'),
    ('Pale'),
    ('Bocks'),
    ('Stouts'),
    ('Porters'),
    ('Belgians'),
    ('Sours');

    INSERT INTO Materias_primas (nombre_materia_prima, usos, pais_origen) VALUES 
    ('Lupulo', 'Cerveza', 'Colombia'),
    ('Botella', 'Envace', 'Colombia'),
    ('Tapa', 'Envace', 'Colombia'),
    ('Malta', 'Cerveza', 'Colombia');

    INSERT INTO Cervezas (nombre_cerveza, color, grado_alcohol, pais_origen, fecha_creacion, id_categoria) VALUES 
    ('Poker', 'Palido', 3.5, 'Colombia', '2019-06-24', 1),
    ('Aguila', 'Ambar', 3.0, 'Colombia', '2020-09-06', 1),
    ('Club Colombia', 'Oscuro', 4.5, 'Colombia', '2021-02-19', 2);

-- Ingreso de informacion a las tablas de relacion

    INSERT INTO Cervezas_materias_primas (id_cerveza, id_materia_prima) VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3),
    (3, 4),
    (3, 2),
    (3, 3);


    INSERT INTO Categorias_tipos (id_categoria_cerveza, id_tipo_cerveza) VALUES 
    (1, 1),
    (2, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (1, 6),
    (2, 6),
    (2, 7);