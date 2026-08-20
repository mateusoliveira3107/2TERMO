-- Comando para criar Bando de Dados
-- 1
Create database hotel_stefany;
-- Verificar Banco de Dados e criar
Create database if not exists hotel_stefany;
-- 2
use hotel_stefany;

-- tabelas
create table if not exists cadastro (
IF_CADASTRO int auto_increment primary key,
NOME varchar(60) not null,
CPF varchar(14) not null unique,
TELEFONE varchar(15),
CONVENIO enum ('SIM', 'NÃO') default 'SIM',
DATA_CADASTRO timestamp default current_timestamp
);
-- visualizar tabelas
show tables;

-- alterar tabelas
alter table hotel_stefany add email varchar(100);

-- Em casos de necessidade ou correcao
-- excluir Banco de Dados
drop database hotel_stefany;

-- excluir tabela
drop table cadastro;

-- excluir coluna
alter table hotel_stefany drop column telefone;

-- alterar tipo de dados
alter table cadastro modify telefone int;

-- renomear tabela
rename table cadastro to CADASTROS;

-- apagar dados de uma tabela
truncate cadastros;

-- inserir dados em uma tabela
insert into cadastros (nome, cpf, convenio) values
('Ronaldo', '45809157681', 'SIM'), ('Pedro', '44581967384', 'SIM'),
('Lucas', '15346287961', 'NÃO'), ('Fernando', '64599183726', 'NÃO');

select * from cadastros;








