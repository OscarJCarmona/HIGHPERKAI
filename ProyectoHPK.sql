CREATE DATABASE HIGHPERKAI

USE HIGHPERKAI

CREATE TABLE CUENTA
(NoCuenta INT NOT NULL,
Correo VARCHAR(100) NOT NULL,
Contraseņa VARCHAR(20) NOT NULL,
TipoCuenta VARCHAR(10) NOT NULL
PRIMARY KEY (NoCuenta)
)

CREATE TABLE RUTINA
(IDRutina INT,
Nombre VARCHAR(200) NOT NULL,
Descripcion VARCHAR(5000) NOT NULL,
Intensidad VARCHAR(10) NOT NULL,
Duracion TIME NOT NULL,
Calorias INT NOT NULL,
Completada VARCHAR(2)
PRIMARY KEY(IDRutina)
)

CREATE TABLE ATLETA
(NoAtleta INT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellidos VARCHAR(50) NOT NULL,
Estatura INT NOT NULL,
Peso FLOAT(2) NOT NULL,
Deporte VARCHAR(20) NOT NULL,
Foto VARBINARY(MAX) NOT NULL,
NoCuenta INT FOREIGN KEY REFERENCES CUENTA(NoCuenta),
IDRutina INT FOREIGN KEY REFERENCES RUTINA(IDRutina)
PRIMARY KEY (NoAtleta)
)

CREATE TABLE ENTRENADOR
(NoEntrenador INT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellidos VARCHAR(50) NOT NULL,
Deporte VARCHAR(20) NOT NULL,
Foto VARBINARY(MAX) NOT NULL,
NoCuenta INT FOREIGN KEY REFERENCES CUENTA(NoCuenta),
IDRutina INT FOREIGN KEY REFERENCES RUTINA(IDRutina)
PRIMARY KEY (NoEntrenador)
)

CREATE TABLE ACTIVIDAD
(IDActividad INT NOT NULL,
Nombre VARCHAR(200) NOT NULL,
Descripcion VARCHAR(5000) NOT NULL,
Sesiones INT NOT NULL,
Duracion INT NOT NULL,
Fecha DATE NOT NULL,
Calorias INT NOT NULL,
Completado VARCHAR(2),
IDRutina INT FOREIGN KEY REFERENCES RUTINA(IDRutina)
)

CREATE TABLE RESULTADOS
(RutinasCompletadas INT NOT NULL,
ActividadesCompletadas INT NOT NULL,
HorasAcumuladas INT NOT NULL,
CaloriasAcumuladas INT NOT NULL,
NoAtleta INT FOREIGN KEY REFERENCES ATLETA(NoAtleta)
)

CREATE TABLE MENU
(IDMenu INT NOT NULL,
Nombre VARCHAR(200) NOT NULL,
Descripcion VARCHAR(5000) NOT NULL,
Calorias INT NOT NULL,
Patlillo VARCHAR(5) NOT NULL
PRIMARY KEY (IDMenu)
)

CREATE TABLE INGREDIENTE
(Nombre VARCHAR(200) NOT NULL,
Cantidad VARCHAR(50) NOT NULL,
IDMenu INT FOREIGN KEY REFERENCES MENU(IDMenu)
)

CREATE TABLE BITACORA (
Indice INT IDENTITY PRIMARY KEY,
Descripcion VARCHAR(30) NOT NULL,
Fecha DATETIME NOT NULL,
Tabla VARCHAR(25) NOT NULL
)

CREATE TRIGGER InsertarCuenta ON CUENTA
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'CUENTA')
END

CREATE TRIGGER EliminarCuenta ON CUENTA
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'CUENTA')
END

CREATE TRIGGER ActualizarCuenta ON CUENTA
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'CUENTA')
END

CREATE TRIGGER InsertarRutina ON RUTINA
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'RUTINA')
END

CREATE TRIGGER EliminarRutina ON RUTINA
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'RUTINA')
END

CREATE TRIGGER ActualizarRutina ON RUTINA
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'RUTINA')
END

CREATE TRIGGER InsertarAtleta ON ATLETA
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'ATLETA')
END

CREATE TRIGGER EliminarAtleta ON ATLETA
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'ATLETA')
END

CREATE TRIGGER ActualizarAtleta ON ATLETA
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'ATLETA')
END

CREATE TRIGGER InsertarEntrenador ON ENTRENADOR
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'ENTRENADOR')
END

CREATE TRIGGER EliminarEntrenador ON ENTRENADOR
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'ENTRENADOR')
END

CREATE TRIGGER ActualizarEntrenador ON ENTRENADOR
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'ENTRENADOR')
END

CREATE TRIGGER InsertarActividad ON ACTIVIDAD
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'ACTIVIDAD')
END

CREATE TRIGGER EliminarActividad ON ACTIVIDAD
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'ACTIVIDAD')
END

CREATE TRIGGER ActualizarActividad ON ACTIVIDAD
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'ACTIVIDAD')
END

CREATE TRIGGER InsertarResultados ON RESULTADOS
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'RESULTADOS')
END

CREATE TRIGGER EliminarResultados ON RESULTADOS
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'RESULTADOS')
END

CREATE TRIGGER ActualizarResultados ON RESULTADOS
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'RESULTADOS')
END

CREATE TRIGGER InsertarMenu ON MENU
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'MENU')
END

CREATE TRIGGER EliminarMenu ON MENU
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'MENU')
END

CREATE TRIGGER ActualizarMenu ON MENU
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'MENU')
END

CREATE TRIGGER InsertarIngrediente ON INGREDIENTE
FOR INSERT
AS
BEGIN
INSERT INTO BITACORA VALUES ('Insertar',GETDATE(),'INGREDIENTE')
END

CREATE TRIGGER EliminarIngrediente ON INGREDIENTE
FOR DELETE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Eliminar',GETDATE(),'INGREDIENTE')
END

CREATE TRIGGER ActualizarIngrediente ON INGREDIENTE
FOR UPDATE
AS
BEGIN
INSERT INTO BITACORA VALUES ('Actualizar',GETDATE(),'INGREDIENTE')
END

CREATE RULE Correo as @value LIKE '%@%'
EXEC sp_bindrule Correo,'CUENTA.Correo'

ALTER TABLE dbo.CUENTA ADD CONSTRAINT U_Correo UNIQUE (Correo)