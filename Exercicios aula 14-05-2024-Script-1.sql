-- apagar database caso exista
DROP DATABASE IF EXISTS pizzaria;

-- criar databaes senão existir
CREATE DATABASE IF NOT EXISTS pizzaria;

USE pizzaria;

-- Tabela CLIENTE
 CREATE TABLE IF NOT EXISTS Cliente (
 cliente_id INTEGER AUTO_INCREMENT,
 telefone VARCHAR(14),
 nome VARCHAR(30),
 logradouro VARCHAR(30),
 numero DECIMAL(5,0),
 complemento VARCHAR(30),
 bairro VARCHAR(30),
 referencia VARCHAR(30),
 PRIMARY KEY (cliente_id)
 );
 
 -- Tabela PIZZA
 CREATE TABLE IF NOT EXISTS pizza (
    pizza_id INTEGER AUTO_INCREMENT,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(4 , 2 ),
    PRIMARY KEY (pizza_id) 
 );
 
 -- Tabela PEDIDO
 CREATE TABLE IF NOT EXISTS pedido (
    pedido_id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15, 2 ),
        PRIMARY KEY (pedido_id),
    FOREIGN KEY (cliente_id)
        REFERENCES Cliente (cliente_id)
 );
 
 -- Tabela ITEM_PEDIDO
 CREATE TABLE IF NOT EXISTS item_pedido ( 
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade DECIMAL(2 , 0 ),
    valor DECIMAL(5 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizza (pizza_id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedido (pedido_id)
 );
 
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- inserir pizza
INSERT INTO pizza (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizza (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizza (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizza (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizza (nome) VALUES ('Escarola');

-- inserir pedido;
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- inserir item_pedido ;
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
 * create trigger <nome> <quando> <acao> on <tabela> for each row 
 * begin
 * <comando 1>
 * <comando 2>
 * end;
 */

/*
 *<nome>: Nome é o nome do gatilho.
 * <quando>: Quando determina se o gatilho é disparado antes(before) ou depois (after) se concluida.
 * <acao>: Ação é representada pelos comandos: (insert,update e delete-->
 * -->insert:Valor novo.
 * -->delete: Valor antigo.
 * -->update:Tem os dois valores, ou seja, valor antigo e valor novo.
 * )
 */






create table log(
id_log int auto_increment primary key,
data_hora datetime default current_timestamp,
tabela varchaR(50) not null,
atividade varchar(10) not null,
id int not null,
aux varchar(1000)
);



delimiter //
create trigger cliente_inc after insert on cliente for each row
begin
	insert into log (data_hora,tabela,atividade,id,aux)
--		values (current_timestamp(), 'Cliente', 'atividade', new.cliente_id
	values (current_timestamp(), 'Cliente', 'insert', new.cliente_id,
	concat('Nome:', new.nome,', Telefone:', new.telefone,
	', Logradouro:', new.logradouro, ',Bairro:', new.bairro ));
end//
delimiter ;



insert into cliente (nome, telefone, logradouro, numero, bairro)
values ('Judite', '(77) 1234-5678', 'Rua dos Pinheiros', '777', 'Jardins');
select * from log;



delimiter //

create trigger cliente_alt after update on cliente for each row 
begin 
		insert into log (data_hora,tabela,atividade,id,aux)
--		values (current_timestamp(), 'Cliente', 'atividade', old.cliente_id
	values (current_timestamp(), 'Cliente', 'update', old.cliente_id,
	concat('Nome:', old.nome,', Telefone:', old.telefone,
	', Logradouro:', old.logradouro, ',Bairro:', old.bairro ));

	insert into log (data_hora,tabela,atividade,id,aux)
--		values (current_timestamp(), 'Cliente', 'atividade', new.cliente_id
	values (current_timestamp(), 'Cliente', 'update', new.cliente_id,
	concat('Nome:', new.nome,', Telefone:', new.telefone,
	', Logradouro:', new.logradouro, ',Bairro:', new.bairro ));
end//
delimiter ;

update cliente set telefone = '(88) 9874-6542',
bairro = 'Centro Velho'
where cliente_id=7;
select * from log;


delimiter //

create trigger cliente_del after delete on cliente for each row 
begin 
		insert into log (data_hora,tabela,atividade,id,aux)
--		values (current_timestamp(), 'Cliente', 'atividade', old.cliente_id
	values (current_timestamp(), 'Cliente', 'Delete', old.cliente_id,
	concat('Nome:', old.nome,', Telefone:', old.telefone,
	', Logradouro:', old.logradouro, ',Bairro:', old.bairro ));
end//
delimiter ;
delete from cliente where  cliente_id = 7;
select * from log;


-- 1 Exercício: Crie uma view que liste todos os clientes da pizzaria.
create view all_clientes as
select nome from cliente c
group by nome;
select * from all_clientes ac;


-- 2 Exercício: Crie uma função que retorne o total gasto por um cliente específico. Obs.: deve ser informado o id do cliente por parâmetro.
DELIMITER //
create function calcular_total_gasto(id int) returns int
begin
	declare total_gasto int;
select sum(p.valor) into total_gasto from pedido p
where cliente_id = id;
return total_gasto;
end// 
delimiter ;
select calcular_total_gasto(1);


-- 3. Exercício: Crie um trigger que atualize o valor total do pedido sempre que um novo item_pedido for inserido.
delimiter //
create trigger atualizar_valor after insert on item_pedido for each row
begin
	update pedido p
	set p.valor =(select sum(ip.valor * ip.quantidade)
	from item_pedido ip 
	where ip.pedido_id = p.pedido_id)
	where pedido_id = new.pedido_id;
end//
delimiter ;
 insert into pizzaria.pedido 
 (cliente_id,`data`,valor)
values (1,curdate(),0);
 
insert into pizzaria.item_pedido 
(pedido_id, pizza_id, quantidade, valor)
values(9,1,3,15);
select * from item_pedido ip ;
select * from pedido p; 



-- 4. Exercício: Crie um trigger que atualize o valor total do pedido sempre que um item_pedido for atualizado
delimiter //
create trigger pedido_alt after update on item_pedido for each row
begin
	update pedido p
	set p.valor =(select sum(ip.valor * ip.quantidade)
	from item_pedido ip 
	where ip.pedido_id = p.pedido_id)
	where pedido_id = old.pedido_id;


	update pedido p
	set p.valor =(select sum(ip.valor * ip.quantidade)
	from item_pedido ip 
	where ip.pedido_id = p.pedido_id)
	where pedido_id = new.pedido_id;
end//
delimiter ; 


--  5 Exercício: Crie um trigger que atualize o valor total do pedido sempre que um item_pedido for excluído.
delimiter //
create trigger pedidos_del after delete on item_pedido for each row
begin
	update pedido p
	set p.valor =(select sum(ip.valor * ip.quantidade)
	from item_pedido ip 
	where ip.pedido_id = p.pedido_id)
	where pedido_id = pedido_id;
end//
delimiter ;

-- 6  Exercício: Crie uma view que liste todas as pizzas disponíveis na pizzaria ordenadas por valor
create view pizzasDisponiveis as
select p.nome, p.valor from pizza p where valor is not null;
select * from pizzasDisponiveis a;


-- 7. Exercício: Crie uma função que retorne o valor médio gasto por pedido: 	OK
DELIMITER //
create function calculeMediaValorPedido(id int)
returns decimal(15,2)
begin
	declare media decimal(15,2);
	select avg(valor) into media from pedido where pedido_id= id   ;
	return media;
end //
DELIMITER ;

select calculeMediaValorPedido(3) as mediaValorPedido;
select pedido_id, calculeMediaValorPedido(pedido_id)  from pedido;


-- 8 Exercício: Crie uma view que liste os 10 clientes que mais gastaram na pizzaria, ordenados pelo valor total gasto: Ok
create view clientesMaisGastaram as
select cliente_id, sum(valor) as totalValor from pedido p group by cliente_id order by totalValor desc limit 10 ;

select * from clientesMaisGastaram ;


-- 9 Crie uma função que retorne o número total de pizzas vendidas em um determinado período.
DELIMITER //
create function vendidas_periodo()
returns int
begin
declare total int;
select sum(quantidade) into total 
from item_pedido ip ;
return total;
end //
DELIMITER ;


select vendidas_periodo() 
from pedido p
inner join item_pedido ip on ip.pedido_id = p.pedido_id 
where data > '2016-12-15' and  `data` < '2018-01-01'
group by vendidas_periodo();

 
-- 10 Exercício: Crie uma função que retorne o número total de pizzas pedidas  em um pedido específico
DELIMITER //
create function totalPizzasClienteEspecifico(id int)
returns decimal(15,2)
begin
	declare total decimal(15,2);
	select sum(quantidade) into total from item_pedido ip  where pedido_id= id   ;
	return total;
end //
DELIMITER ;
select totalPizzasClienteEspecifico(7) as totalPizzasClienteEspecifico;












































