-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): Mateus Silva de Oliveira
-- Regra: valide sempre antes de COMMIT.

USE smartcoffee_dml_mateus;

-- 01. Consulte produto 2 e seu preço.
SELECT nome, preco FROM produto
WHERE id_produto = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2;

-- 03. Consulte dentro da transação.
SELECT * FROM produto
WHERE id_produto = 2;

-- 04. ROLLBACK.
ROLLBACK;

-- 05. Consulte e comprove retorno.
SELECT * FROM produto
WHERE id_produto = 2;

-- 06. Repita a alteração e finalize com COMMIT.
UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2;
COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.1
WHERE id_produto = 3;

-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.
UPDATE produto
SET preco = preco * 1.5
WHERE id_produto = 4;

-- 10. Consulte os dois.
SELECT * FROM produto
WHERE id_produto = 3 OR id_produto = 4;

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
ROLLBACK TO SAVEPOINT ajuste_produto3;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.
COMMIT;
-- A alteração no valor do produto 3 foi salva e a alteração do produto 4 foi descartada com o ROLLBACK TO SAVEPOINT

-- 13. START TRANSACTION.
START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 30.00, 1);
SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@novo_pedido, 1, 3, 5.00), (@novo_pedido, 2, 2, 5.00);

-- 16. Registre pagamento válido.
INSERT INTO PAGAMENTO (id_pedido, valor, id_forma_pagamento) VALUES
(@novo_pedido, 25.00, 1);

-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedido
WHERE id_pedido = @novo_pedido;
SELECT * FROM item_pedido
WHERE id_pedido = @novo_pedido;
SELECT * FROM pagamento
WHERE id_pedido = @novo_pedido;

-- 18. COMMIT.
COMMIT;

-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'Aberto', 15.00, 2);

-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 999, 2, 20.00);

-- 22. Após observar a FK, ROLLBACK.
ROLLBACK;

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT @pedido_com_erro;

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.
DELETE FROM categoria
WHERE id_categoria = 1;
-- Foi bloqueado porque essa categoria possui relacionamento com outra tabela

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

START TRANSACTION;
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 20.00, 10);
SET @pedido_temporario = LAST_INSERT_ID();
-- Utilizei valores altos como 38, 39 pois eu havia inserido vários produtos antes, então os IDs ficaram altos
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_temporario, 38, 1, 9.00), (@pedido_temporario, 39, 1, 12.00);

DELETE FROM pedido
WHERE id_pedido = @pedido_temporario;

ROLLBACK;

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.

START TRANSACTION;
-- a)
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-04-11 12:20:00', 'ABERTO', 13.00, 11);
SET @pedido_smartcoffee = LAST_INSERT_ID();

-- b)
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_smartcoffee, 38, 1, 9.00), (@pedido_smartcoffee, 39, 1, 12.00), (@pedido_smartcoffee, 60, 1, 10.00);

-- c)
INSERT INTO estoque (id_produto, quantidade) VALUES
(38, 49), (39, 29), (60, 19);

-- d)
SAVEPOINT baixa_estoque;

-- e)
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_smartcoffee, 2, 31.00, '2026-04-11 13:00:00');
UPDATE pedido
SET status_pedido = "FINALIZADO"
WHERE id_pedido = @pedido_smartcoffee;

-- g)
-- Consultando PEDIDO
SELECT * FROM pedido
WHERE id_pedido = @pedido_smartcoffee;

-- Consultando ITEM_PEDIDO
SELECT * FROM item_pedido
WHERE id_pedido = @pedido_smartcoffee;

-- Consultando PAGAMENTO
SELECT * FROM pagamento
WHERE id_pedido = @pedido_smartcoffee;

COMMIT;