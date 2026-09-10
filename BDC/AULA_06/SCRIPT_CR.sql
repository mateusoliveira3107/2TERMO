-- Active: 1788435081430@@127.0.0.1@3306@sesi_cr_tb
CREATE DATABASE SESI_CR_TB;
use SESI_CR_TB;


-- CRIAÇÃO DE TABELAS
CREATE TABLE CLIENTE (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    NOME_CLIENTE VARCHAR(60) NOT NULL
);

CREATE TABLE PEDIDO (
    ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
    DATA_PEDIDO DATETIME NOT NULL,
    ID_CLIENTE INT NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);

CREATE TABLE FORNECEDOR (
    ID_FORNECEDOR INT AUTO_INCREMENT PRIMARY KEY,
    RAZAO_SOCIAL VARCHAR(60) NOT NULL
);

CREATE TABLE PRODUTO (
    ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
    NOME_PRODUTO VARCHAR(60) NOT NULL,
    ID_FORNECEDOR INT NOT NULL,
    FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDOR (ID_FORNECEDOR)
);

-- DESAFIOS

-- 1 QUESTÃO. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria.
-- 1,N e 1,1

-- 2 QUESTÃO. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário.
-- 1,N e 1,1

--3 QUESTÃO. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores.
-- 1,N e 1,N

-- 4 QUESTÃO. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar vinculada a uma mesa.
-- 0,n e 1,1

-- 5 QUESTÃO. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- 1,N e 1,1


-- CONSULTA DE TABELAS
SELECT * FROM cliente;
SELECT * FROM pedido;

-- INSERINDO DADOS NA TABELA
INSERT INTO cliente (NOME_CLIENTE) VALUES
('BRUNO'),
('MARIA'),
('JOSÉ');
