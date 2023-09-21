/* criar banco de dados */
drop database if exists Aula19_09;
create database if not exists Aula19_09;
/* colocar em uso */
use Aula19_09;
/* mostrar os bancos existentes na minha máquina*/
show databases;
/*criar uma tabela*/
create table if not exists fornecedor (
idFornecedor int not null,
nome varchar(45) not null,
endereco varchar(45),
telefone int,
cidade varchar(25),
email varchar(25),
primary key (idFornecedor)
)engine innodb;
/*mostras as tabelas */
show tables;

/*mostrar a estrutura da tabela*/
desc fornecedor;

create table if not exists produto(
idProduto int not null,
descricao varchar(45),
preco decimal(7,2),
unidade varchar(10),
idFornecedor int not null,
primary key (idProduto),
foreign key (idFornecedor) references fornecedor(idFornecedor)
)engine innodb;

show tables;
desc fornecedor;

# inserir dados e valores na tabela fornecedor
insert into fornecedor values (1, "Papel Reciclado", "Rua Brasil, 1000", 44441212, "Bragança", "reci@gmail.com");
select * from fornecedor; 
insert into fornecedor values 
(2, "Casas Bahia", "Rua do Mercado, 1000", 40338787, "Bragança", "casasbahia@gmail.com"), 
(3, "Lojas Cem", "Rua do Comercio, 9000", 40334455, "Atibaia", "lojascem@gmail.com"),
(4, "Magazine Luiza", "Rua Pires Pimentel, 500", 4033333, "Bragança", "luiza@gmail.com");

# provocar alguns erros no insert
insert into fornecedor values (1, "Papel R eciclado", "Rua Brasil, 1000", 44441212, "Bragança", "reci@gmail.com"); # erro de duplicidade
insert into fornecedor values (1, "Papel Reciclado", "Rua Brasil, 1000", 44441212, "Bragança", "reci@gmail.comxxxxxxxxxxxxxxxxxxxxxxx"); # ultrapassar o limite de algum atributo
insert into fornecedor values (1, "Papel Reciclado", "Rua Brasil, 1000", 44441212, "Bragança"); # não colocar algum atributo
insert into fornecedor values (1, "Papel Reciclado", "Rua Brasil, 1000", "AAAAAA", "Bragança", "reci@gmail.com"); # erro de sintaxe -> espera um tipo e foi informado outro

# inserir dados e valores na tabela produtos
desc produto;
insert into produto values (100, "fogão", 800.5, 'PC', 2), (110, "geladeira", 2000.7, 'PC', 2), (150, "fogão cooktop", 1300.4, 'PC', 3), (160, "ar condicionado", 1800, 'PC', 4);
select * from produto;

# atualizar algum dado na tabela
update produto set preco=2001, unidade="CX" where idProduto=160;

# excluir algum registro (tupla)
delete from produto where idProduto=100;

# visualizar uma coluna específica
select descricao, preco from produto;

# visualiza por ordenação
select * from fornecedor order by nome;

select * from fornecedor order by nome asc; # ordem ascendente
select * from fornecedor order by nome desc; # ordem descendente

select * from fornecedor order by 2 desc; 
select nome, cidade from fornecedor order by 2,1; # ordena o primeiro por cidade e o segundo por nome

/* Prova:
   update -> altera dado, alter table -> alterar table
   delete -> deleta registro, drop table -> deleta a tabela */ 
   
select * from produto where preco>=200 and idFornecedor=2; # visualiza por características
select * from fornecedor where nome like "C%"; # visualiza somente os registros que tenham a letra C
select * from fornecedor where nome not like "C%"; # visualiza somente os registros que NÃO tenham a letra C
select distinct descricao from produto; # seleciona distintamente caso tenha mais de 1