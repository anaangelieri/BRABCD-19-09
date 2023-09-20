create database if not exists SBC;
use SBC;
create table if not exists INSTITUICAO(
idINSTITUICAO int not null,
nome varchar (45),
primary key (idINSTITUICAO)
)engine innodb;
desc INSTITUICAO;
create table if not exists PESQUISADOR(
CPF int not null,
nome varchar (45),
idINSTITUICAO int not null,
primary key (CPF),
foreign key (idINSTITUICAO) references INSTITUICAO (idINSTITUICAO)
)engine innodb;
desc PESQUISADOR;
create table if not exists VEICULO(
idVEICULO int not null,
titulo varchar (30),
local varchar (45),
primary key (idVEICULO)
)engine innodb;
desc VEICULO;
create table if not exists ARTIGO(
idARTIGO int not null,
titulo varchar (30),
pagina_inicial int,
pagina_final int,
idVEICULO int not null,
primary key (idARTIGO),
foreign key (idVEICULO) references VEICULO (idVEICULO)
)engine innodb;
desc ARTIGO;
show tables;
create table if not exists PESQUISADOR_ARTIGO(
CPF int not null,
idARTIGO int not null,
foreign key (CPF) references PESQUISADOR (CPF),
foreign key (idARTIGO) references ARTIGO (idARTIGO)
) engine innodb;
desc PESQUISADOR_ARTIGO;

insert into INSTITUICAO values
(1, "Objetivo"), 
(2, "IFSP"),
(3, "COC"),
(4, "Unifaat"),
(5, "USP");
select * from INSTITUICAO;

insert into PESQUISADOR values 
(12145678, "Ana Laura", 1),
(12956231, "Évelin", 2),
(12345678, "Maria Eduarda", 3),
(12445678, "Giovanna", 4),
(12545671, "Soraya", 5);
select * from PESQUISADOR;

insert into VEICULO values
(11, "Dom Casmurro", "Atibaia"),
(12, "Tiana", "Bragança"),
(13, "Bela", "Campinas"),
(14, "Branca de Neve", "São Paulo"),
(15, "Camelot", "Mairiporã");
select * from VEICULO;

insert into ARTIGO values
(21, "METAMORFOSE", 20, 30, 11),
(22, "A PRINCESA E O SAPO", 31, 40, 12),
(23, "BELA E A FERA", 41, 50, 13),
(24, "BRANCA DE NEVE E OS SETE ANOES", 51, 60, 14),
(25, "BIBLIOTECA NÓRTICA", 61, 70, 15);
select * from VEICULO;

delete from PESQUISADOR where CPF = 12145678;

update PESQUISADOR set nome = "Évelin Ferreira" where CPF = 12956231;

select * from PESQUISADOR order by nome;
select * from ARTIGO order by idArtigo desc;
select * from VEICULO where titulo like "D%";