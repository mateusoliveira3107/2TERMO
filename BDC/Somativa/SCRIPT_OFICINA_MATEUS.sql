-- Banco de dados Oficina Mateus

create database oficina_mateus;
use oficina_mateus;

create table clientes (
Id_Cliente int auto_increment primary key,
Email_Cliente varchar(200),
Nome_Cliente varchar(60) not null,
Telefone_Cliente varchar(20) not null,
Nascimento_Cliente date,
CPF_Cliente varchar(20) not null unique
);

create table marcas (
Id_Marca int auto_increment primary key,
Nome_Marca varchar(20) not null,
Descricao_Marca varchar(250),
Data_Criacao_Marca date,
Tipo_Marca varchar(20),
Origem_Marca varchar(30)
);

create table veiculos (
Id_Veiculo int auto_increment primary key,
Tempo_na_Oficina timestamp default current_timestamp,
Placa_Veiculo varchar(10) not null,
Cor_Veiculo varchar(20),
Tipo_Veiculo enum ('Carro', 'Moto', 'Caminhao') default 'Carro',
Dono_Veiculo varchar(60) not null
);

create table modelos (
Id_Modelo int auto_increment primary key,
Data_Criacao_Modelo timestamp default current_timestamp,
Origem_Modelo varchar(30),
Carros_Modelo varchar(200),
Nome_Modelo varchar(60)
);

create table funcionarios (
Id_Funcionario int auto_increment primary key,
Telefone_Funcionario varchar(20),
Endereco_Funcionario varchar(200) not null,
Email_Funcionario varchar(250),
CPF_Funcionario varchar(20) not null,
Nome_Funcionario varchar(60)
);

create table pagamentos (
Id_Pagamento int auto_increment primary key,
Tipo_Pagamento enum ('Pagamento_Finalizado', 'Pagamento_Pendente', 'Pagamento_Cancelado') default 'Pagamento_Finalizado',
Prazo_Pagamento datetime,
Valor_Pagamento decimal(10,2),
Data_Pagamento datetime,
Forma_Pagamento enum ('Pix', 'Debito', 'Credito') default 'Debito'
);

create table pecas (
Id_Pecas int auto_increment primary key,
Descricao_Peca varchar(250),
Tipo_Peca varchar(50),
Garantia_Peca date,
Criacao_Peca datetime,
Nome_Peca varchar(30)
);

create table fornecedores (
Id_Fornecedor int auto_increment primary key,
Telefone_Fornecedor varchar(20) not null,
Status_Fornecedor enum ('Ativo', 'Inativo') default 'Ativo',
Nome_Fornecedor varchar(60) not null,
CNPJ varchar(20) not null unique,
Email_Fornecedor varchar(200)
);

create table servicos (
Id_Servico int auto_increment primary key,
Garantia_Servico enum ('Ativo', 'Inativo') default 'Ativo',
Tipo_Servico varchar(30),
Status_Servico enum ('Ativo', 'Inativo') default 'Ativo',
Valor_Servico decimal (10,2),
Data_Servico datetime
);

create table ordens_servico (
If_Ordem_Servico int auto_increment primary key,
Servico_da_Ordem varchar(50),
Descricao_Ordem_Servico varchar(250),
Prazo_Ordem_Servico datetime,
Data_Criacao_Ordem timestamp default current_timestamp,
Status_Ordem_Servico enum('Ativo', 'Inativo') default 'Ativo'
);

-- Adicionar um campo novo em cada tabela
alter table clientes add column idade_cliente int;
alter table marcas add column nacionalidade_marca varchar(50);
alter table modelos add column tamanho int;
alter table funcionarios add column nacionalidade_funcionario varchar(30);
alter table pagamentos add column parcelas int;
alter table pecas add column categoria_peca varchar(40);
alter table fornecedores add column localizacao varchar(100);
alter table ordens_servico add column previsao_finalizacao date;

-- Apagar os novos campos adicionados
alter table clientes drop column idade_cliente;
alter table marcas drop column nacionalidade_marca;
alter table modelos drop column tamanho;
alter table funcionarios drop column nacionalidade_funcionario;
alter table pagamentos drop column parcelas;
alter table pecas drop column categoria_peca;
alter table fornecedores drop column localizacao;
alter table ordens_servico drop column previsao_finalizacao;

-- Renomear a tabela modelos para modelos_fab
rename table modelos to modelos_fab;