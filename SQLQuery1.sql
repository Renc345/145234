CREATE DATABASE SalesOfMaterial;
USE SalesOfMaterial;

CREATE TABLE Employee
(
	IdEmployee INT PRIMARY KEY IDENTITY,
	FIO NVARCHAR(MAX),
	Login_Employee NVARCHAR(MAX),
	Password_Employee NVARCHAR(MAX),
	IdTypesEmployee INT REFERENCES TypesEmployee (IdTypesEmployee)
)

CREATE TABLE TypesEmployee
(
	IdTypesEmployee INT PRIMARY KEY IDENTITY,
	Nazv_type NVARCHAR(MAX)
)

CREATE TABLE Warehouse
(
	IdWarehouse INT PRIMARY KEY IDENTITY,
	Nazv_Warehouse NVARCHAR(MAX),
	Adress_Warehouse NVARCHAR(MAX)
)

CREATE TABLE Materials
(
	IdMaterial INT PRIMARY KEY IDENTITY,
	Nazv_Material  NVARCHAR(MAX),
	IdTypesOfMaterials INT REFERENCES TypesOfMaterials (IdTypesOfMaterials),
	PricePerUnit float
)

Create Table TypesOfMaterials
(
	IdTypesOfMaterials INT PRIMARY KEY IDENTITY,
	Nazv_Type  NVARCHAR(MAX)
)

Create Table ExpenseComposition
(
	IdExpenseComposition INT PRIMARY KEY IDENTITY,
	IdExpenseIvoices INT REFERENCES  ExpenseIvoices(IdExpenseIvoices),
	IdMaterial INT REFERENCES  Materials(IdMaterial),
	Quantity INT
)

Create Table ExpenseIvoices
(
	IdExpenseIvoices INT PRIMARY KEY IDENTITY,
	Id—ounterparties INT REFERENCES  —ounterparties(Id—ounterparties),
	IdWarehouse INT REFERENCES  Warehouse(IdWarehouse),
	IdEmployee INT REFERENCES  Employee(IdEmployee),
	Date_Transfer date
)

Create Table —ounterparties
(
	Id—ounterparties  INT PRIMARY KEY IDENTITY,
	Nazv_—ounterparties  NVARCHAR(MAX),
	INN NVARCHAR(12),
	Adress_—ounterparties NVARCHAR(MAX)
)

Create Table Storage
(
	IDStorage INT PRIMARY KEY IDENTITY,
	IdWarehouse INT REFERENCES Warehouse (IdWarehouse),
	IdMaterial INT REFERENCES Materials(IdMaterial),
	Quantity INT
)