drop database if exists tipos_joins;
create database tipos_joins;
use tipos_joins;

create table cores(
id int auto_increment,
cor varchar(50),
 primary key(id)
);

create table frutas (
id int auto_increment primary key, 
fruta varchar(50)
);

create table cores_frutas(
frutas_id int not null,
cores_id int not null,
primary key(frutas_id,cores_id),
constraint  fk_cores_frutas_cores
foreign key (cores_id)
references cores(id),
constraint fk_cores_frutas_frutas
foreign key (frutas_id)
references frutas(id)
);

/*CADASTRAR MAIS DE UM*/
INSERT INTO tipos_joins.cores ( cor)  values
('vermelho'),
('amarelo'),  /* Cadastrando tudo de forma automatica,bastacriar um insert e colcoar o campos em baixo de cada um que ele ira percorrercomo se fosse um loop*/
('verde');

select id,cor from cores c ;

insert into frutas (fruta) values
('Marácuja'),
('Pitaya'),
('Morango'),
('Laranja'),
('Banana'),
('Mican'),
('Pokan');

select fruta from frutas ;

/*
*CROSS JOIN é um tipo especial de junçao em que cada linha de uma tabela é
* combinada com todas as linhas de outra tabela.  Isso resulta em um produto 
* cartesiano entre as duas tabelas ou seja, todas as combinaçoes possiveis
* de linha sao produzidas*
* 
* Por exemplo: Temos duas tabelas, uma chamada cores e ourta chamada frutas,
* e queremos encontrar todas as combinações posíveis de cores e fruta.
** EXEMPLO:*/



select c.id as cores_id, f.id as frutas_id  from cores c cross join  frutas f;
select c.id,c.cor, f.id, f.fruta  from cores c cross join  frutas f;

insert into cores_frutas (cores_id,frutas_id)
select c.id as cores_id, f.id as frutas_id
from cores c cross join frutas f;
  
select frutas_id ,cores_id   from cores_frutas cf ;



create table clientes(
id int,
nome varchar(50),
primary key(id)
);


create table pedidos(
id int,
clientes_id int,
data_pedido date,
primary key(id),
constraint fk_pedidos_clientes 
foreign key(clientes_id)
references clientes(id)
);


insert into  clientes (id,nome) values
('1','Cliente-1'),
('2','Cliente-2'),
('3','Cliente-3'),
('4','Cliente-4'),
('5','Cliente-5'),
('6','Cliente-6 ');



insert into  pedidos  (id,clientes_id,data_pedido) values
('101','1','2024-03-01'),
('102','1','2024-03-05'),
('103','2','2024-03-02'),
('104','2','2024-03-03'),
('105','3','2024-03-07'),
('106','3','2024-03-06 '),
('107','4','2024-03-08'),
('108','2','2024-03-09'),
('109','5','2024-03-10');



insert into pedidos (id,data_pedido) values (110,'2024-03-11');



select id, nome from clientes;
select id,clientes_id, data_pedido from pedidos  ;




/* INNER JOIN: Retorna registros quando há pelo menos uma corrrespodencia em ambas as tabelas.*/

select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
from clientes c
inner join pedidos p on c.id = p.clientes_id;
/*Neste exemplo, estamos  selecionado todas as colunas das tabelas(cliente e pedido)
 * onde há uma corespondencia entre o id na tabela clientes e o cliente_id na tabela pedidos.*/


/*LEFT JOIN: Retorna todas os registros da tabela da esquerda (primeira tabela
 *mencionada) e os registros correspondentes da tabela da direita(segunda tabela mencionada*/


select c.id,  c.nome,  p.id  ,p.data_pedido,  p.clientes_id
from clientes c 
left join pedidos p on c.id = p.clientes_id;
/* Aqui, estamos selecionando todos os registros da tabela clientes e os resgistros
 * correspondentes da tabela pedidos, se houver, com base na correspondecia de 
id e cliente_id
 */

/*RITH JOIN: Retorna todos os registrosda tabela da direira(segundo tabela 
 mencionada) e os registros correspondente da tabela da esquerda (primeira tabela)
 mecionada*/
select c.id,  c.nome,  p.id  ,p.data_pedido,  p.clientes_id
from clientes c 
right join pedidos p on c.id= p.clientes_id;
/*este comando retorna todos os registro da tabela pedidos e os registros
 * correspondentes da tabela clientes, se houver, com base na correspondecia
 * de id e cliente_id*/






































































