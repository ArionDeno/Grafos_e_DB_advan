/*
03 quest�o  
Ap�s a implementa��o desses controles de auditoria, dever� ser criada uma procedure que apresente 
todos os registros de auditoria abrangendo os ve�culos que tiveram seu pre�o de venda alterados ou 
que foram vendidos por um pre�o inferior ao pre�o de venda. Essa consulta ser� realizada da seguinte 
forma:
* Data da altera��o e/ou venda;
           E 
* C�digo do ve�culo desejado
*/

CREATE PROCEDURE Consulta_veiculo_dados_antigo @data_venda DATE, @cod_vei INT IDENTITY(1,1)
AS 
BEGIN
  
  SELECT * FROM Dados_antigos_veiculos  WHERE  Dados_antigos_veiculos.codigo_car = @cod_vei AND Dados_antigos_veiculos.data_alter = @data_venda;

END