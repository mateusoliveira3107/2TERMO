-- Projeto SmartCoffee Mateus Silva

create database if not exists smartcoffe_mateus;
use smartcoffe_mateus;

create table clientes (
Id_Cliente int auto_increment primary key,
Nome_Cliente varchar(60) not null,
CPF varchar(14) not null unique,
Telefone_Cliente varchar(20) not null,
Email_Cliente varchar(200),
Endereco_Cliente varchar(200) not null
);

create table funcionarios (
Id_Funcionario int auto_increment primary key,
Nome_Funcionario varchar(60) not null,
Telefone_Cliente varchar(20),
Email_Funcionario varchar(200),
Endereco_Funcionario varchar(200) not null
);

create table produtos (
Id_Produto int auto_increment primary key,
Valor_Produto decimal (10,2) not null,
Nome_Produto varchar(200) not null,
Descricao_Produto varchar(250)
);

create table Pedidos (
Id_Pedido int auto_increment primary key,
Data_Pedido timestamp default current_timestamp,
Valor_Total decimal(10, 2),
Status_Pagamento enum ('Pedido_Finalizado', 'Pedido_Pendente', 'Pedido_Cancelado') default 'Pedido_Finalizado'
);

create table Pagamentos (
Forma_Pagamento enum ('Pix', 'Debito', 'Credito'),
Data_Pagamento timestamp default current_timestamp,
Status_Pagamento enum('Pagamento_Finalizado', 'Pagamento_Pendente', 'Pagamento_Cancelado')
);

create table estoque (
ID_Item_Estoque int auto_increment primary key,
Quantidade_Minima int not null,
Ultima_Entrada timestamp default current_timestamp,
Quantidade_Atual int not null
);

create table fornecedores (
ID_Fornecedor int auto_increment primary key,
CNPJ varchar(20) not null,
Telefone_Fornecedor varchar(20) not null,
Email_Fornecedor varchar(200),
Nome_Fornecedor varchar(60) not null
);

create table programa_fidelidade (
ID_Programa_Fidelidade int auto_increment primary key,
Pontos_Acumulados int not null,
Oferta_Pontos int not null,
Ultima_Pontuacao timestamp default current_timestamp,
Data_Cadastro timestamp default current_timestamp
);

create table delivery (
ID_Delivery int auto_increment primary key,
Status_Entrega enum('Entrega_em_Andamento', 'Entrega_Finalizada', 'Entrega_Cancelada') default 'Entrega_Finalizada',
Hora_Saida datetime,
Taxa_Entrega decimal(10,2)
);

create table categoria (
ID_Categoria int auto_increment primary key,
Data_Criacao timestamp default current_timestamp,
Descricao_Categoria varchar(250),
Categoria_Ativo boolean,
Nome_Categoria varchar(60) not null
);

insert into clientes (Nome_Cliente, CPF, Telefone_Cliente, Email_Cliente, Endereco_Cliente) values
('Ronaldo Silva','42085937125', '19929049855', 'ronaldo.silva92999@gmail.com', 'Rua moacyr pereira 64'),
('Pedro Mendes','21543675918', '19929049855', 'Pedro.mm9123@gmail.com', 'Rua Joaquim Pereira 23'),
('Fernando Rodrigues','21712949731', '19929049855', 'Fernandinho.rodrigues1001@gmail.com', 'Rua Trajano clarildes 45');

select * from clientes;