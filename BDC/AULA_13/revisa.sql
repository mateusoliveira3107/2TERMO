CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT NOT NULL,
    nome VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    autor VARCHAR(100) NOT NULL,
    data_lancamento DATE,
    quantidade INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT fk_livro_categoria FOREIGN KEY id_categoria REFERENCES categoria(id_categoria)
);

CREATE TABLE IF NOT EXISTS emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME NOT NULL,
    data_devolucao DATETIME NOT NULL,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,

    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY id_usuario REFERENCES usuario(id_usuario),
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY id_livro REFERENCES livro(id_livro)
);

CREATE TABLE IF NOT EXISTS fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cnpj CHAR(14)
);