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
("Café"),
("Bebidas Quentes"),
("Bebidas Geladas"),
("Doces"),
("Salgados"),
("Combo")

SELECT * FROM categoria;

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
("Café", 5.99, TRUE, 1),
("Capuccino", 8.99, TRUE, 2),
("Esfirra", 9.99, TRUE, 5),
("Brigadeiro", 2.99, FALSE, 4),
("Combo salgado e café", 12.99, TRUE, 6),
("Bolo de chocolate", 10.99, TRUE, 4),
("Suco natural", 9.99, TRUE, 3),
("Pão de queijo", 7.99, TRUE, 5);

INSERT INTO pedido (data_pedido, status_pedido, valor_total id_cliente) VALUES
(NOW(), "ABERTO",0.00, 1),
("2026-12-03 12:30:00", "FINALIZADO", 19.99, 2),
("2026-11-02 14:35:00", "CANCELADO", 10.99, 3),
(NOW(), "PREPARANDO", "FINALIZADO", 39.99, 4),
("2026-09-06 09:20:00" "FINALIZADO", 19.99, 6),
("2026-10-09 21:32:00" "CANCELADO", 5.99, 5);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 2, 1, 5.99, "Entregar Quente")
(2, 2, 2, 5.99, "Entregar Quente")
(3, 5, 1, 5.99, "Deixar Macio")
(4, 5, 2, 5.99, "Deixar Macio")
(5, 6, 3, 5.99, "Entregar Quente")
