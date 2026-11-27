-- ATIVIDADE AMPLIADA - AULAS 14 e 15

-- 1. Function calcular_total_item
DELIMITER $$
CREATE FUNCTION calcular_total_item_ex(p_valor DECIMAL(10, 2), p_quantidade INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN p_valor * p_quantidade;
END $$
DELIMITER ;
SELECT nome, preco, calcular_total_item_ex(preco, 5)
FROM produto;

-- 2. Function classificar_fidelidade
DELIMITER $$
CREATE FUNCTION classificar_fidelidade_ex(p_pontos INT)
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

SELECT nome, pontos_fidelidade, classificar_fidelidade_ex(pontos_fidelidade) AS Nivel
FROM cliente;

-- 3. Function calcular_desconto
DELIMITER $$
CREATE FUNCTION calcular_desconto_ex (p_valor DECIMAL(10, 2), p_pontos INT)
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

SELECT calcular_desconto_ex(100, 500);

-- 4. Function situacao_estoque
DELIMITER $$
CREATE FUNCTION situacao_estoque_ex (p_id_produto INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE qntd_produto INT;
    DECLARE p_mensagem VARCHAR(20);

    SELECT quantidade
    INTO qntd_produto
    FROM estoque
    WHERE id_produto = p_id_produto;

    IF qntd_produto >= 10 THEN
        SET p_mensagem = 'QUANTIDADE ALTA';
    ELSEIF qntd_produto >= 5 THEN
        SET p_mensagem = 'QUANTIDADE NORMAL';
    ELSEIF qntd_produto > 0 THEN
        SET p_mensagem = 'QUANTIDADE BAIXA';
    ELSE
        SET p_mensagem = 'SEM ESTOQUE';
    END IF;
    RETURN p_mensagem;
END $$
DELIMITER ;
SELECT pr.nome AS produto, es.quantidade, situacao_estoque(pr.id_produto)
FROM produto AS pr
INNER JOIN estoque AS es
ON es.id_produto = pr.id_produto;

-- 5. Testar todas em SELECT

SELECT nome, preco, calcular_total_item_ex(preco, 5)
FROM produto; 

SELECT nome, pontos_fidelidade, classificar_fidelidade_ex(pontos_fidelidade) AS Nivel
FROM cliente;

SELECT calcular_desconto_ex(100, 500);

SELECT pr.id_produto ,pr.nome AS produto, es.quantidade, situacao_estoque(pr.id_produto) AS situacao_estoque
FROM produto AS pr
INNER JOIN estoque AS es
ON es.id_produto = pr.id_produto;

-- 6. Criar auditoria_preco
CREATE TABLE AUDITORIA_PRECO_EX (
    ID_AUDITORIA_EX INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    PRECO_ANTERIOR DECIMAL(10, 2),
    PRECO_NOVO DECIMAL(10, 2),
    ALTERADO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_ID_AUDITORIA_EX PRIMARY KEY (ID_AUDITORIA_EX),
    CONSTRAINT FK_PRODUTO_EX FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);

-- 7. Trigger AFTER UPDATE de preço
DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_PRECO_UPDATE_EX
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
    IF OLD.PRECO <> NEW.PRECO THEN
        INSERT INTO AUDITORIA_PRECO_EX (ID_PRODUTO, PRECO_ANTERIOR, PRECO_NOVO) VALUES
        (NEW.ID_PRODUTO, OLD.PRECO, NEW.PRECO);
    END IF;
END $$
DELIMITER ;

-- 8. Trigger BEFORE UPDATE impedindo estoque negativo
DELIMITER $$
CREATE TRIGGER TRG_ESTOQUE_BEFORE_UPDATE_EX
BEFORE UPDATE ON ESTOQUE
FOR EACH ROW
BEGIN
    IF NEW.QUANTIDADE < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ESTOQUE NÃO PODE FICAR NEGATIVO';
    END IF;
END $$
DELIMITER ;

-- 9. Criar log_exclusao_produto
CREATE TABLE LOG_EXCLUSAO_PRODUTO_EX (
    ID_LOG_EX INT AUTO_INCREMENT,
    ID_PRODUTO INT,
    NOME_PRODUTO VARCHAR(120),
    EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_ID_LOG_EX PRIMARY KEY (ID_LOG_EX),
    CONSTRAINT FK_PRODUTO_ID_EX FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

-- 10. Trigger AFTER DELETE
DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE_EX
AFTER DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_EXCLUSAO_PRODUTO_EX(ID_PRODUTO, NOME_PRODUTO) VALUES
    (OLD.ID_PRODUTO, OLD.NOME);
END $$
DELIMITER ;

-- 11. Demonstrar operação bloqueada
INSERT INTO LOG_EXCLUSAO_PRODUTO_EX(ID_PRODUTO, NOME_PRODUTO) VALUES
(99, 'EXERCÍCIO');

SELECT * FROM LOG_EXCLUSAO_PRODUTO_EX;

DELETE FROM LOG_EXCLUSAO_PRODUTO_EX
WHERE ID_LOG_EX = 99;

-- 12. Demonstrar histórico gerado automaticamente
SELECT * FROM LOG_EXCLUSAO_PRODUTO_EX;

-- 13. SHOW TRIGGERS
SHOW TRIGGERS;

-- 14. SHOW CREATE TRIGGER
SHOW CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE_EX;

-- 15. Explique: Function x Procedure x View x Trigger
-- O function é uma operação que pode ser chamada, como exemplo no select para realizar um cálculo ou classificação
-- Uma procedure é um procedimento com várias etapas, como registro ou exclusão com verificações, podendo possuir parâmetros ou não. É chamada por CALL 'nome da procedure'
-- A View é um código que armazena uma consulta, podendo ser consultada como uma tabela, permitindo reutilizar a lógica de consulta durante o programa
-- O trigger é um 'gatilho', que é programado para realizar uma operação automaticamente quando um evento ocorrer

-- 16. Cite 3 regras em que CHECK/UNIQUE/FK seriam melhores que Trigger


-- DESAFIO: crie uma automação própria e justifique a escolha do recurso.
DELIMITER $$
CREATE TRIGGER TRG_ESTOQUE_NEGATIVO
BEFORE UPDATE ON ESTOQUE
FOR EACH ROW
BEGIN
    IF NEW.QUANTIDADE < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ESTOQUE NÃO PODE FICAR NEGATIVO';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE desafio_final_vender_produto(IN p_id_produto INT, IN p_qntd_produto INT)
BEGIN
    DECLARE nome_produto VARCHAR(20);
    DECLARE qntd_produto INT;

    START TRANSACTION;
        SELECT nome
        INTO nome_produto
        FROM PRODUTO
        WHERE id_produto = p_id_produto;

        SELECT quantidade
        INTO qntd_produto
        FROM estoque
        WHERE id_produto = p_id_produto;

        IF p_qntd_produto > qntd_produto THEN
            SELECT 'QUANTIDADE INVÁLIDA' AS MENSAGEM;
        ELSE
            UPDATE estoque
            SET quantidade = quantidade - p_qntd_produto
            WHERE id_produto = p_id_produto;
            SELECT nome_produto AS produto_vendido, qntd_produto AS nova_quantidade;
        END IF;
    COMMIT;
END $$
DELIMITER ;

select * from estoque;
CALL desafio_final_vender_produto(1, 2);

-- Justificação: Procedure facilita os processos longos, e o trigger faz com que haja uma validação antes das alterações