drop database if exists pizzaria;
 create database pizzaria;
 use pizzaria;

create table cliente(
cliente_id integer auto_increment not null,
telefone varchar(10),
nome varchar(30),
logradouro varchar(30),
numero decimal(5,0),
complemento varchar(30),
bairro varchar(30),
referencia varchar(30),
primary key (cliente_id)
 );
 


create table pizza (


pizza_id integer auto_increment not null,
nome varchar(30),
descricao varchar(30),
valor decimal(4,2),
primary key (pizza_id)
);



create table pedido(
pedido_id int auto_increment not null,
cliente_id int,
data datetime,
valor decimal(4,2),
primary key (pedido_id),
constraint fk_cliente_pedido
foreign key(cliente_id)
references cliente(cliente_id)
);

create table item_pedido(
pedido_id int,
pizza_id int,
quantidade int,
valor decimal(5,2),
primary key (pedido_id,pizza_id),
constraint fk_item_pedido
foreign key (pedido_id)
references pedido (pedido_id),
constraint fk_item_pizza
foreign key (pizza_id)
references pizza(pizza_id)
);





-- show tables;
-- describe cliente ;
-- alter table cliente drop telefone;
-- alter table cliente add telefone varchar(14);
alter  table cliente modify telefone varchar(14);












-- Inserindo registros na tabela de cliente
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- Inserindo registros na tabela pizza
INSERT INTO pizza (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizza (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizza (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizza (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizza (nome) VALUES ('Escarola');
select * from pizza;
alter table pizza modify valor decimal(4,2) default 99.99;
insert into pizza (nome) values ('Moda da Casa');

-- Inserindo dados na tabela de pedido
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- Inserindo dados na tabela item_pedido ;
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 4, 1, 17.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (2, 3, 2, 40.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (3, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (5, 1, 3, 45.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (6, 5, 2, 44.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 1, 2, 30.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (8, 4, 2, 34.00);

/*
	select [distinct] <colunas>
	from <tabelas>
	[where condição]
	[group by <coluna>]
	[having <condição>]
	[order by <coluna>];
	
	------------------------------
	| 	   WHERE condição		 |
	------------------------------
	|Operador | Descrição        |
	------------------------------
	|    >    | Maior que        |
	------------------------------
    |    >=   | Maior ou igual a |
    ------------------------------
    |    <   | Menor que         |
    ------------------------------
    |    <=   | Menor ou igual a |
    ------------------------------
    |    =    | Igual a			 |
    ------------------------------
    |   <=>   | Igual para NULL	 |
    ------------------------------
*/
-- listar todas as Pizzas
select * from pizza ;

-- Selcionar todas as pizzas com valor diferente de R$17,00
select * from pizza where valor !=17;
select * from pizza where valor <> 17;


-- Selecionar pizzas que não tem valor cadastrado(valor nulo==null)
select*from pizza where valor is null;
select*from pizza where valor <=> null;
select*from pizza where  isnull(valor);


-- Selcionar toas as pizzas com valores entre R$15,00 e R$20,00,
select*from pizza where valor>15 and valor<20;

-- Selcioanr todas as pizzas com valores menores que  ou maiores que R$17,00
select *from pizza where valor <	17 or valor > 20;

-- Selecioanr toas as pizzza com valores nao maiores ou maiores que R$17,00

select *from pizza where not(valor<17 or valor>17);


-- Selecionar as pizzas com valores na faixa de R$17,00 a R$20,00
select *from pizza where valor>=17 and valor <=20;
select *from pizza where valor between 17 and 20;

-- Selecionar todas as pizzas com valores fora da faixa de 	R$17,00 a R$20,00
select *from pizza where valor <17 or valor>20;
select * from pizza where not(valor>=17 and valor<=20);
select *from pizza where valor not between 17 and 20;

-- Selecionar todas as pizzas com valores iguais a R$15,00 e R$20,00
select * from pizza p where valor= 15 or valor = 20;
select * from pizza p where  valor in(15,20);

-- Selecionar todas aspizzas com valores diferente de R$15,00 R$20,00

select * from pizza p  where  valor!= 15 and valor!= 20;
select  *from pizza p where valor  not in (15,20);


-- Selecionar todas as pizzas com valores nulos
select * from pizza p where  valor <=>null;
select * from pizza p where valor is null;


-- Selecionar todas as pizzas com valores diferente de nulos
select *from pizza where valor is not null;

-- Selecionar todas as pizzas que comecem com a letra: E
select * from pizza p  where nome like'E%';

-- Selecionar todas as pizzas que temrinam com a letra: A
select * from pizza p where nome like'%a';


-- Selecionar todas as pizzas que contenha no nome a letra:RO 
select *from pizza p where nome like '%ro%';


-- Oedenar as colunas
 select * from pizza p order by valor desc , nome;

/*
|---------------------------------|
|       desc     |      asc       |
|---------------------------------|                
|  decrescente   |      crescente |
|---------------------------------|
*/



-- selecionar as 3 pizza mais caras
select  * from pizza p order by valor desc limit 3;

/*
|-- ------------------------------------------|
|Funções de agregação/                        |
| * AVG(coluna) Média dos valores da coluna;  |
| * count(coluna) Conta numero de linha;      |
| * Max(coluna) Maior valor da coluna;        |
| * Min(coluna) Menor valor da coluna;        |
| * Sun(coluna) Soma dos valores;             |  
|                                             |
|-- ------------------------------------------|
*/
-- Qual a média de preço das pizzas
select avg(valor) as preco_medio from pizza p;
select  avg(valor) as preco_medio from pizza p where nome like '%esa';

-- Quantos sabores pizzas temos cadastrados?
select count(*) as qtd from pizza; -- Considera valores nulos;
select count(nome) as qtd from pizza; -- Não considera valores nulos;

-- Qual a pizza mais cara?
select  max(valor) as maior_valor from pizza p ;

-- Qual a pizza mais barata 
select  min(valor) as menor_valor from pizza p;

-- Somar todos os valores 
select sum(valor) as soma from pizza p ;
select  sum(valor) as total from item_pedido ip where pedido_id = 7; -- Aqui ele pega só os valores de cada produto
select sum(quantidade * valor) from item_pedido ip where pedido_id = 7 -- Aqui ele pega o valor de cada produtos e multiplica pela quantidade de produtos do carrimho


select c.cliente_id, c.nome, count(p.pedido_id) as qtd_pedido 
from pedido p 
inner join cliente c on p.cliente_id = c.cliente_id 
group by c.cliente_id, c.nome ;

