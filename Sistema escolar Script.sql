drop database if exists sistemaEscolar;
create database sistemaEscolar;
use sistemaEscolar;

create table alunos (
	id int not null auto_increment,
	numero_identificacao int(255) not null,
	nome varchar(255) not null,
	endereco varchar(255) not null ,
	dt_nascimento date not null,
	primary key(id)
);

create table professores (
	id int not null auto_increment,
	nome varchar(255) not null,
	especialidade varchar(255) not null,
	grau_academico varchar(255) not null,	
	primary key(id)
);

create table disciplinas(
id int not null auto_increment,
nomeDisciplina varchar(255) not null,
professores_id int ,
primary key( id),
constraint fk_disciplinas_professores
foreign key (professores_id)
references professores (id)
);

create table notas(
id int not null auto_increment,
notas_alunos decimal(15,2), 
disciplinas_id int not null,
alunos_id int not null,
primary key(id),
constraint fk_notas_disciplinas
foreign key (disciplinas_id)
references disciplinas(id),
constraint fk_notas_alunos
foreign key (alunos_id)
references alunos(id)
);


create table alunoDisciplinas(
disciplinas_id int not null,
alunos_id int not null,
primary key(alunos_id,disciplinas_id),
constraint fk_alunoDisciplinas_disciplinas
foreign key (disciplinas_id)
references disciplinas(id),
constraint fk_alunoDisciplinas_alunos
foreign key (alunos_id)
references alunos(id)
);

/*-- Inserção de dados na tabela de alunos*/
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno1', '1', 'Brasil-rua:sp-331', '2024-03-27');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno2', '2', 'Brasil-rua:sp-3334', '2024-03-26');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno3', '3', 'Brasil-rua:sp-3335', '2024-03-25');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno4', '4', 'Brasil-rua:sp-3336', '2024-03-23');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno5', '5', 'Brasil-rua:sp-3337', '2024-03-22');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno6', '6', 'Brasil-rua:sp-3338', '2024-03-21');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno7', '7', 'Brasil-rua:sp-33311', '2024-03-20');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno8', '8', 'Brasil-rua:sp-33310', '2024-03-19');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno9', '9', 'Brasil-rua:sp-33312', '2024-03-18');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno10', '10', 'Brasil-rua:sp-3313', '2024-03-17');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno11', '11', 'Brasil-rua:sp-3313', '2024-03-16');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno12', '12', 'Brasil-rua:sp-3133', '2024-03-15');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno13', '13', 'Brasil-rua:sp-32233', '2024-03-14');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno14', '14', 'Brasil-rua:sp-33113', '2024-03-13');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno15', '15', 'Brasil-rua:sp-3353', '2024-03-12');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno16', '16', 'Brasil-rua:sp-33553', '2024-03-11');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno17', '17', 'Brasil-rua:sp-33553', '2024-03-10');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno18', '18', 'Brasil-rua:sp-33553', '2024-03-24');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno19', '19', 'Brasil-rua:sp-33553', '2024-03-14');
INSERT INTO alunos  (nome,numero_identificacao,endereco,dt_nascimento) VALUES ('Aluno20', '20', 'Brasil-rua:sp-33553', '2024-03-20');
select id, nome, numero_identificacao ,endereco,dt_nascimento  from alunos a ;

/*-- Inserção de dados na tabela de professores*/
INSERT INTO professores  (nome,especialidade,grau_academico) VALUES ('Professor1', 'HISTÓRIA', 'encino superior completo');
INSERT INTO professores  (nome,especialidade,grau_academico) VALUES ('Professor2', 'PORTUGUES', 'Mestrado');
INSERT INTO professores  (nome,especialidade,grau_academico) VALUES ('Professor3', 'Matemática', 'Doutorado');
INSERT INTO professores  (nome,especialidade,grau_academico) VALUES ('Professor4', 'Ingles', 'Doutorado');
INSERT INTO professores  (nome,especialidade,grau_academico) VALUES ('Professor5', 'Informática', 'PHD');
select id, nome, especialidade ,grau_academico  from professores p;

-- Inserção de dados na tabela de disciplinas*/
INSERT INTO disciplinas  (nomeDisciplina,professores_id) VALUES ('HISTÓRIA', '1' );
INSERT INTO disciplinas  (nomeDisciplina,professores_id) VALUES ('PORTUGUES', '2');
INSERT INTO disciplinas  (nomeDisciplina,professores_id) VALUES ('Matemática', '3');
INSERT INTO disciplinas  (nomeDisciplina,professores_id) VALUES ('Ingles', '4' );
INSERT INTO disciplinas  (nomeDisciplina,professores_id) VALUES ('Informatica', '5' );
INSERT INTO disciplinas  (nomeDisciplina) VALUES ('geografia');
select id,nomeDisciplina,professores_id, nomeDisciplina  from disciplinas ;

/*-- Inserção de dados na tabela de notas*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('4', '1','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('3', '2','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '3','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('0', '3','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('1', '3','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('9', '4','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '4','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('3', '5','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('4', '5','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '5','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '1','20' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '5','20' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '4','20' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '3','20' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('6', '2','20' );
select notas_alunos ,disciplinas_id ,alunos_id from     notas n  ;

delete from notas  where id = 1;

/*-- Inserção de dados na tabela alunosDisciplinas*/
insert into alunoDisciplinas (disciplinas_id, alunos_id)
select d.id as disciplinas_id, a.id as alunos_id  from disciplinas d cross join  alunos a;
select disciplinas_id, alunos_id from alunoDisciplinas a;




/*1-Selecionar alunos matriculados em uma disciplina específica.*/
select ad.disciplinas_id, d.nomeDisciplina , ad.alunos_id from alunoDisciplinas ad inner join disciplinas d on d.id = ad.disciplinas_id 
where d.nomeDisciplina  = 'História';


/*2-Selecionar professor de uma disciplina específica*/
select d.id ,d.nomeDisciplina ,d.professores_id, p.nome from disciplinas d inner join professores p on d.professores_id =p.id 
where d.nomeDisciplina ='Matemática';  



/* 3-Selecionar todos os alunos e mostrar em quais disciplinas os alunos está
cadastrado.*/
select disciplinas_id, alunos_id from alunoDisciplinas a ;



/*4-Selecionar notas dos alunos em uma disciplina específica, exibir a nota, nome do 
aluno e a disciplina.*/
select  n.notas_alunos ,n.disciplinas_id, d.nomeDisciplina  ,n.alunos_id, a.nome 
from notas n   
inner join disciplinas d on d.id = n.disciplinas_id 
inner join alunos a on n.alunos_id = a.id where d.nomeDisciplina = 'Matemática';


/*5-Selecionar alunos que têm notas superiores ou igual a um determinado valor, exibir 
os campos nome do aluno, disciplina e a nota (por exemplo quando a nota for 
superior ou igual a 7).*/
select  n.notas_alunos , d.nomeDisciplina  , a.nome 
from notas n   
inner join disciplinas d on d.id = n.disciplinas_id 
inner join alunos a on n.alunos_id = a.id where n.notas_alunos >= 7 ;


/*6-Selecionar alunos que têm notas superiores ou igual a um determinado valor em uma 
disciplina específica (por exemplo, com código de disciplina 'MAT101' e nota superior 
a 7).*/
select  n.notas_alunos , d.nomeDisciplina  , a.nome 
from notas n   
inner join disciplinas d on d.id = n.disciplinas_id 
inner join alunos a on n.alunos_id = a.id where n.notas_alunos >= 7 and d.nomeDisciplina ='Matemática';

/*7-Selecionar alunos que têm notas superiores a um determinado valor em uma 
disciplina específica (por exemplo, com código de disciplina 'MAT101' e nota superior 
a 7)*/
select  n.notas_alunos , d.nomeDisciplina  , a.nome 
from notas n   
inner join disciplinas d on d.id = n.disciplinas_id 
inner join alunos a on n.alunos_id = a.id where n.notas_alunos > 1 and d.nomeDisciplina ='Matemática';

/*8-Selecionar alunos que têm notas inferior a um determinado valor, exibir os campos 
nome do aluno, disciplina e a nota (por exemplo quando a nota for inferior a 7)*/
select  a.nome , d.nomeDisciplina  ,n.notas_alunos  
from notas n   
inner join disciplinas d on d.id = n.disciplinas_id 
inner join alunos a on n.alunos_id = a.id where n.notas_alunos < 1;


/*9-Selecionar alunos com base em sua data de nascimento (por exemplo, alunos 
nascidos após 2000).*/
select  nome ,dt_nascimento  
from alunos a   
 where  a.dt_nascimento > '2000';

/*10-Selecionar disciplinas que não têm notas registradas (Para garantir que todos os 
alunos tenham suas notas registradas, é necessário identificar as disciplinas em que 
as notas ainda não foram registradas. Escreva uma consulta SQL que retorne o nome 
das disciplinas sem notas registradas)*/
select d.id , d.nomeDisciplina, n.notas_alunos 
from disciplinas d left join notas n on d.id = n.disciplinas_id
where n.notas_alunos is null;


/*11-Selecionar alunos com base na especialidade do professor que ministra a disciplina 
em que estão matriculados (O departamento de orientação acadêmica deseja 
identificar os alunos matriculados em disciplinas ministradas por professores 
especializados em uma determinada área, como "Geografia". Escreva uma consulta 
SQL que retorne o nome dos alunos matriculados nessas disciplinas).*/











