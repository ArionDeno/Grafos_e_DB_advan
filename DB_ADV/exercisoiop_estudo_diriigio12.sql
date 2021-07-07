/*
Crie um cursor que contenha a data de nascimento e o nome do cliente. A partir desse cursor 
criar uma tabela temporária onde conste: a data de nascimento, o nome do cliente e a faixa 
etária do cliente. As faixas etárias serão as seguintes:
• “Acima dos 50”. Clientes com mais de 50 anos de idade.
• “Entre 35 e 50”. Clientes com idade entre 35 anos até 50 anos.
• “Abaixo dos 35”. Clientes com menos de 35 anos de idade.
*/

DECLARE faixa_clientes CURSOR FOR
SELECT  cliente.cli_nascimento , cliente.cli_nome,
 YEAR(GETDATE()) -YEAR(cliente.cli_nascimento) AS idade    
FROM cliente; 

-- chama cursor
OPEN faixa_clientes ;

-- variaveis
DECLARE @nasci DATE;
DECLARE @nome_cliente VARCHAR(100);
DECLARE @idade INT;
DECLARE @faixa_idade VARCHAR(20);

--cria tabela temp 
CREATE TABLE #dados_temp(nasci DATE , nome_cliente VARCHAR(100) , faixa_idade VARCHAR(20));

FETCH faixa_clientes INTO @nasci , @nome_cliente , @idade;

  WHILE(@@FETCH_STATUS = 0)
  BEGIN
  /*
• “Acima dos 50”. Clientes com mais de 50 anos de idade.
• “Entre 35 e 50”. Clientes com idade entre 35 anos até 50 anos.
• “Abaixo dos 35”. Clientes com menos de 35 anos de idade.
  */
   IF @idade > 50 
     SET @faixa_idade  = 'Acima dos 50';
   ELSE 
     IF @idade < 35  
	   SET @faixa_idade = 'Abaixo dos 35';
     ELSE 
       SET @faixa_idade = 'ENTRE  35 E 50';
 	   
   INSERT INTO #dados_temp VALUES(@nasci , @nome_cliente , @faixa_idade); 
   FETCH faixa_clientes INTO @nasci , @nome_cliente , @idade;
  END
  
  SELECT * FROM #dados_temp;


--fecha cursor
CLOSE faixa_clientes ; 

-- LIBERA memoria 
DEALLOCATE faixa_clientes;


DROP TABLE #dados_temp;