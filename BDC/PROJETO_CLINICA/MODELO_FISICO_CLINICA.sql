-- Active: 1792358517408@@127.0.0.1@3306
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

CREATE TABLE IF NOT EXISTS empresa (
    id_empresa int auto_increment,
    telefone varchar(11) not null,
    cnpj varchar(18) not null,
    nome_empresa varchar(120) not null,
    razao_social varchar(100) not null,
    ativo boolean default true,

    constraint pk_empresa primary key (id_empresa),
    constraint uk_cnpj_empresa unique (cnpj),
    constraint uk_razao_empresa unique (razao_social)
);

CREATE TABLE IF NOT EXISTS funcionario (
    id_funcionario int auto_increment,
    nome_funcionario varchar(100) not null,
    cpf char(11) not null,
    telefone varchar(11) not null,
    data_admissao date,
    cargo varchar(60) not null,
    id_empresa int not null,

    constraint pk_funcionario primary key (id_funcionario),
    constraint uk_cpf_funcionario unique (cpf),
    constraint fk_empresa_funcionario foreign key (id_empresa) references empresa (id_empresa)
);

CREATE TABLE IF NOT EXISTS medico (
    id_medico int auto_increment,
    cpf char(11) not null,
    crm varchar(10) not null,
    nome_medico varchar(100) not null,
    telefone varchar(11) not null,
    ativo boolean default true,

    constraint pk_medico primary key (id_medico),
    constraint uk_cpf_medico unique (cpf),
    constraint uk_crm_medico unique (crm)
);

CREATE TABLE IF NOT EXISTS exame (
    id_exame int auto_increment,
    nome_exame varchar(100) not null,
    tipo varchar(50) not null,
    valor decimal(10, 2),

    constraint pk_exame primary key (id_exame),
    constraint uk_nome_exame unique (nome_exame)
);

CREATE TABLE IF NOT EXISTS atendimento (
    id_atendimento int auto_increment,
    descricao_atendimento text not null,
    status_atendimento VARCHAR(20) default 'nao_iniciado' CHECK(status_atendimento IN ('concluido', 'andamento', 'nao_iniciado', 'cancelado')),
    data_inicio datetime    ,
    data_termino datetime,
    id_funcionario int not null,
    id_medico int not null,

    constraint pk_atendimento primary key (id_atendimento),
    constraint fk_funcionario_atendimento foreign key (id_funcionario) references funcionario (id_funcionario),
    constraint fk_medico_atendimento foreign key (id_medico) references medico (id_medico)
);

CREATE TABLE IF NOT EXISTS atendimento_exame (
    id_exame int not null,
    id_atendimento int not null,
    status_exame varchar(20) default 'nao_iniciado' check (status_exame in ('concluido', 'andamento', 'nao_iniciado', 'cancelado')),

    constraint pk_atendimento_exame primary key (id_exame, id_atendimento),
    constraint fk_exame_atendimento foreign key(id_exame) REFERENCES exame (id_exame),
    constraint fk_atendimento_exame foreign key(id_atendimento) REFERENCES atendimento (id_atendimento)
);
