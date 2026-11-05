-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos.
-- Criei 'vw_produtos_ativos_desafio' pois já havia um 'vw_produtos_ativos' existente
CREATE VIEW vw_produtos_ativos_desafio AS
SELECT nome, preco
FROM produto
WHERE ativo = TRUE;

-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
SELECT * FROM vw_produtos_ativos_desafio
WHERE preco > 10.00;

-- 3. Liste todas as views do banco.
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();

-- 4. Exiba a definição de vw_produtos_ativos.
SHOW CREATE VIEW vw_produtos_ativos_desafio;

-- Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.
-- Criei 'vw_produtos_categorias_desafio' pois já havia um 'vw_produtos_categorias' existente
CREATE VIEW vw_produtos_categorias_desafio AS
SELECT P.id_produto, P.nome AS Nome_Produto, P.preco, CA.nome AS Categoria
FROM produto AS P
INNER JOIN categoria AS CA
ON CA.id_categoria = P.id_categoria;

-- 6. Crie vw_pedidos_clientes .
CREATE VIEW vw_pedidos_clientes_desafio AS
SELECT P.id_pedido, P.data_pedido, P.valor_total, P.status_pedido, CL.id_cliente, CL.nome_cliente AS Cliente
FROM pedido P
INNER JOIN cliente AS CL;

-- 7. Consulte somente pedidos FINALIZADOS pela view.
SELECT * FROM vw_pedidos_clientes_desafio
WHERE status_pedido = 'FINALIZADO';

-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.
CREATE VIEW vw_pedido_produto_geral_desafio AS
SELECT P.id_pedido, PR.nome AS Produto, IP.quantidade, PR.preco AS Preco_Unitario, PR.preco * * IP.quantidade AS Subtotal
FROM pedido AS P
INNER JOIN produto AS PR
ON PR.id_produto = P.id_produto
INNER JOIN item_pedido AS IP
ON IP.id_pedido = P.id_pedido;

-- Parte C — Relatórios Intermediário/
-- Avançado
SELECT P.id_pedido, PR.nome AS Produto, IP.quantidade, PR.preco AS Preco_Unitario, PR.preco * * PR.quantidade AS Subtotal
FROM pedido AS P
INNER JOIN produto AS PR
ON PR.id_produto = P.id_produto
INNER JOIN item_pedido AS IP
ON IP.id_pedido = P.id_pedido;

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.