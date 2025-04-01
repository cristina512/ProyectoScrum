CREATE TABLE GESTOR (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE USUARIO (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    gestor_id INT,
    CONSTRAINT fk_gestor FOREIGN KEY (gestor_id) REFERENCES GESTOR(id)
);

CREATE TABLE Equipo (
    id_equipo NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Tarea (
    id_tarea NUMBER PRIMARY KEY,
    descripcion VARCHAR2(255) NOT NULL,
    fecha_limite DATE,
    FOREIGN KEY (usuario_creador_id) REFERENCES Usuario(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Usuario_Equipo (
    usuario_id NUMBER PRIMARY KEY,
    equipo_id NUMBER PRIMARY KEY,
    PRIMARY KEY (usuario_id, equipo_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Asignacion_Tarea (
    id_asignacion NUMBER PRIMARY KEY,
    tarea_id NUMBER NOT NULL,
    usuario_asigna_id NUMBER NOT NULL,
    usuario_recibe_id NUMBER NOT NULL,
    FOREIGN KEY (tarea_id) REFERENCES Tarea(id_tarea),
    FOREIGN KEY (usuario_asigna_id) REFERENCES Usuario(id),
    FOREIGN KEY (usuario_recibe_id) REFERENCES Usuario(id)
);