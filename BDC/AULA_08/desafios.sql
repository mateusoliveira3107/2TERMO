-- Active: 1788435081430@@127.0.0.1@3306@smartcoffee_dml_mateus
------------------------------------------------------
-- DESAFIOS DML
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Mateus Silva de Oliveira
-- Turma: 2DEVIS Data: 01/10/2026
-- Base: smartcoffee_dml
-- ============================================================
-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_MATEUS;
USE SMARTCOFFEE_DML_MATEUS;
-- PARTE A - INSERT
-- 1: CADASTRE DOIS NOVOS CLIENTES
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Ronaldo Pereira", "ronaldo@gmail.com", "19996989901", "Paulínia", TRUE),
("Gustavo Mendes", "gustavo@gamil.com" "19999367902", "Piracicaba", TRUE);

---------------------------------------------------------------
-- 2: CADASTRE UMA NOVA CATEGORIA CHAMADA ESPECIAIS DA CASA
INSERT INTO categoria (nome) VALUES
("Especiais da Casa");

---------------------------------------------------------------
-- 3: CADASTRE TRÊS PRODUTOS NA NOVA CATEGORIA
SET @categoria_especial = SELECT id_categoria FROM categoria
WHERE nome = 'Especiais da Casa';

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
("Sopa de Feijão", 18.99, TRUE, @categoria_especial),
("Salgado", 12.99, TRUE, @categoria_especial),
("Lanche de Hamburguer", 29.99, TRUE, @categoria_especial);

---------------------------------------------------------------
-- 4: INSIRA UM CLIENTE SEM TELEFONE E OBSERVE O USO DE NULL
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Matias Souza", "matias123@gmail.com", NULL, "Campinas", TRUE);

---------------------------------------------------------------
-- 5 CRIE UM NOVO PEDIDO PARA UM DOS CLIENTES CADASTRADOS
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-10-02 13:15:00', 'FINALIZADO', 20.99, 2);

---------------------------------------------------------------
-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido
--    e insira pelo menos dois itens nesse pedido.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
('2026-11-04 12:25:00', 'FINALIZADO', 25.99, 3);
SET @pedido = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 38, 2, 15.00, "Entregar Quente"),
(@pedido, 39, 3, 30.00, "Entregar Quente");

---------------------------------------------------------------
-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação: 
-- UPDATE: 
-- SELECT final: 
UPDATE cliente
SET telefone = "19123998899"
WHERE id_cliente = 2;

---------------------------------------------------------------
-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET telefone = "19919191919",
cidade = "Campinas"
WHERE id_cliente = 5;

---------------------------------------------------------------
-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = produto * 1.08;

---------------------------------------------------------------
-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status_pedido = "PREPARANDO"
WHERE id_pedido = 2;

---------------------------------------------------------------
-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
-- Não Fazer No Momento

---------------------------------------------------------------
-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
UPDATE produto
SET status_produto = FALSE
WHERE id_produto = 4

---------------------------------------------------------------
-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Enaldo Souza", "enaldo@gmail.com", "19858599901", "Limeira", TRUE);
DELETE FROM cliente
WHERE nome_cliente = "Enaldo Souza";

---------------------------------------------------------------
-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:

-- DELETE FROM cliente
-- WHERE id_cliente = 1;

--ERRO: Cannot delete or update a parent row: a foreign key constraint fails(`smartcoffee_dml_mateus`.`pedido`, CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`))

---------------------------------------------------------------
-- 15. Explique em comentário por que a FK bloqueou a exclusão.

-- Resposta: Não foi possível excluir o cliente, pois ele possui uma chave estrangeira relacionando ele com um item da tabela pedido

---------------------------------------------------------------
-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES
("Excluir Depois");

DELETE FROM categoria WHERE
nome = "Excluir Depois";

---------------------------------------------------------------
-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
("Café Espresso", 7.99, TRUE, 9999);
-- Deu erro pois o programa não encontrou uma chave estrangeira id_categoria com valor 9999 na tabela categoria

---------------------------------------------------------------
-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?
INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
("Matheus Alves", "matheus@gmail.com", "19125734801", "Paulínia", TRUE);

-- Deu erro por campo "email" duplicado na tabela clientes

-- DELETE FROM cliente
-- WHERE nome_cliente = "Matheus Alvez";

---------------------------------------------------------------
-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
("2026-09-02 19:20:00", "ABERTO", 20.99, 9999);
-- Deu erro pois o programa não encontrou uma chave estrangeira id_cliente com valor 9999 na tabela cliente

-- 20. Escreva em comentários a diferença entre os três erros anteriores.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.