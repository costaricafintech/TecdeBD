-- Crear la base de datos 'EmpresaDemo'
CREATE DATABASE EmpresaDemo;
GO

USE EmpresaDemo;
GO

-- Crear tabla de Provincias
CREATE TABLE Provincias (
    ProvinciaID INT PRIMARY KEY IDENTITY(1,1),
    NombreProvincia NVARCHAR(100) NOT NULL
);
GO

-- Crear tabla de Cantones
CREATE TABLE Cantones (
    CantonID INT PRIMARY KEY IDENTITY(1,1),
    ProvinciaID INT FOREIGN KEY REFERENCES Provincias(ProvinciaID),
    NombreCanton NVARCHAR(100) NOT NULL
);
GO

-- Crear tabla de Distritos
CREATE TABLE Distritos (
    DistritoID INT PRIMARY KEY IDENTITY(1,1),
    CantonID INT FOREIGN KEY REFERENCES Cantones(CantonID),
    NombreDistrito NVARCHAR(100) NOT NULL
);
GO

-- Crear tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    ProvinciaID INT FOREIGN KEY REFERENCES Provincias(ProvinciaID),
    CantonID INT FOREIGN KEY REFERENCES Cantones(CantonID),
    DistritoID INT FOREIGN KEY REFERENCES Distritos(DistritoID),
    DireccionExacta NVARCHAR(255) NOT NULL
);
GO

-- Crear tabla de Información Crediticia
CREATE TABLE InfoCrediticia (
    InfoCrediticiaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    ScoreCrediticio INT CHECK (ScoreCrediticio BETWEEN 300 AND 850), -- Ejemplo de rango para un score crediticio tipo FICO
    LimiteCredito DECIMAL(15,2),
    DeudaActual DECIMAL(15,2)
);
GO

