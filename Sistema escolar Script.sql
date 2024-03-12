/*drop database sistemaEscolar;*/
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
nome varchar(255) not null,
professores_id int not null,
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

-- Inserção de dados na tabela de disciplinas
INSERT INTO disciplinas  (nome,professores_id) VALUES ('HISTÓRIA', '1' );
INSERT INTO disciplinas  (nome,professores_id) VALUES ('PORTUGUES', '2');
INSERT INTO disciplinas  (nome,professores_id) VALUES ('Matemática', '3')
INSERT INTO disciplinas  (nome,professores_id) VALUES ('Ingles', '4' );
INSERT INTO disciplinas  (nome,professores_id) VALUES ('Informatica', '5' );;
select id,nome,professores_id, nome  from disciplinas ;

/*-- Inserção de dados na tabela de notas*/
*ALUNOS NAS DISCIPLINAS 1*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '1','20' );

*ALUNOS NAS DISCIPLINAS 2*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '2','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '2','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '2','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '2','20' );


*ALUNOS NAS DISCIPLINAS 3*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '3','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '3','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '3','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '3','20' );


*ALUNOS NAS DISCIPLINAS 4*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '4','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '4','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '4','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '4','20' );

/*ALUNOS NAS DISCIPLINAS 5*/
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '5','1' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '5','2' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('7', '5','3' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','4' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','5' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','6' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','7' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','8' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','9' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','10' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','11' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','12' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','13' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','14' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','15' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','16' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','17' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','18' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','19' );
INSERT INTO notas  (notas_alunos,disciplinas_id,alunos_id) VALUES ('5', '5','20' );

select id,notas_alunos,disciplinas_id,alunos_id from notas u;




/*-- Inserção de dados na tabela de ALUNOS_DISCIPLINAS*/
select id,nome,professores_id  from disciplinas ;
select id, nome, numero_identificacao ,endereco,dt_nascimento  from alunos a ;

/*  CADASTRO DE ALUNO NA DISCIPLINA: 1*/
INSERT INTO alunodisciplinas  (disciplinas_id, alunos_id) VALUES (' 1','1');

select disciplinas_id ,alunos_id  from alunodisciplinas a  ;

/*-- Seleção de Aluno pela Data de Nascimento*/
select id,nome,dt_nascimento from alunos  ;
