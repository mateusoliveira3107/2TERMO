-- Active: 1788435081430@@127.0.0.1@3306@mysql
-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Pedido (
Id_Pedido int auto_increment primary key  PRIMARY KEY,
Data_Pedido datetime not null,
Id_Cliente int auto_increment primary key
)

CREATE TABLE Produto (
Id_Produto int auto_increment ,
Nome_Produto varchar(100) not null,
Id_Estoque int auto_increment primary key,
Quantidade int,
PRIMARY KEY(Id_Produto,Id_Estoque)
)

CREATE TABLE Cliente (
Id_Cliente int auto_increment primary key PRIMARY KEY,
Nome_Cliente varchar(50) not null
)

CREATE TABLE Fornecedor (
Id_Fornecedor int auto_increment primary key PRIMARY KEY,
Razao_Social varchar(100)
)

CREATE TABLE Produto (
Id_Produto int auto_increment primary key PRIMARY KEY,
Nome_Produto varchar(100) not null
)

CREATE TABLE Item_Produto (
Id_Produto int not null,
Id_Fornecedor int not null,
Id_Item int auto_increment primary key PRIMARY KEY,
Valor decimal(10, 2)

ALTER TABLE Pedido ADD FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)