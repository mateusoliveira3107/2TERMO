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

INSERT INTO usuario (id_usuario,nome, email, telefone, ativo) VALUES
('Mateus Silva', 'mateus123@email.com', 19993235671, TRUE),
('Ronaldo Pereira', 'rperere@email.com', 19928375722, TRUE),
('Leticia Ferreira', 'leferreira@email.com', NULL, TRUE),
('Pedro Miguel', 'pedro@email.com', 19989898887, TRUE);

SELECT * FROM usuario;

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
-- ALGUNS VALORES FICTÍCIOS
('Branca de Neve', 'Mauricio de Sousa', '293-849192874', 2015, 6, 'Girassol'),
('Diario de um Banana', 'Luciano Hulk', '345-167466798', 2010, 3, 'Editora EUA'),
('Adão e Eva', 'Bruce Feiler', '251-635828996', 2017, 5, 'Zahar'),
('Gibi da Mônica', 'Maurício de Souza', '345-255911846', 2005, 10, 'BR HQ'),
('Gibi Homem Aranha', 'Mauro Rodrigues', '372-324248675', 1998, 8, 'MARVEL HQs'),
('O Alquimista', 'Paulo Coelho', '234-262736246', 2009, 15, 'MARVEL HQs');

SELECT * FROM livro;

-- Cadastre pelo menos 3 empréstimos ABERTOS para usuários e livros existentes.
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, id_livro, id_usuario, status_emprestimo) VALUES
('2026-04-11 12:20:00', '2026-10-11', '2026-11-11', 12, 1, 'ABERTO'),
('2026-06-09 13:50:00', '2026-09-11', '2026-14-11', 13, 2, 'ABERTO'), -- utilizei valores 12, 13 e 14 pois eu havia inserido varios livros
('2026-07-21 17:40:00', '2026-07-11', '2026-07-11', 14, 3, 'ABERTO');

-- Localize um usuário com SELECT e depois altere seu telefone com UPDATE.

SELECT * FROM usuario
WHERE id_usuario = 2;

UPDATE usuario
SET telefone = 19999889823
WHERE id_usuario = 2;

-- Acrescente 2 exemplares a todos os livros publicados a partir de 2020. - Farei com 2010 por nenhum dos meus livros foi publicado depois de 2020
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
SELECT * FROM livro
WHERE titulo = '%de%';