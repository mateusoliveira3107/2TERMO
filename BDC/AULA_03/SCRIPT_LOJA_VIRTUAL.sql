-- comando para criar banco de dados
-- create database BEBELO_DATA_BASE;
-- create database BEBELO_DATA_BASE2;

-- comando para apagar banco de dados
-- drop database bebelo_data_base2;

-- comando para ativar banco de dados
use bebelo_data_base;

-- comando para criar tabelas
create table clientes (
Id_Cliente int auto_increment primary key,
Nome_Cliente varchar(60) not null,
CPF varchar(14) not null unique,
Email_Cliente varchar (60),
Data_Cadastro timestamp default current_timestamp,
Telefone_Cliente varchar(20),
Endereco_Cliente varchar(200) not null unique
);

create table fornecedores (
Id_Fornecedor int auto_increment primary key,
Nome_Fornecedor varchar(200) not null,
Telefone_Fornecedor varchar(20),
Email_Fornecedor varchar(200) not null unique,
CNPJ varchar(14) not null unique
);

create table produtos (
Id_Produto varchar(14) not null unique,
Descricao_Produto varchar(14) not null unique,
Quantidade_Estoque int,
Valor_Produto varchar(14) not null unique,
Categoria varchar(30)
);

create table pedidos (
Id_Pedido int auto_increment primary key,
Data_Pedido timestamp default current_timestamp,
Valor_Total decimal(15,2),
Status_Pedido varchar(10) default "Finalizado"
);

create table Itens_Pedido (
Id_Produtos_Pedido int auto_increment primary key,
Valor_Total decimal(10, 2),
Quantidade_Itens int,
valor decimal(10,2)
);

create table Pagamentos (
Id_Pagamento int auto_increment primary key,
Data_Pagamento timestamp default current_timestamp,
Forma_Pagamento varchar(20) not null default "Credito",
Data_Pagamento timestamp default current_timestamp
);

-- Comando para apagar tabelas
-- drop table fornecedores
