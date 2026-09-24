-- BANCO DE DADOS - SMARTCOFFEE - DML
--rECURSO DE RESET DE BANCO DE DADOS
-- DROP DATABASE IF EXISTS SMARTCOFFEE_DML_MATEUS;
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_MATEUS;
USE SMARTCOFFEE_DML_MATEUS;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitatio DECIMAL (10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
);

-- INSERINDO DADOS NO BD
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Mateus Silva", "matheus@gmail.com", "19999999901", "Limeira", TRUE),
("Maria Eduarda", "maria@gamil.com" "19999999902", "Limeira", TRUE),
("Matheus Oricolli", "matheusc@gmail.com", "19999999903", "Limeira", TRUE)
("Luiz Felipe", "luis@gmail.com", "19999999904", "Limeira", TRUE),
("Nicolas Filipe", "nicolas@gmail.com", "19999999905", "Limeira", TRUE),
("Otavio Correia", "otavio@gmail.com", "19999999906", "Conchal", TRUE),
("Pedro Mirando", "pedro@gmail.com", "19999999907", "Limeira", TRUE),
("Rebecca", "rebecca@gmail.com", "19999999908", "Limeira", TRUE),
("Rafael Vieira", "rafael@gmail.com", NULL, "Limeira", TRUE),
("Rennan Campos", "rennan@gmail.com", "19999999909", "Limeira", TRUE),
("Samira Dalosto", "samira@gmail.com", NULL, "Ourinhos", False),
("Sophia Carolina", "sophia@email.com", "19999999910", "Limeira", TRUE),
("Stefany Santana", "stefany@email.com", NULL, "Limeira", TRUE),
("Vanessa Queiroz", "vanessa@email.com", "19999999912", "Limeira", TRUE),
("Vinicius Henrique", "vinicius@email.com", "19999999913", "Limeira", TRUE),
("Vinicius Oliveira", "viniciuso@email.com", "19999999914", "Limeira", TRUE);

SELECT * FROM cliente;

INSERT INTO categoria (nome) VALUES
(("Café"),
("Bebidas Quentes"),
("Bebidas Geladas"),
("Doces"),
("Salgados"),
("Combo"));


SELECT * FROM categoria;

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
(("Café", 5.99, TRUE, 1),
("Capuccino", 8.99, TRUE, 2),
("Esfirra", 9.99, TRUE, 5),
("Brigadeiro", 2.99, FALSE, 4),
("Combo salgado e café", 12.99, TRUE, 6),
("Bolo de chocolate", 10.99, TRUE, 4),
("Suco natural", 9.99, TRUE, 3),
("Pão de queijo", 7.99, TRUE, 5));

SELECT * FROM produto;

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(("2026-11-04 16:25:00", "ABERTO", 0.00, 1),
("2026-12-03 12:30:00", "FINALIZADO", 19.99, 2),
("2026-11-02 14:35:00", "CANCELADO", 10.99, 3),
("2026-10-03 13:15:00", "PREPARANDO", 30.99, 4),
("2026-09-06 09:20:00", "FINALIZADO", 19.99, 6),
("2026-10-09 21:32:00", "CANCELADO", 5.99, 5));

SELECT * FROM pedido

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
((1, 38, 1, 5.99, "Entregar Quente"),
(2, 39, 2, 5.99, "Entregar Quente"),
(3, 60, 1, 5.99, "Deixar Macio"),
(4, 61, 2, 5.99, "Deixar Macio"),
(5, 62, 3, 5.99, "Entregar Quente"));

SELECT * FROM item_pedido;

INSERT INTO forma_pagamento (descricao) VALUES
(("Dinheiro"), ("Cartão de Débito"), ("Cartão de Crédito"), ("Pix"));

SELECT * FROM forma_pagamento;

INSERT INTO pagamento(id_pedido, id_forma_pagamento, valor) VALUES
((2, 4, 19.99),
(3, 2, 10.99),
(4, 1, 39.99),
(5, 3, 19.99),
(1, 2, 0.00));

SELECT * FROM item_pedido;

------------------------------------------------------
-- EXEMPLO NOVO DE INSERÇÃO DE DADOS PORÉM COM RECUPERAÇÃO DO ÚLTIMO ID
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), "Aberto", 0.00, 1);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

------------------------------------------------------
-- ATUALIZAÇÕES E MODIFICAÇÕES DE DADOS

-- Exemplo 1
UPDATE cliente
SET telefone = "19999998801"
WHERE id_cliente = 9;

-- Exemplo 2
UPDATE produto
SET preco = 1.00;
-- Sem "where" que é a condição, o preço de todos os dados da tabela produto são alterados
-- NUNCA REALIZAR UM UPDATE SEM --- WHERE 😡

UPDATE cliente
SET telefone = "19987869445"
WHERE nome_cliente = "Mateus Silva";

-- EX: 3
UPDATE cliente
SET telefone = "19977777701",
cidade = "Valinhos"
WHERE id_cliente 9;

-- EX 4: Ajustes de valores
UPDATE produto
SET preco = produto * 1.05
WHERE id_categoria = 1;

-- EX 5: Ajustes de atualizações condicionais
UPDATE produto
SET preco = CASE 
    WHEN preco < 10 THEN preco * 1.10
    ELSE  preco * 1.05
END
WHERE ativo = TRUE;

------------------------------------------------------
-- APAGAR DADOS OS BD

-- EX 1: Apagar um cliente específico
DELETE FROM cliente
WHERE id_cliente = 9;

-- EX 2: Apagar todos os clientes inativos
DELETE FROM clienteWHERE ativo = FALSE;

-- EX 3: Apagar todos os clientes de uma cidade específica
DELETE FROM cliente
WHERE cidade = "Chicago";

-- EX 4: Exclusão lógica
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 10;

SELECT * from cliente
