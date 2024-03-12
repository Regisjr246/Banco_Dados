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





insert into cores_frutas (cores_id,frutas_id)
select c.id as cores_id, f.id as frutas_id
from cores c cross join frutas f;
  

select frutas_id ,cores_id   from cores_frutas cf ;

select c.id as cores_id, f.id as frutas_id  from cores c cross join  frutas f;
select c.id,c.cor, f.id, f.fruta  from cores c cross join  frutas f;
