
-- Criando Banco de dados
Create database PA01;
show databases;
use pa01;

-- Criar Tabela de Sedes
Create table sedes (
	Id int(10) unsigned not null auto_increment,
    nome varchar(50) not null,
    endereco varchar(80) not null,
    telefone varchar(20) not null,
    NomeGerente varchar(80) not null,
    Multa float(8,2) not null,
    primary key(id)
);

-- Criar tabela de Carros
create table carros(
    IdCarros int(10) unsigned not null auto_increment,
    placa varchar(10) not null,
    modelo varchar(40) not null,
    ano year(4) not null,
    cor varchar(20) not null,
    quilometragem float(8,2) not null,
    descricao varchar(100) not null,
    situacao varchar(30) not null,
    origemCarro int(10) unsigned not null,
    localizacaoCarro int(10) not null,
    ClasseCarro int(10) not null,
    primary key(IdCarros),
    foreign key (origemCarro) references sedes(Id)
);

-- Criar tabela de Classes de carros
create table ClasseCarros(
	id int(10) unsigned not null auto_increment,
    nome varchar(50) not null,
    valorDiaria float(8,2) not null,
    primary key (id)
);

-- Criar Tabela de Clientes
create table Clientes (
	id int(10) unsigned not null auto_increment,
    nome varchar(50) not null, 
    cnh varchar(20) not null, 
    ValidadeCNH date not null, 
    CategoriaCNH varchar(3) not null,
    primary key (id)
);

-- Criar Tabela de Reservas de Carros
Create	table Reserva (
	numeroreserva int(10) not null auto_increment,
    diarias int(10) not null,
    dataLocacao date not null,
    dataRetorno date not null,
    quilometrosRodados float(8,2) not null,
    multa float(8,2),
    situacao varchar(15) not null,
    total float(8,2),
    CarroReseva int(10) not null,
    ClienteReserva int(10) not null,
    sedeLocacao int(10) not null,
    sedeDevolucao int(10) not null,
    primary key (numeroreserva)
);
-- Add foreign key constraint para relação entre carros e sedes
ALTER TABLE carros
ADD CONSTRAINT fk_origemCarro
FOREIGN KEY (origemCarro)
REFERENCES sedes(Id);

-- Add foreign key constraint para relação entre carros e Classe de carros 
ALTER TABLE carros
ADD CONSTRAINT fk_ClasseCarro
FOREIGN KEY (ClasseCarro)
REFERENCES ClasseCarros(id);

-- Add foreign key constraint para relação carros e sedes
ALTER TABLE carros
ADD CONSTRAINT fk_sedesLocAtual
FOREIGN KEY (localizacaoCarro)
REFERENCES sedes(Id);

-- Add foreign key constraints para reservas e devoluções de carros
ALTER TABLE Reserva
ADD CONSTRAINT fk_CarroReserva
FOREIGN KEY (CarroReserva)
REFERENCES carros(IdCarros);

ALTER TABLE Reserva
ADD CONSTRAINT fk_ClienteReserva
FOREIGN KEY (ClienteReserva)
REFERENCES Clientes(id);

ALTER TABLE Reserva
ADD CONSTRAINT fk_sedeLocacao
FOREIGN KEY (sedeLocacao)
REFERENCES sedes(Id);

ALTER TABLE Reserva
ADD CONSTRAINT fk_sedeDevolucao
FOREIGN KEY (sedeDevolucao)
REFERENCES sedes(Id);
