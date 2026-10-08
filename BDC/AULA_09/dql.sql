-- Active: 1788435081430@@127.0.0.1@3306@smartcoffee_dml_mateus

-- DQL - DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
-- ANTES DE INICIAR
USE SMARTCOFFEE_DML_MATEUS;

INSERT INTO cliente (nome_cliente, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'anaf@email.com', '199984512456', 'Campinas', TRUE);


-- EX 1: SELECT SIMPLES OU CONSULTA SIMPLES
-- ESTRUTURA SELECT COMO EXEMPLO
-- SELECT coluna
-- FROM tabela

-- * -> tudas colunas da tabela
SELECT *
FROM cliente;

-- CONSULTAR TO AS COLUNAS
SELECT nome_cliente, telefone
FROM cliente;
-- CONSULTAR COLUNAS ESPECÍFICAS


-- EX 2: AS COMO APELIDO OU UM NOVO NOME AS COLUNAS
SELECT nome_cliente AS Nome_Do_Cliente
FROM cliente;

SELECT email AS Email_Cliente, telefone AS Zap
FROM cliente;


-- EX 3: DISTINCT - ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

-- SEM O 'DISTINCT' O RESULTADO IRÁ SE REPETIR MAIS VEZES.
-- COM O 'DISTINCT' O RESULTADO IRÁ APARECER UMA VEZ, SEM REPETIÇÕES


-- EX 4: WHERE - FILTRO POR REGISTROS
-- IREMOS DEFINIR CONDIÇÕES, ONDE PODEMOS INSERIR OS OPERADORES DE CONDIÇÃO
-- = IGUAL
-- <> ou != DIFERENTE
-- > MAIOR QUE
-- >= MAIOR OU IGUAL
-- < MENOR QUE
-- <= MENOR OU IGUAL

SELECT nome, preco
FROM produto
WHERE produto > 10.00;
-- CONSULTA PARA VALORES ACIMA DE 10.00 REAIS

SELECT nome, preco, ativo AS Status_Produto
FROM produto
WHERE ativo = TRUE;
-- CONSULTA STATUS DE PRODUTOS ATIVOS

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;
-- CONSULTA DE PEDIDOS COM VALOR TOTAL ACIMA DE DETERMINADO VALOR


-- EX 5: 'USO' DO 'AND', 'OR' E 'NOT'
-- AND TODAS AS CONDIÇÕES VERDADEIRAS
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;
-- CONSULTA COM CONDICAO DE PRECO ENTRE 8.00 e 25.00 REAIS

-- OR PELO MENOS UMA CONDIÇÃO VERDADEIRA
SELECT nome_cliente, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Campinas';

-- NOT NÃO IRÁ BUSCAR OU CONSULTAR O VALOR DESEJADO
SELECT nome_cliente, cidade
FROM cliente
WHERE NOT cidade - 'Limeira';

-- EXTRA - UTILIZANDO AND E OR JUNTOS SEPARAR PO ()
SELECT nome_cliente, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Campinas');


-- EX 6: BETWEEN - ENTRE DOIS VALORES
-- LIMITE INICIAL E FINAL
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;
-- CONSULTA DE VALORES ENTRE 8 E 15 REAIS

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';
-- CONSULTA POR INTEVALO DE DATAS


-- EX 7: 'IN' - VÁRIAS POSSIBILIDADES
SELECT nome_cliente, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Campinas', 'Americana', 'Piracicaba');
-- CONSULTA COM VÁRIAS CONDIÇÕES E DIMINUINDO O USO DE OR

SELECT nome_cliente, cidade
FROM cliente WHERE cidade NOT IN ('Limeira', 'Piracicaba');
-- CONSULTA COM EXCESSÃO DOS VALORES ESPECIFICADOS


-- EX 8: LIKE - PESQUISAR POR TEXTOS
-- CORINGAS 
-- % VÁRIOS CARACTERES
-- _ EXATAMENTE UM CARACTER

SELECT nome
FROM produto
WHERE nome LIKE 'Café%';
-- CONSULTA TODOS OS PRODUTOS QUE COMEÇAM COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';
-- CONSULTA TODOS OS CLIENTES QUE POSSUAM A PALAVRA DESEJADA

SELECT nome_cliente
FROM cliente
WHERE nome_cliente LIKE '%Silva';
-- CONSULTA TODOS OS CLIENTES QUE TERMINAM COM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Si_va'
-- CONSULTA ESPECIFICAMENTE O CARACTER


-- EX 9: NULL - AUSÊNCIA DE VALORES
SELECT nome_cliente, telefone
FROM cliente
WHERE telefone IS NULL;
-- CONSULTA CAMPOS QUE POSSUEM O NULL

SELECT nome_cliente, telefone
FROM cliente
WHERE telefone IS NOT NULL;
-- CONSULTA CAMPOS QUE NÃO SÃO MAIS NULL


-- EX 10: ORDER BY - ORDENANDO RESULTADOS
-- ASC - CRESCENTE
-- DESC - DECRESCENTE

SELECT nome, preco
FROM produto
ORDER BY preco ASC;
-- CONSULTA OS DADOS DE FORMA CRESCENTE

SELECT nome, preco
FROM produto
ORDER BY preco DESC;
-- CONSULTA OS DADOS DE FORMA DECRESCENTE

SELECT cidade, nome_cliente
FROM cliente
ORDER BY cidade ASC, nome_cliente DESC;
-- CONSULTA POR MAIS DE UMA COLUNA

-- EX 11: LIMIT + LIMITAR QUANTIDADE DE LINHAS
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;
-- CONSULTAR APENAS UMA QUANTIDADE ESPECÍFICA DE LINHAS
-- SEPARA OS ITENS DA TABELA EM PÁGINA NA QUANTIDADE INSERIDA NO LIMITE

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 5 OFFSET 5;
-- CONSULTA COM LIMITE DE VALORES E LINHAS

-- EX 12: CÁLCULO DE COLUNAS
SELECT nome, preco, preco * 0.5 AS preco_ajustado
FROM produto;
-- IRÁ MOSTRAR O VALOR QUE PORDUTO TERIA CASO TIVESSE O PRECO AJUSTADO MULTIPLICANDO POR 0.5

SELECT id_item, quantidade, preco_unitario, quantidade, preco_unitario * quantidade AS Sub_Total
FROM item_pedido;

-- EX 13: FUNÇÕES PARA CONSULTAS
-- TEXTOS
SELECT UPPER(nome_cliente) AS Nome_Cliente, LOWER(email) AS Email_Cliente
FROM cliente;
-- CONSULTAR NOME DO CLIENTE COM APENAS LETRAS MAIÚSCULAS
-- CONSULTAR EMAIL DO CLIENTE COM APENAS LETRAS MINÚSCULAS

SELECT CONCAT(nome_cliente, '  ---  ', cidade) AS Cidade_Clientes
FROM cliente;
-- CONCAT - CONCATENAÇÃO DE VALORES

-- NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS 
SELECT id_pedido, DATE(data_pedido) AS Datas, MONTH(data_pedido) as Mês,
YEAR(data_pedido) AS Ano, DAY(data_pedido) AS Dias, TIME(data_pedido) AS Horários
FROM pedido;

-- COALESCE - SUBSTITUIR A INFORMAÇÃO QUE DEIXAMOS EM NULL OU NÃO DEIXAMOS
SELECT nome_cliente, COALESCE(telefone, 'Não possui telefone')
FROM cliente;

-- Atualizando nome que estava como email 'ana@email.com'
UPDATE cliente
SET nome_cliente = 'Ana Sampaio'
WHERE nome_cliente = 'ana@email.com';


-- EX 14: FUNÇÕES DE AGRUPAMENTO
-- COUNT - CONTAR QUANTOS REGISTROS EXISTEM
-- SUM - SOMA DE VALORES
-- AVG - MÉDIA DE VALORES
-- MIN - MENOR VALOR
-- MAX - MAIOR VALOR

SELECT COUNT(*) AS TOTAL_CLIENTE
FROM cliente;
-- CONTAR QUANTOS CLIENTES EXISTEM

SELECT ROUND(AVG(preco), 2) AS Média_Preços
FROM produto;

SELECT MIN(preco) AS MENOR_PREÇO, MAX(preco) AS MAIOR_PREÇO, ROUND(AVG(preco), 2) AS MÉDIA_PREÇO
FROM produto;
-- RESUMO DE PREÇOS

SELECT SUM(valor_total) AS Faturamento_Mensal
FROM pedido
WHERE status_pedido = 'FINALIZADO'
-- TOTAL DE VENDAS OU PEDIDOS REALIZADOS COM CRITÉRIO

-- EX 15: GROUP BY - AGRUPAR DADOS
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade;

SELECT id_categoria, count(*) AS Quantidade_Produtos
FROM categoria
GROUP BY id_categoria;


-- EX 16: HAVING - FILTRO POR GRUPOS
-- WHERE - FILTRA LINHAS ANTES DO GROUP BY
-- HAVING = FILTRA LINHAS DEPOIS DO GROUP BY
SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- CIDADES COM PELO MENOS DOIS CLIENTES

-- EX 17: ORDEM DE CRIAÇÃO DE UMA CONSULTA COMPLETA
-- SELECT colunas
-- FROM tabela
-- WHERE condicao
-- GROUP BY colunas_agrupar
-- HAVING condicao_agrupar
-- ORDER BY colunas
-- LIMIT quantidade;