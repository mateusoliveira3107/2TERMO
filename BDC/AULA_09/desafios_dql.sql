-- Active: 1788435081430@@127.0.0.1@3306@smartcoffee_dml_mateus
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Mateus Silva de Oliveira
-- Turma: 2DEVIS     Data: 08/10/26
-- Base: smartcoffee_dml_mateus
-- ============================================================
USE smartcoffee_dml_mateus;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome_cliente AS Nome_Cliente, cidade, email
FROM cliente;


-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;


-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco
FROM produto
ORDER BY preco ASC;


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;

----- Segunda Versão -----
-- SELECT PRECEDES FROM produto ORDER BY preco DESC LIMIT 5;


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 15.00;

----- Segunda Versão -----
-- SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 AND 15.00;


-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome_cliente, email, telefone, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Americana';

----- Segunda Versão -----
-- SELECT nome, cidade FROM cliente WHERE cidade IN ('Limeira', 'Americana')


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome
FROM produto
WHERE nome LIKE '%Café%';


-- 9. Liste os clientes que não informaram telefone.
SELECT nome_cliente, email, telefone, cidade
FROM cliente
WHERE telefone IS NULL;

----- Segunda Versão -----
-- SELECT nome_cliente, telefone FROM cliente WHERE telefone IS NULL;
-- 2ª Opção
-- SELECT nome_cliente, COALESCE(telefone, 'Não Informado') FROM cliente AS telefone WHERE telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT data_pedido, status_pedido, valor_total, id_cliente
FROM pedido
WHERE status_pedido = 'FINALIZADO' AND valor_total > 20.00;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS Produtos_Cadastrados
FROM produto;


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS Menor_Preço, MAX(preco) AS Maior_Preço, AVG(preco) AS Maior_Preço
FROM produto;

----- Segunda Versão -----


-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade;


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS Faturamento_Total
FROM pedido
WHERE status_pedido = 'FINALIZADO';