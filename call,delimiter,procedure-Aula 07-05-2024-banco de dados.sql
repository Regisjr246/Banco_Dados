drop database if exists escola ;

create  database if not exists escola;

use escola;

create table alunos(
id int auto_increment,
nome varchar(50),
idade int,
primary key (id)
);

insert into alunos(nome,idade) values ('Joa','20');
insert into alunos(nome,idade) values ('maria','22');
insert into alunos(nome,idade) values ('carlos','19');


-- VIEW
-- View é uma representação virtualde uma tabela baseada em uma consulta sql.
-- ela permite simplificar consultas complexas e reutilizara lógica de consulta
-- create view <nome> as <pesquisas>






create view alunosMaioresDe20 as
select nome,idade from alunos a where idade>20;
select * from alunosMaioresDe20 a;


create view alunosMaioresDe20ComIdade as
select nome,idade, year(now()) - idade as ano_nascimento  from alunos a where idade>20;



select * from alunosMaioresDe20ComIdade a;



-- FUNCTION
-- São blocos de códigos reutilisaveis que realizam uma tarefa específica.
-- Pode se usá-la para simplicar consultas, cálculos ou manipulção de dados.

DELIMITER //
create function calculeMediaIdade()
returns decimal(5,2)
begin
	declare media decimal(5,2);
	select avg(idade) into media from alunos;
	return media;
end //
DELIMITER ;


select calculeMediaIdade() as mediaIdade;
select id,nome,idade, calculeMediaIdade() as mediaIdade from alunos;

DELIMITER // 
create function calcular_idade(data_nascimento date)
returns int
begin
	
	declare idade int;
declare data_atual date;
	set data_atual = curdate();
set idade = year(data_atual) - year(data_nascimento);
if month(data_atual) < month(data_nascimento) or (
month(data_atual)=month (data_nascimento) and day (data_atual) < day(data_nascimento)
) then 

set idade = idade - 1;
end if;
return idade;
end//
DELIMITER ;

select calcular_idade('2007-04-09');







-- PROCEDURE
-- Procedimentos são conjuntos deintruções sql armazenados no bando de dados.
-- Eles pdoem aceitar parametros e executar uma serie de comandos

delimiter //

create procedure adicionaAluno(x_nome varchar(50), x_idade int)
begin
	insert into alunos(nome,idade) values (x_nome,x_idade);
end//
delimiter ;

call adicionaAluno('Ana', 30);
select  * from alunos a ;





-- Diferença entre Function e Procedure
-- Function -> retorna um valor, Poder ser usado em expressão sql. Exemplo: Select calcularMediaIdade();

-- Procedures --> Não retrona um valor diretamente. Poder ter efeitos colaterais, como modificar dados no 
-- banco de dados, exemplo: Cll adicionarAluno('Ana',30)






