DROP DATABASE IF EXISTS smartcoffee_procedures_bruno;
CREATE DATABASE smartcoffee_procedures_bruno;
USE smartcoffee_procedures_bruno;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    pontos_fidelidade INT NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT NOT NULL DEFAULT 0 CHECK (quantidade >= 0),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(20) NOT NULL DEFAULT 'ABERTO'
        CHECK (status_pedido IN ('ABERTO','PAGO','CANCELADO','FINALIZADO')),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL CHECK (preco_unitario > 0),
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente(nome,email,telefone,pontos_fidelidade) VALUES
('Ana Martins','ana@smartcoffee.com','19999990001',80),
('Carlos Lima','carlos@smartcoffee.com',NULL,20),
('Marina Souza','marina@smartcoffee.com','19999990003',150);

INSERT INTO categoria(nome) VALUES
('Cafés'),('Bebidas'),('Doces');

INSERT INTO produto(id_categoria,nome,preco) VALUES
(1,'Espresso',8.50),
(1,'Cappuccino',13.90),
(2,'Suco de Laranja',11.00),
(3,'Brownie',12.50),
(3,'Cheesecake',16.90);

INSERT INTO estoque(id_produto,quantidade) VALUES
(1,20),(2,4),(3,0),(4,8),(5,3);