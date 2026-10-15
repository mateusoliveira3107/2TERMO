-- Active: 1788435081430@@127.0.0.1@3306@smartcoffee_dml_mateus
-- TCL - TRANSAÇÕES E INTEGRIDADE
-- SEM TRANSAÇÃO: PARTE DO PROCESSO IRÁ PERMANECER GRAVADO
-- COM TRANSAÇÃO: PODEMOS CONFIRMAR OU DESFAZER O PROCESSO INTEIRO

-- ESTRUTURA DE TRANSAÇÃO
BEGIN TRANSACTION;
-- COMANDOS SQL
COMMIT; -- CONFIRMA A TRANSAÇÃO
-- OU
ROLLBACK; -- DESFAZ A TRANSAÇÃO

-- PROCESSO INICIAL
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
('Cristiano Ronaldo', 'cris.ronaldo@gmail.com', '19989897554', 'Funchal', TRUE);

-- EX 1: COMMIT
-- CONFIRMA AS ALTERAÇÕES DENTRO DA TRANSAÇÃO
START TRANSACTION;
UPDATE produto
SET preco = 8.50
WHERE id_produto = 38;
SELECT * FROM produto
WHERE id_produto = 38;
COMMIT;

-- EX 2: ROLLBACK
START TRANSACTION;
UPDATE produto
SET preco = 5000.00
WHERE id_produto = 38;

SELECT * FROM produto
WHERE id_produto = 38;
ROLLBACK;

-- EX 3: SAVEPOINT
-- CRIAR UM PONTO DENTRO DE UMA TRANSAÇÃO
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.05
WHERE id_categoria = 1;

SAVEPOINT reajuste_preco_cafes;

UPDATE produto
SET preco = preco * 2.00
WHERE id_categoria = 1

ROLLBACK TO SAVEPOINT reajuste_preco_cafes;
COMMIT;

-- EX 4: RELEASE SAVEPOINT
-- REMOVE O SAVEPOINT DA TRANSAÇÃO
RELEASE SAVEPOINT reajuste_preco_cafes;

-- EX 5: AUTOCOMMIT
SELECT @@autocommit;
-- ATIVO POR PADRÃO NO MYSQL
START TRANSACTION;
-- DMLS RELACIONADAS
COMMIT;

-- EX 6: TRANSAÇÕES NÃO SUBSTITUI CONSTRAINT

-- CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES
-- categoria(id_categoria) ON DELETE CASCADE ON UPDATE CASCADE;

-- CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES
-- cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE;

-- CREATE TABLE cliente (
--     id_cliente INT PRIMARY KEY,
--     nome_cliente VARCHAR(60),
--     telefone VARCHAR(15),
--     cidade VARCHAR(60),
--     ativo BOOLEAN DEFAULT TRUE,

--     -- É necessário definir o "ON DELETE CASCADE ON UPDATE CASCADE" no momento
--     -- de criação da tabela
--     CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES
--     cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE;
-- )

-- SEMPRE CHECAR A QUANTIDADE E SE ABAIXO DE 0 OU IGUAL A 0 SINALIZAR
CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0);

-- EXEMPLO COM UTILIZAÇÃO
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    -- RESTRIÇÕES
    -- chave primaria
    CONSTRAINT pk_estoque PRIMARY KEY (id_estoque),
    -- chave unica
    CONSTRAINT uq_estoque_produto UNIQUE (id_produto),
    -- checar ou validar uma operação
    CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0), -- não aceita valores negativos
    -- chave estrangeira
    CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto) REFERENCES
    produto (id_produto) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO estoque (id_produto, quantidade) VALUES
(38, 50), (39, 40), (60, 20), (61, 30), (62, 60);

INSERT INTO estoque (id_produto, quantidade) VALUES (38, -1) -- Exemplo testanto valor que não é aceito

SELECT * FROM estoque;

-- EX 7: FLUXO SEGURO PARA UPDATE/DELETE
-- EXCLUSÃO FÍSICA
START TRANSACTION;
DELETE FROM produto
WHERE id_produto = 38;

-- EXCLUSÃO LÓGICA
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 61;

SELECT * FROM produto
WHERE id_produto = 61;

COMMIT;
-- ROLLBACK;

-- EX 8: PEDIDO COMPLETO COM TRANSAÇÃO
START TRANSACTION;
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 26);

SET @pedido = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido, 38, 3, 9), (@pedido, 39, 1, 12);

INSERT INTO PAGAMENTO (id_pedido, valor, id_forma_pagamento) VALUES
(@pedido, 23.00, 2);

SELECT * FROM PEDIDO;
SELECT * FROM item_pedido;
COMMIT;

-- EX 9: PEDIDO COMPLETO COM TRANSAÇÃO E ROLLBACK
START TRANSACTION;
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 26);
SET @pedido = LAST_INSERT_ID();

--PRODUTO INEXISTENTE
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido, 90, 999, 9.00), (@pedido, 90, 999, 11.00);

ROLLBACK;

SELECT * FROM item_pedido;
