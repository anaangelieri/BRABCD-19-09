create database if not exists escolaTeste;
use escolaTeste;
show databases;
drop database escolaTeste;
show databases;

create database if not exists escola;
use escola;
create table if not exists alunoTeste(
Matrícula int not null,
nome varchar(45),
telefone int, 
sexo char(1), 
primary key (Matrícula)
) engine innodb;
show tables;
drop table alunoTeste;
show tables;

create table if not exists aluno(
Matrícula int not null,
nome varchar(45),
telefone int, 
sexo char check (sexo IN ("F","M")),
primary key (Matrícula)
) engine innodb;

insert into aluno values
(25, "Cláudia Peres", 25345678, "F");
select * from aluno;

insert into aluno values
(26, "Edilson Silva", 45768900, "M"), 
(27, "Marcelo Pereira", 45987690, "M");
select * from aluno;

alter table aluno add sobrenome varchar(45);
update aluno set nome = "Claudia", sobrenome = "Peres" where Matrícula = 25;
update aluno set nome = "Edilson", sobrenome = "Silva" where Matrícula = 26;
update aluno set nome = "Marcelo", sobrenome = "Pereira" where Matrícula = 27;

insert into aluno values
(30, "Ana Laura", 44156239, "F", "Angelieri");
select * from aluno;