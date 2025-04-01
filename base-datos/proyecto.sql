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
    fecha_limite DATE
);
