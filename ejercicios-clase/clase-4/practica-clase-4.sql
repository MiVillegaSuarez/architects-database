CREATE DATABASE clase_4;

USE clase_4;

    CREATE TABLE Curso (
        Id_curso INT AUTO_INCREMENT NOT NULL,
        nombre VARCHAR(255),
        descripcion TEXT,
        PRIMARY KEY(Id_curso)
    );

    CREATE TABLE Profesor (
        Id_profesor INT AUTO_INCREMENT NOT NULL,
        nombre VARCHAR(255),
        departamento VARCHAR(255),
        PRIMARY KEY(Id_profesor)
    );

    CREATE TABLE Estudiante (
        Id_estudiante INT AUTO_INCREMENT NOT NULL,
        nombre VARCHAR(255),
        correo VARCHAR(255),
        id_curso INT,
        PRIMARY KEY(Id_estudiante),
        FOREIGN KEY(id_curso) REFERENCES Curso(Id_curso)
    );

    CREATE TABLE Perfil (
        Id_perfil INT AUTO_INCREMENT NOT NULL,
        biografia TEXT,
        id_estudiante INT,
        PRIMARY KEY(Id_perfil),
        FOREIGN KEY(id_estudiante) REFERENCES Estudiante(Id_estudiante)
    );

    CREATE TABLE Curso_asignado (
        id_curso INT,
        id_profesor INT,
        PRIMARY KEY(id_curso, id_profesor),
        FOREIGN KEY(id_curso) REFERENCES Curso(Id_curso),
        FOREIGN KEY(id_profesor) REFERENCES Profesor(Id_profesor)
    );