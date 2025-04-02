CREATE TABLE GESTOR (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE USUARIO (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    gestor_id INT,
    CONSTRAINT fk_gestor FOREIGN KEY (gestor_id) REFERENCES GESTOR(id)
);

CREATE TABLE Equipo (
    id_equipo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Tarea (
    id_tarea INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    fecha_limite DATE,
    usuario_creador_id INT NOT NULL,
    equipo_id INT NOT NULL,
    FOREIGN KEY (usuario_creador_id) REFERENCES USUARIO(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Usuario_Equipo (
    usuario_id INT,
    equipo_id INT,
    PRIMARY KEY (usuario_id, equipo_id),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Asignacion_Tarea (
    id_asignacion INT PRIMARY KEY,
    tarea_id INT NOT NULL,
    usuario_asigna_id INT NOT NULL,
    usuario_recibe_id INT NOT NULL,
    FOREIGN KEY (tarea_id) REFERENCES Tarea(id_tarea),
    FOREIGN KEY (usuario_asigna_id) REFERENCES USUARIO(id),
    FOREIGN KEY (usuario_recibe_id) REFERENCES USUARIO(id)
);
