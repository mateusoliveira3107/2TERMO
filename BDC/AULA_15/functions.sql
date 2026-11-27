-- Active: 1795086595435@@127.0.0.1@3306@smartcoffee_procedures_bruno
-- Function: Armazena uma rotina criada dentro do MySQL que recebe parâmetros, executa uma lógica e devolve um valor com RETURN

-- Exemplos de utilização:
-- - Calculo de frete (valor do frete)
-- - Escola (classificar médias com aprovado e reprovado)
-- - Financeiro (calcular juros - valor corrigido)
-- - Estoque (situação estoque - opções de checagem)

-- EX 1: Estrutura básica
-- DELIMITER $$
-- CREATE FUNCTION nome_funcao(parametro TIPO)
-- RETURNS TIPO_DE_RETORNO
-- DETERMINISTIC
-- BEGIN
--     -- PROCESSAMENTO
--     RETURN VALOR;
-- END $$
-- DELIMITER ;
-- Obs: RETURNS: Informa qual tipo será devolvido. RETURN informa o resultado devolvido

DELIMITER $$
CREATE FUNCTION calcular_total_item
(p_preco DECIMAL(10, 2), p_quantidade INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN p_preco * p_quantidade;
END $$
DELIMITER ;

-- OBS: Agora a função pode ser usada como se fosse uma função nativa
SELECT nome, preco, calcular_total_item(preco, 3) AS Total_3_Unidades
FROM produto;

-- EX 2: COM DECISÃO - BASE EM FIDELIDADE
DELIMITER $$
CREATE FUNCTION classificar_fidelidade
(p_pontos INT)
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    IF p_pontos >= 500 THEN
        RETURN 'OURO';
    ELSEIF p_pontos >= 200 THEN
        RETURN 'PRATA';
    ELSE
        RETURN 'BRONZE';
    END IF;
END $$
DELIMITER ;

SELECT nome, pontos_fidelidade, classificar_fidelidade(pontos_fidelidade) AS Nível
FROM cliente;

-- EX 3: EXEMPLO COM VARIÁVEL LOCAL
DELIMITER $$
CREATE FUNCTION calcular_desconto
(
    p_valor DECIMAL(10, 2),
    p_pontos INT
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_percentual DECIMAL(5, 2);

    IF p_pontos >= 500 THEN
        SET v_percentual = 0.10;
    ELSEIF p_pontos >= 200 THEN
        SET v_percentual = 0.05;
    ELSE
        SET v_percentual = 0;
    END IF;
    RETURN p_valor * v_percentual;
END $$
DELIMITER ;

-- OBS: DETERMINISTIC?
-- Uma função marcada como DETERMINISTIC declara que, para os mesmos valores de entrada, o resultado será o mesmo.
-- VIEW: SELECT ... FROM view - consulta reutilizável - vw_pedidos_abertos
-- PROCEDURE: CALL ... - processo com várias etapas - registrar_pedido
-- FUNCTION: dentro da expressão / SELECT - cálculo ou classificação - calcular_desconto