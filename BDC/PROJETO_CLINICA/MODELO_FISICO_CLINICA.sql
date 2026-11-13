-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE empresa (
    id_empresa int auto_increment,
    telefone char(11) not null,
    cnpj char(14) not null unique,
    nome_empresa varchar(120) not null,
    razao_social varchar(100) not null unique,
    ativo boolean default true,

    constraint pk_empresa primary key (id_empresa),
    constraint uk_razao_empresa unique (razao_social)
);

CREATE TABLE funcionario (
    id_funcionario int auto_increment,
    nome_funcionario varchar(100) not null,
    cpf char(11) not null unique,
    telefone char(11) not null,
    data_admissao date,
    cargo varchar(60) not null,
    id_empresa int auto_inc

    constraint pk_funcionario primary key (id_funcionario),
    constraint uk_cpf_funcionario
);

CREATE TABLE atendimento (
    descricao_atendimento text not null,
    data_inicio datetime not null,
    id_atendimento int auto_increment PRIMARY KEY,
    concluido boolean,
    andamento boolean,
    nao_iniciado boolean,
    cancelado boolean,
    data_termino datetime not null
);

CREATE TABLE exame (
    id_exame int auto_increment PRIMARY KEY,
    nome_exame varchar(100) not null unique,
    tipo varchar(50) not null unique,
    concluido boolean,
    andamento boolean,
    nao_iniciado boolean,
    cancelado boolean,
    valor decimal(10, 2),
    data_inicio datetime not null,
    data_termino datetime not null
)

CREATE TABLE medico (
    cpf char(11) not null unique,
    crm varchar(6) not null,
    id_medico int auto_increment PRIMARY KEY,
    nome_medico varchar(100) not null,
    telefone char(11) not null,
    ativo boolean default true,
    id_atendimento int auto_increment,
    FOREIGN KEY(id_atendimento) REFERENCES atendimento (id_atendimento)
)

CREATE TABLE ATENDIMENTO_EXAME (
    id_exame int auto_increment,
    id_atendimento int auto_increment,
    FOREIGN KEY(id_exame) REFERENCES exame (id_exame),
    FOREIGN KEY(id_atendimento) REFERENCES atendimento (id_atendimento)
)

ALTER TABLE funcionario ADD FOREIGN KEY(id_atendimento) REFERENCES atendimento (id_atendimento)
