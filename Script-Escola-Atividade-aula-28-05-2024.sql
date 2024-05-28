CREATE DATABASE IF NOT EXISTS escola; 
USE escola; 
CREATE TABLE IF NOT EXISTS alunos ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100), 
data_nascimento DATE, 
endereco VARCHAR(255) 
); 
CREATE TABLE IF NOT EXISTS professores ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100), 
especialidade VARCHAR(100) 
); 
CREATE TABLE IF NOT EXISTS notas ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
aluno_id INT, 
materia VARCHAR(50), 
nota DECIMAL(5, 2), 
FOREIGN KEY (aluno_id) REFERENCES alunos(id) 
);

/*Exercício 1: 
Crie um usuário chamado aluno1 com senha senha123 que pode se conectar a 
partir de localhost e dê permissão de seleção (SELECT) na tabela alunos do 
banco de dados escola.*/

/*criando usuario*/
create user 'aluno1'@'localhost' identified by 'senha123';
/*dando permisão:*/ 
grant select on escola.alunos to 'aluno1'@'localhost';
/*verificando se a permissoes*/
show grants for 'aluno1'@'localhost';
select user, host from mysql.user;





/**Exercício 2: 
Crie um usuário chamado professor1 com senha senha456 que pode se 
conectar a partir de qualquer host (%) e dê a ele permissão de inserção (INSERT) 
na tabela notas do banco de dados escola./

/*criando usuario*/
create user 'professor1'@'%' identified by 'senha456';
/*dando permisão:*/ 
grant insert on escola.notas  to 'professor1'@'%';
/*verificando se a permissoes*/
show grants for 'professor1'@'%';
select user, host from mysql.user;








/*Exercício 3: 
Crie um usuário chamado admin1 com senha senha789 que pode se conectar a 
partir de localhost e dê a ele todas as permissões no banco de dados escola.*/
/*criando usuario*/
create user 'admin1'@'localhost' identified by 'senha789';
/*dando permisão:*/ 
grant all privileges on  * to 'admin1'@'localhost';
/*verificando se a permissoes*/
show grants for 'admin1'@'localhost';
select user, host from mysql.user;



/*Exercício 4: 
Revogue a permissão de seleção (SELECT) da tabela alunos para o usuário  aluno1*/

/**Revogando permisão de usuario*/
revoke select on escola.alunos from 'aluno1'@'localhost';
show grants for 'aluno1'@'localhost';


/*Exercício 5: 
Crie um usuário chamado aluno2 com senha senha321 que pode se conectar a 
partir de localhost e dê permissão de seleção (SELECT) na tabela professores 
do banco de dados escola. */


/*criando usuario*/
create user 'aluno2'@'localhost' identified by 'senha321';
/*dando permisão:*/ 
grant select on escola.professores  to 'aluno2'@'localhost';
/*verificando se a permissoes*/
show grants for 'aluno2'@'localhost';
select user, host from mysql.user;


/*Exercício 6: 
Revogue todas as permissões do usuário admin1 no banco de dados escola.*/
revoke all privileges on * from 'admin1'@'localhost';
show grants for 'admin1'@'localhost';

/*Exercício 7: 
Crie um usuário chamado professor2 com senha senha654 que pode se 
conectar a partir de qualquer host (%) e dê a ele permissão de atualização 
(UPDATE) na tabela notas do banco de dados escola. */

/*criando usuario*/
create user 'professor2'@'%' identified by 'senha654';
/*dando permisão:*/ 
grant update  on escola.notas  to 'professor2'@'%';
/*verificando se a permissoes*/
show grants for 'professor2'@'%';



/**Exercício 8: 
Revogue a permissão de inserção (INSERT) da tabela notas para o usuário professor1. */
revoke insert on escola.notas from 'professor1'@'%';
show grants for 'professor1'@'%';


/*Exercício 9: 
Crie um usuário chamado aluno3 com senha senha987 que pode se conectar a 
partir de localhost e dê permissão de seleção (SELECT) na tabela notas do 
banco de dados escola. */


/*criando usuario*/
create user 'aluno3'@'localhost' identified by 'senha987';
/*dando permisão:*/ 
grant select on escola.notas to 'aluno3'@'localhost';
/*verificando se a permissoes*/
show grants for 'aluno1'@'localhost';


/*Exercício 10: 
Revogue todas as permissões do usuário professor2 na tabela notas do banco 
de dados escola. */
revoke all privileges on escola.notas   from 'professor2'@'%';
show grants for 'professor2'@'%';
