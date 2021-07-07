/*1. Crie o banco BD_MATRICULA.*/

CREATE DATABASE BD_MATRICULA;
USE BD_MATRICULA;
/*
2. No banco criado acima, cria a seguinte tabela:
*/
CREATE TABLE CLIENTE(codigo int not null, nome VARCHAR(100));

/*
3. Insira 4 registros na tabela.
*/

INSERT INTO CLIENTE VALUES(1,'JOAO SANTOS');
INSERT INTO CLIENTE VALUES(2,'MARIA VIERA');
INSERT INTO CLIENTE VALUES(3,'PEDRO ROXO');
INSERT INTO CLIENTE VALUES(4,'MARCELO BARBOSA');
INSERT INTO CLIENTE VALUES(5,'BILL GATES');

/*
4. Crie um LOGIN com o nome de log_matricula.
*/
CREATE LOGIN  log_matricula WITH PASSWORD='abacate' DEFAULT_DATABASE='BD_MATRICULA';



/*
5. Desconecte-se do banco e conecte-se com o novo LOGIN.
*/

