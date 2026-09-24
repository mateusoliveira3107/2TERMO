------------------------------------------------------
-- DESAFIOS DML
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_MATEUS;
USE SMARTCOFFEE_DML_MATEUS;

-- PARTE A
-- 1: CADASTRE DOIS NOVOS CLIENTES
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Ronaldo Pereira", "ronaldo@gmail.com", "19996989901", "Paulínia", TRUE),
("Gustavo Mendes", "gustavo@gamil.com" "19999367902", "Piracicaba", TRUE);

-- 2: CADASTRE UMA NOVA CATEGORIA CHAMADA ESPECIAIS DA CASA
INSERT INTO categoria (nome) VALUES
("Especiais da Casa");

-- 3: CADASTRE TRÊS PRODUTOS NA NOVA CATEGORIA
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
("Sopa de Feijão", 18.99, TRUE, 1),
("Salgado", 12.99, TRUE, 1),
("Lanche de Hamburguer", 29.99, TRUE, 1);

-- 4: INSIRA UM CLIENTE SEM TELEFONE E OBSERVE O USO DE NULL
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Matias Souza", "matias123@gmail.com", NULL, "Campinas", TRUE);

-- 5 CRIE UM NOVO PEDIDO PARA UM DOS CLIENTES CADASTRADOS
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
'2026-10-02 13:15:00', 'FINALIZADO', 20.99;

-- 6: USE LAST_INSERT_ID() PARA INSERIR PELO MENOS DOIS ITENS NO PEDIDO
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;