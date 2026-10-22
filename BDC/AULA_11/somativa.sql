-- Active: 1788435081430@@127.0.0.1@3306@biblioteca_mateus_som2
CREATE DATABASE biblioteca_mateus_som2;
USE biblioteca_mateus_som2;

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor varchar(120) NOT NULL,
    isbn char(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0,
    id_categoria INT,

    CONSTRAINT fk_categoria_livro FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    CONSTRAINT quantidade CHECK (quantidade_disponivel >= 0)
);

CREATE TABLE IF NOT EXISTS emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    id_livro INT,
    id_usuario INT,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',

    CONSTRAINT fk_livro_emprestimo FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
    CONSTRAINT fk_usuario_emprestimo FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS pedido_encomenda (
    -- tabela que armazena informações de pedidos de livros feitos por clientes
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_livro_pedido INT NOT NULL,
    id_usuario INT NOT NULL,

    CONSTRAINT fk_usuario_pedido FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_livro_pedido FOREIGN KEY (id_livro_pedido) REFERENCES livro (id_livro)
);

ALTER TABLE livro
ADD COLUMN editora VARCHAR(100);


-- FASE 2 — DML: MANIPULAÇÃO DE DADOS

-- INSERT em categoria
INSERT INTO categoria (nome_categoria) VALUES
('Contos de Fada'),
('Ficcional'),
('Revista / HQ'),
('Fantasia'),
('Romance');

INSERT INTO usuario (id_usuario,nome, email, telefone, ativo) VALUES
('Mateus Silva', 'mateus123@email.com', 19993235671, TRUE),
('Ronaldo Pereira', 'rperere@email.com', 19928375722, TRUE),
('Leticia Ferreira', 'leferreira@email.com', NULL, TRUE),
('Pedro Miguel', 'pedro@email.com', 19989898887, TRUE);

SELECT * FROM usuario;

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora, id_categoria) VALUES
-- ALGUNS VALORES FICTÍCIOS
('Branca de Neve', 'Mauricio de Sousa', '293-849192874', 2015, 6, 'Girassol', 1),
('Diario de um Banana', 'Luciano Hulk', '345-167466798', 2010, 3, 'Editora EUA', 2),
('Pequeno Príncipe', 'Machado de Assis', '251-635828996', 2017, 5, 'Zahar', 4),
('Gibi da Mônica', 'Maurício de Souza', '345-255911846', 2005, 10, 'BR HQ', 3),
('Gibi Homem Aranha', 'Mauro Rodrigues', '372-324248675', 1998, 8, 'MARVEL HQs', 3),
('O Alquimista', 'Paulo Coelho', '234-262736246', 2009, 15, 'MARVEL HQs', 5);

SELECT * FROM livro;

-- Cadastre pelo menos 3 empréstimos ABERTOS para usuários e livros existentes.
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, id_livro, id_usuario, status_emprestimo) VALUES
('2026-04-11 12:20:00', '2026-04-11', '2026-04-11', 12, 1, 'ABERTO'),
('2026-06-09 13:50:00', '2026-06-11', '2026-06-11', 13, 2, 'ABERTO'), -- utilizei valores 12, 13 e 14 pois eu havia inserido varios livros
('2026-07-21 17:40:00', '2026-07-11', '2026-07-11', 14, 3, 'ABERTO');

-- Localize um usuário com SELECT e depois altere seu telefone com UPDATE.
SELECT * FROM usuario
WHERE id_usuario = 2;

UPDATE usuario
SET telefone = 19999889823
WHERE id_usuario = 2;

-- Acrescente 2 exemplares a todos os livros publicados a partir de 2020. - Farei com 2010 por nenhum dos meus exemplos de livros foi publicado depois de 2020
-- Aumentando quantidade em +2 acima de 2010
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao > 2010;

SELECT * FROM livro;

-- Crie e exclua um usuário sem empréstimos. Depois tente excluir um usuário que possua empréstimo e explique o resultado.
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Ricardo Oliveira', 'ricardo100@email.com', 19909277333, TRUE);

DELETE FROM usuario
WHERE nome = 'Ricardo Oliveira';

SELECT * FROM usuario;

DELETE FROM usuario
WHERE id_usuario = 1;
-- ERRO ENCONTRADO FOI: não é possível excluir um usuario que possui uma chave estrangeira que o relaciona com outra tabela, pois há dependência


-- FASE 3 — DQL: CONSULTAS E ANÁLISE

-- Liste título, autor e quantidade disponível de todos os livros.
SELECT titulo, autor, quantidade_disponivel
FROM livro;

-- 2 opção -- Lista tudo dos livros
SELECT * FROM livro;

-- Liste livros com quantidade maior que 2, do maior para o menor estoque.
SELECT titulo, autor, quantidade_disponivel
FROM livro
WHERE quantidade_disponivel > 2;

-- Pesquise livros cujo título contenha uma palavra escolhida por você.
SELECT titulo, autor, quantidade_disponivel
FROM livro
WHERE titulo LIKE '%de%';

-- Liste livros publicados entre 2015 e 2025.
SELECT titulo, autor, quantidade_disponivel
FROM livro
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- Mostre COUNT, SUM, AVG, MIN e MAX sobre a quantidade disponível.
SELECT COUNT(quantidade_disponivel) AS quantidade_livros,
SUM(quantidade_disponivel) AS soma_quantidades,
ROUND(AVG(quantidade_disponivel)) AS media_quantidades,
MIN(quantidade_disponivel) AS menor_valor,
MAX(quantidade_disponivel) AS maior_valor
FROM livro;

-- Liste ID do empréstimo, usuário, livro, data e status.
SELECT EM.id_emprestimo, US.nome AS usuario, LI.titulo AS livro, EM.data_emprestimo AS data, EM.status_emprestimo AS status
FROM emprestimo AS EM
INNER JOIN usuario AS US
ON US.id_usuario = EM.id_usuario
INNER JOIN livro AS LI
ON LI.id_livro = EM.id_livro;

-- Mostre apenas os empréstimos ABERTOS.
SELECT EM.id_emprestimo, US.nome AS usuario, LI.titulo AS livro, EM.data_emprestimo AS data, EM.status_emprestimo AS status
FROM emprestimo AS EM
INNER JOIN usuario AS US
ON US.id_usuario = EM.id_usuario
INNER JOIN livro AS LI
ON LI.id_livro = EM.id_livro
WHERE EM.status_emprestimo = 'ABERTO';

-- Mostre cada usuário e sua quantidade de empréstimos, do maior para o menor.
SELECT US.nome, US.email, US.telefone, COUNT(*) AS quantidade_emprestimos
FROM emprestimo AS EM
INNER JOIN usuario AS US
ON US.id_usuario = EM.id_usuario
GROUP BY EM.id_usuario
ORDER BY quantidade_emprestimos DESC;

-- Liste todos os usuários, inclusive os que nunca fizeram empréstimo, com a quantidade de empréstimos de cada um.
SELECT US.nome, US.email, US.telefone, COUNT(*) AS quantidade_emprestimos
FROM emprestimo AS EM
LEFT JOIN usuario AS US
ON US.id_usuario = EM.id_usuario
GROUP BY EM.id_usuario
ORDER BY quantidade_emprestimos DESC;


-- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE

-- Transação de empréstimo
START TRANSACTION;

INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, id_livro, id_usuario, status_emprestimo) VALUES
('2026-11-01 10:00:00', '2026-11-11', '2026-11-06', 15, 1, 'ABERTO');

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 15;

SELECT * FROM livro
WHERE id_livro = 15;

COMMIT;

-- ROLLBACK
START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 20
WHERE id_livro = 15;

SELECT * FROM livro
WHERE id_livro = 15;

ROLLBACK;

SELECT * FROM livro
WHERE id_livro = 15;

-- SAVEPOINT
START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 12
WHERE id_livro = 16;

SAVEPOINT modificacao1;

UPDATE livro
SET quantidade_disponivel = 15
WHERE id_livro = 16;

SELECT * FROM livro -- VERIFICANDO ALTERAÇÕES
WHERE id_livro = 16;

ROLLBACK TO SAVEPOINT modificacao1;

COMMIT;


-- Desafio Final de integridade
-- constraint, integridade referencial, transação ou regra da aplicação

-- Cadastrar dois usuários com o mesmo e-mail. - regra da aplicação, seria necessário tirar o unique para poder cadastrar dois livros com campo 'email' igual

-- Cadastrar dois livros com o mesmo ISBN. - regra da aplicação, seria necessário tirar o unique para poder cadastrar dois livros com campo 'isbn' igual

-- Permitir quantidade disponível negativa. regra da aplicação, seria necessário tirar o CHECK (quantidade_disponivel >= 0) para aceitar valores maiores que 0

-- Criar empréstimo para usuário inexistente.  integridade referencial, é necessário que haja um dado existente para ser referenciado na chave estrangeira, pois há dependência entre tabelas

-- Excluir livro com histórico de empréstimos. - constraint pois referencia a uma outra tabela

-- Gravar empréstimo e falhar na redução do estoque. - transação, é necessário dar commit nas modificações feitas dentro da transação

-- Emprestar livro cuja quantidade disponível seja zero. - regra da aplicação, não permite emprestar quando a quantidade for menor ou igual a 0
