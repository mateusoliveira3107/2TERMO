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
(@novo_pedido, 1, 2, 10.00), (@pedido, 2, 3, 12.00);

-- 16. Registre pagamento válido.

-- 17. Consulte pedido, itens e pagamento.

-- 18. COMMIT.

-- 19. START TRANSACTION e crie pedido para cliente 2.

-- 20. Salve o id em @pedido_com_erro.

-- 21. Tente inserir item com id_produto inexistente.

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.