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
Endereco_Cliente varchar(200) not null
);

create table fornecedores (
Id_Fornecedor int auto_increment primary key,
Nome_Fornecedor varchar(200) not null,
Telefone_Fornecedor varchar(20),
Email_Fornecedor varchar(200) not null unique,
CNPJ varchar(20) not null unique
);

create table produtos (
Id_Produto varchar(14) not null unique,
Nome_Produto varchar(30) not null,
Descricao_Produto varchar(250),
Quantidade_Estoque int,
Valor_Produto varchar(14) not null unique,
Categoria varchar(30)
);

create table pedidos (
Id_Pedido int auto_increment primary key,
Data_Pedido timestamp default current_timestamp,
Valor_Total decimal(15,2),
Status_Pedido enum('Andamento', 'Finalizado') default 'Finalizado'
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
Forma_Pagamento enum('Credito', 'Debito', 'Pix') not null default 'Credito',
Data_Pagamento timestamp default current_timestamp
);

insert into clientes (CPF, Email_Cliente, Telefone_Cliente, Nome_Cliente, Endereco_Cliente) values
('42085937125', 'ronaldo.silva92999@gmail.com', '19929049855', 'Ronaldo Silva', 'Rua moacyr pereira 64'),
('48379928170', 'mauricio__alvez@gmail.com', '19938456363', 'Mauricio_Alvez', 'Rua bananeniras 120'),
('55827930912', 'luiza2222.souza@gmail.com', '19982734651', 'Luiza Souza', 'Rua enzo oliveira 32'),
('55837442910', 'ronaldo.silva999@gmail.com', '19934856725', 'Ronaldo Silva', 'Rua Trajano clarildes 445'),
('74622019935', 'claudia.m.assis6269655@gmail.com', '19942773255', 'Claudia Assis', 'Rua peres pereira 23');

insert into pedidos (Valor_Total, Status_Pedido)
values (110.00, default), (29.99, 'Andamento'), (56.50, default), (19.90, 'Finalizado');

select * from clientes;
select * from pedidos;

truncate table clientes;
truncate table pedidos;




