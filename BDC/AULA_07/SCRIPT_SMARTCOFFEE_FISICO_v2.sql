-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE Pagamentos (
Id_Pagamento int auto_increment PRIMARY KEY,
Pix boolean,
Credito boolean,
Debito boolean,
Pagamento_Finalizado boolean,
Pagamento_Cancelado boolean,
Pagamento_Pendente boolean,
Data_Pagamento timestamp default current_timestamp,
Valor_Pago decimal(10,2)
);

CREATE TABLE Pedidos (
Id_Pedido int auto_increment primary key,
Pedido_Finalizado boolean,
Pedido_em_Andamento boolean,
Pedido_Cancelado boolean,
Valor_Total decimal(10, 2),
Data_Pedido timestamp default current_timestamp,
Tipo_Pedido varchar(30),
Id_Cliente int,
Id_Pagamento int,
FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente),
FOREIGN KEY (Id_Pagamento) REFERENCES Pagamentos (Id_Pagamento)
);

CREATE TABLE Delivery (
Id_Delivery int auto_increment PRIMARY KEY,
Entrega_Cancelada boolean,
Entrega_em_Andamento boolean,
Entrega_Finalizada boolean,
Hora_Saida datetime,
Taxa_Entrega decimal(10, 2),
Endereco varchar(200) not null,
Id_Pedido int,
Id_Funcionario int,
FOREIGN KEY (Id_Pedido) REFERENCES Pedidos (Id_Pedido),
FOREIGN KEY (Id_Funcionario) REFERENCES Funcionarios(Id_Funcionario)
);

CREATE TABLE Categoria (
Id_Categoria int auto_increment PRIMARY KEY,
Categoria_Ativa boolean,
Descricao_Categoria varchar(100),
Nome_Categoria varchar(200) not null,
Data_Criacao timestamp default current_timestamp,
Id_Produto int,
FOREIGN KEY(Id_Produto) REFERENCES Produtos (Id_Produto)
);

CREATE TABLE Fornecedores (
Id_Fornecedor int auto_increment PRIMARY KEY,
CNPJ varchar(20) not null unique,
Email_Fornecedor varchar(200) not null,
Nome_Fornecedor varchar(50) not null,
Telefone_Fornecedor varchar(20) not null,
Id_Produto int,
FOREIGN KEY(Id_Produto) REFERENCES Produtos (Id_Produto)
);

CREATE TABLE Estoque (
Id_Item_Estoque int auto_increment PRIMARY KEY,
Quantidade_Minima int not null,
Ultima_Entrada timestamp default current_timestamp,
Quantidade_Atual int not null,
Nome_Insumo varchar(100) not null,
Unidade_Medida varchar(30),
Id_Produto int,
FOREIGN KEY (Id_Produto) REFERENCES Produtos (Id_Produto)
);

CREATE TABLE Programa_Fidelidade (
Id_Programa_Fidelidade int auto_increment PRIMARY KEY,
Ofertas_Pontos int not null,
Ultima_Pontuacao timestamp default current_timestamp,
Pontos_Acumulados int not null,
Data_Cadastro timestamp default current_timestamp,
Id_Cliente int,
FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente)
);

CREATE TABLE Clientes (
Id_Cliente int auto_increment PRIMARY KEY,
Nome_Cliente varchar(60) not null,
CPF varchar(14) not null unique,
Endereco_Cliente varchar(200) not null,
Telefone_Cliente varchar(20),
Email_Cliente varchar(250),
data_cadastro timestamp default current_timestamp,
Id_Pedido int,
FOREIGN KEY (Id_Pedido) REFERENCES Pedidos (Id_Pedido)
);

CREATE TABLE Produtos (
Id_Produto int auto_increment primary key PRIMARY KEY,
Preco_Unitario decimal(10, 2) not null,
Nome_Produto varchar(200) not null,
Descricao_Produto varchar(250)
);

CREATE TABLE Funcionarios (
Id_Funcionario int auto_increment primary key PRIMARY KEY,
Email_Funcionario varchar(250),
Endereco_Funcionario varchar(200) not null unique,
Telefone_Funcionario varchar(20),
Nome_Funcionario varchar(60) not null,
CPF varchar(14) not null unique,
Cargo varchar(50) not null,
Salario decimal(10,2) not null,
data_admissao date
);

CREATE TABLE Atende (
Id_Funcionario int,
Id_Cliente int,
FOREIGN KEY (Id_Funcionario) REFERENCES Funcionarios (Id_Funcionario),
FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente)
);

CREATE TABLE Contem (
Id_Produto int,
Id_Pagamento int,
Id_Pedido int,
Id_Delivery int,
FOREIGN KEY (Id_Produto) REFERENCES Produtos (Id_Produto),
FOREIGN KEY (Id_Pagamento) REFERENCES Pagamentos (Id_Pagamento),
FOREIGN KEY (Id_Pedido) REFERENCES Pedidos (Id_Pedido),
FOREIGN KEY (Id_Delivery) REFERENCES Delivery (Id_Delivery)
);