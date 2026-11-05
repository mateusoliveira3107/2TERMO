-- Active: 1788435081430@@127.0.0.1@3306@smartcoffee_dml_mateus
-- Views ou Visões - transformar determinadas consultas em visões reutilizáveis
USE smartcoffee_dml_mateus;
-- Como posso disponibilizar uma consulta como se ela fosse uma tabela?
-- Resposta: Views

-- Ex 1: View - Como consultar um visão lógica
-- Consulta de produtos com status ativo de modo reutilizável, sendo armazenado em uma "variável", permitindo visualizar futuramente a consulta criada através da VIEW (tabela reutilizável)
CREATE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco
FROM produto
WHERE ativo = TRUE;

-- Visualizar
SELECT * FROM vw_produtos_ativos;

-- OBS: A VIEW guarda a definição da consulta. Em uma view comum os dados continuam pertencendo as tabelas de origem.

-- Tabela - Armazena registros
-- View - Representa o resultado lógica da consulta

-- Por que utilizar?
-- Resposta: porque desejo simplificar a minha consulta
-- Reutilizar lógica, onde a consulta ganha um nome
-- Padronização de relatórios
-- Restrição de exposição da lógica

-- Resumo 1:
-- Uma consulta original ou inicial:
SELECT PR.id_produto, PR.nome AS nome_produto, PR.preco, CA.nome AS categoria
FROM produto AS PR
INNER JOIN categoria AS CA
ON PR.id_categoria = CA.id_categoria
WHERE ativo = TRUE;

-- TRANSFORMAR EM UMA VIEW
CREATE VIEW vw_produtos_ativos2 AS SELECT id_produto, nome, preco
FROM produto
WHERE ativo = TRUE;

-- COMO UTILIZAR:
SELECT * FROM vw_produtos_ativos2;

-- EX 2: UTILIZAR FILTROS NAS VIEWS
SELECT id_produto, nome, preco AS preco_decrescente
FROM produto
WHERE preco >= 10.00
ORDER BY preco DESC;

SELECT * FROM vw_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;

-- Obs: View não elimina a possibilidade de usar WHERE, ORDER BY e outras cláusulas

-- EX 3: VIEW COM JOIN - MOSTRAR PRODUTOS E CATEGORIAS
-- Consulta original
SELECT P.id_produto, P.nome AS produto, CA.nome AS categoria, P.preco
FROM produto AS P
INNER JOIN categoria AS CA
ON CA.id_categoria = P.id_categoria;

-- Criando em VIEW
CREATE VIEW vw_produtos_categoria AS
SELECT P.id_produto, P.nome AS produto, CA.nome AS categoria, P.preco
FROM produto AS P
INNER JOIN categoria AS CA
ON CA.id_categoria = P.id_categoria;

-- Resultando visual por view
SELECT * FROM vw_produtos_categoria
ORDER BY categoria, produto;

-- EX 4: VIEW com várias tabelas - Relatório de pedidos
CREATE VIEW vw_pedidos_clientes AS
SELECT P.id_pedido, P.data_pedido, P.status_pedido, C.id_cliente, C.nome_cliente
FROM pedido AS P
INNER JOIN cliente AS C
ON C.id_cliente = P.id_cliente;

-- Resultado
SELECT * FROM vw_pedidos_clientes
WHERE status_pedido = 'ABERTO';

-- EX 5: VIEW para um relatório completo
CREATE VIEW vw_itens_pedidos AS
SELECT PE.id_pedido, PE.data_pedido, C.nome_cliente, PR.nome AS produto, IP.quantidade, IP.preco_unitario, IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS PE
INNER JOIN cliente AS C
ON C.id_cliente = PE.id_cliente
INNER JOIN item_pedido AS IP
ON IP.id_pedido = PE.id_pedido
INNER JOIN produto AS PR
ON PR.id_produto = IP.id_produto;

SELECT * FROM vw_itens_pedidos
WHERE id_pedido = 1;

-- EX 6: VIEW COM FUNÇÕES DE AGREGAÇÃO
CREATE VIEW vw_vendas_por_produto AS
SELECT PR.id_produto, PR.nome AS produto, IP.quantidade AS Unidades_Vendidas, IP.quantidade * IP.preco_unitario AS Faturamento, PE.status_pedido
FROM produto AS PR
INNER JOIN item_pedido AS IP
ON IP.id_produto = pr.id_produto
INNER JOIN pedido AS PE
ON PE.status_pedido = 'FINALIZADO'
GROUP BY PR.id_produto, PR.nome;

-- Resultado> Consulta gerencial
SELECT * FROM vw_vendas_por_produto
ORDER BY Faturamento DESC;

-- EX 7: VIEW COM LEFT JOIN - QUEREMOS TODOS OS CLIENTES INCLUSIVE QUEM NUNCA REALIZOU PEDIDOS
CREATE VIEW vw_clientes_resumo AS
SELECT C.id_cliente, C.nome_cliente AS cliente, COUNT(P.id_pedido) AS Quantidade_Pedidos
FROM cliente AS C
LEFT JOIN pedido AS P
ON P.id_cliente = C.id_cliente
GROUP BY C.id_cliente, C.nome_cliente;

-- Resultado
SELECT * FROM vw_clientes_resumo
WHERE Quantidade_Pedidos = 0;

-- EX 8: NOMEANDO VIEWS
-- ALIASES TORNAM AS VIEWS MAIS CLARAS
CREATE VIEW vw_precos_produtos AS
SELECT id_produto, nome AS Produto, preco AS Preco_Atual
FROM produto;

SELECT * FROM vw_precos_produtos;

-- EX 9: VISUALIZAR AS VIEWS EXISTENTES
-- VISUALIZAR O RESULTADO DE TODAS AS VIEWS CRIADAS
SHOW FULL TABLES WHERE TABLE_TYPE = "VIEWS";

-- PODEMOS CONSULTAR O CATÁLOGO
-- QUER DIZER TODO O BD MYSQL
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();

-- EX 10: VISUALIZANDO DEFINIÇÕES
SHOW CREATE VIEW vw_produtos_categorias;

-- EX 11: CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW vw_produto_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ativo = TRUE;
-- Obs: Irá substituir ou alterar uma view já criada com suas informações

-- EX 12: VIEW ATUALIZÁVEL
CREATE VIEW vw_clientes_ativos AS
SELECT id_cliente, nome_cliente, email, ativo
FROM cliente
WHERE ATIVO = TRUE;

-- Atualizar a tabela Cliente
UPDATE vw_clientes_ativos
SET nome_cliente = 'Ana Francis'
WHERE id_cliente = 2;

-- EX 13: VIEW NÃO ATUALIZÁVEL
UPDATE vw_vendas_por_produto
SET `Faturamento` = 1000
WHERE id_produto = 1;

-- Obs: O campo é calculado. Simplesmente não é possível receber 1000.

-- EX 14: WITH CHECH OPTION - VIEW QUE MOSTRA APENAS PRODUTOS ATIVOS
CREATE OR REPLACE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, ativo, id_categoria
FROM produto
WHERE ativo = TRUE
WITH CHECK OPTION;

SELECT * FROM vw_produtos_ativos;

-- Obs: O With Check Option ajuda a impedir alterações realizadas pela view que fariam o registro
-- Verificar se tudo o que eu pedi para ele está OK se estiver ele confirma

-- EX 15: PADRÃO DEFINIÇÃO DE NOMENCLATURA
-- vw - views
-- nome = complementar a tabela ou consultar que deseja realizar
-- vw_nome_desejo
-- vw_nome_da_finalidade
-- vw_produtos_ativos


-- Apagar VIEWS (DROP VIEW)
DROP VIEW vw_vendas_por_produto;