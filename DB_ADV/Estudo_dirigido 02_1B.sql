/*
Banco de dados avan�ados  2 estudo dirigido 1 bimestre
Aluno Arion Denovaro  
*/


/*
1. Crie um banco de dados com o seu nome. Ex. banco de dados JoseMaria. Esse banco de dados ser� a 
base para a resolu��o de todos os exerc�cios a seguir.
*/

CREATE DATABASE   "Arion";

/*
2. Acesse o banco de dados criado anteriormente.
*/
USE Arion;
GO
GO

/*
3. Crie uma pol�tica de backup para ser executada durante os exerc�cios abaixo. Essa pol�tica dever� 
conter pelo menos um backup completo, dois diferenciais e um backup de log. O arquivo de backup 
dever� ser um �nico arquivo. Descreva a pol�tica de backup criada por voc�.

*/

/*
Primeiramente fazer um back geral, 1 vez por mes, no ultimo dia util.
durante os dias uteis, fazer backup complementar ap�s o final do dia, que acresente.
*/

/*BACKP Completo*/
USE MASTER
GO

/*6. Realize o primeiro backup da sua pol�tica de backup.*/

/*backup caminho em Linux com um segundo HD*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_FULL/ARION.bak' WITH INIT;

/*backUp diferecial 1*/     
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2021.bak' WITH DIFFERENTIAL;


/*backUp diferecial 2*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2021.bak' WITH DIFFERENTIAL;

/*BACKUP Log*/
BACKUP LOG Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2021_log.bak' WITH NOINIT;


/* 4 - codigo exercisio 4 executado*/


/*
5. A tabela criada no exerc�cio anterior � uma tabela Heap? Justifique a sua resposta.
*/
/*
Sim � uma tabela Heap, pois possui um indice grande para insercao.
*/


/*7. Fa�a uma consulta na tabela tabNumeros buscando o n�mero 8000000. Verifique se foi usado algum 
�ndice para essa consulta.*/
SELECT numero FROM TabNumeros WHERE tabNumeros.numero = 8000000;

/*
8. Crie um �ndice para melhorar o desempenho da consulta anterior.
*/
CREATE NONCLUSTERED  INDEX indice ON tabnumeros (numero);
/*
9. Realize novamente a consulta na tabela buscando o n�mero 8000000. Verifique se foi usado o �ndice 
para essa consulta.
*/
/*NAO foi usado*/


/*10. Est� no momento de fazer um novo backup seguindo a sua pol�tica de backup.
*/


/*backup caminho em Linux com um segundo HD*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_FULL/ARION_2.bak' WITH INIT;

/*backUp diferecial 1*/     
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2022.bak' WITH DIFFERENTIAL;


/*backUp diferecial 2*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2022.bak' WITH DIFFERENTIAL;

/*BACKUP Log*/
BACKUP LOG Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2022_log.bak' WITH NOINIT;


/*11. Crie o login com os seguintes requisitos:*/

/*a. Nome do login: ser� o seu nome mais o termo �BD�. Exemplo: joseMariaBD;*/
  
/*b. A senha: 123;*/
CREATE LOGIN ARIONDB WITH PASSWORD='123';


/*c. Desabilite as pol�ticas de senha (requisitos m�nimos e expira��o);*/
CHECK_EXPIRATION  OFF;
/*d. Atribua como banco de dados default o banco de dados criado anteriormente.*/

Arion DB DEFAULT;
/*-------------------------------------------------------------------------------*/

/*12. Crie o usu�rio com o mesmo nome do login e atrelado ao login criado.*/
CREATE USER	arion FROM  Arion  WITH DEFAULT_SCHEMA =[ARION];


/*13. Atribua a permiss�o de db_owner do banco de dados para o usu�rio criado.*/
 GRANT EXECUTE ON arion TO DB_OWNER;  
GO  
/*14. Fa�a um novo backup seguindo a sua pol�tica de backup.*/    
	
/*backup caminho em Linux com um segundo HD*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_FULL/ARION_3.bak' WITH INIT;

/*backUp diferecial 1*/     
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2023.bak' WITH DIFFERENTIAL;


/*backUp diferecial 2*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2023.bak' WITH DIFFERENTIAL;

/*BACKUP Log*/
BACKUP LOG Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2023_log.bak' WITH NOINIT;

/*15. Fa�a o login com o usu�rio criado e adicione no banco de dados a tabela fam�lia, com as seguintes 
colunas:*/

/*a. ID, campo do tipo inteiro e chave prim�ria da tabela;*/
  CREATE TABLE familia(ID INT  PRIMARY KEY AUTO INCREMENT, 

/*b. Nome do parente, campo string de 100 caracteres; */
  nome_parente VARCHAR(100) , 

/*c. Tipo de parentesco, campo string de 20 caracteres.*/
 tipo_parentestco VARCHAR(20) );

/*16. Insira cinco registros na tabela familia.*/
INSERT INTO familia VALUES('Carlos tatu', 'sogro');
INSERT INTO familia VALUES('ana tatu', 'sogra');
INSERT INTO familia VALUES('rafaela tatu', 'sobrinha');
INSERT INTO familia VALUES('marilia primeira', 'sogra avo');
INSERT INTO familia VALUES('cesar tatu', 'tio');


/*17. A tabela criada no exerc�cio anterior � uma tabela Heap? Justifique a sua resposta.*/
/* --------------------------------------------------------------
N�o, pois, pois foi solicitado uma tabela simples,
e a mesma n�o ser� usado em grnades consultas */ 


/*18. Retire as permiss�es de insert, delete e update do usu�rio criado para a tabela familia.*/
REVOKE UPDATE ON Arion to arion;
REVOKE INSERT ON Arion to arion;
DENY DELETE ON Arion to arion;


/*19. Insira um registro na tabela familia.*/
INSERT INTO familia VALUES('isis tatu', 'tia avo');


--20. Fa�a um novo backup seguindo a sua pol�tica de backup.
/*backup caminho em Linux com um segundo HD*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_FULL/ARION_4.bak' WITH INIT;

/*backUp diferecial 1*/     
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2024.bak' WITH DIFFERENTIAL;

/*backUp diferecial 2*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2024.bak' WITH DIFFERENTIAL;

/*BACKUP Log*/
BACKUP LOG Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2024_log.bak' WITH NOINIT;


--21. Crie o schema �pessoal� com autoriza��o para o usu�rio criado.
CREATE SCHEMA pessoa AUTHORIZATION arion ;


--22. Transfira a tabela fam�lia do schema dbo para o schema pessoal.
ALTER SCHEMA familia  TRANSFER pessoa;

--23. Realize uma consulta na tabela fam�lia.
 SELECT * FROM familia;

--24. Fa�a um novo backup seguindo a sua pol�tica de backup.
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_FULL/ARION_5.bak' WITH INIT;

/*backUp diferecial 1*/     
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2025.bak' WITH DIFFERENTIAL;

/*backUp diferecial 2*/
BACKUP DATABASE Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2025.bak' WITH DIFFERENTIAL;

/*BACKUP Log*/
BACKUP LOG Arion TO DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2025_log.bak' WITH NOINIT;

--25. Copie os dados da tabela �tabNumeros� para a tabela tempor�ria #numeros. 
/*Tabela temporaria local */
CREATE TABLE #numeros(num INT NOT NULL);

-- copiado dados
INSERT INTO  tabnumeros (numero)  SELECT   num FROM #numeros;

--26. Onde est� armazenada a tabela tempor�ria #numeros?
/*
Est�o armazendas em Cache, equivalente a estarem na memoria RAM.
APOS o fim da rotina, a mesma ser� liberada da memoria.
*/

--27. Fa�a uma consulta na tabela tempor�ria mostrando os n�meros por ordem decrescente.
SELECT #numeros.num FROM #numeros  ORDER BY DESC;

/*28. Crie uma fun��o que retorne todos os registros da tabela fam�lia de acordo com o tipo de parentesco 
informado.*/ 
CREATE FUNCTION Lista_familia(@parentesco VARCHAR(20))
RETURN TABLE
AS  RETURN(SELECT * FROM familia WHERE familia.tipo_parentestco = @parentesco);

/*29. Verifique se o seu arquivo de backup est� ok. Se contem todos os backups que voc� realizou at� o 
momento.Banco de dados 3*/
/*Sim Contem*/

/*30. Usando a fun��o criada. Fa�a uma consulta que retorne todos os parentes que s�o do tipo �tio�. Ex: 
retornaParentes(�tio�) */
FUNCTION Lista_familia('tio tatu');


/*31. Realize o �ltimo backup da sua pol�tica de backup. */
 
 /*32. Neste momento, o banco de dados apresentou um problema. Voc� dever� restaurar o banco de 
dados. Para isso, voc� dever� utilizar os backups realizados. Responda o seguinte: */
   --a. Quais seriam os backups que voc� recuperaria?
   /*
     1 back up ARION_5.bak
	 2 ARION_31_12_2025.bak
	 3 ARION_31_12_2025.bak
   */
   --b. Qual a ordem de recupera��o dos backups?
    /*
     1 back up ARION_5.bak
	 2 ARION_31_12_2025.bak
	 3 ARION_31_12_2025.bak
   */
--33. Realize a restaura��o da base de dados

/*BACK UP 1*/
RESTORE DATABASE  ARION  FROM DISK = '/dev/sdb1/BACKUP_FULL/ARION_5.bak' WITH FILE = 1, RECOVERY;

/*BACK UP 2*/
RESTORE DATABASE  ARION  FROM DISK = '/dev/sdb1/BACKUP_INCRE/ARION_01_01_2025.bak' WITH FILE = 2, RECOVERY;

RESTORE DATABASE  ARION  FROM DISK = '/dev/sdb1/BACKUP_INCRE/ARION_31_12_2025.bak' WITH FILE = 3, RECOVERY;


