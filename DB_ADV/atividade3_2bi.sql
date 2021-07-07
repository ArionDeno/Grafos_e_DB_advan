/*
03 questão  
Após a implementação desses controles de auditoria, deverá ser criada uma procedure que apresente 
todos os registros de auditoria abrangendo os veículos que tiveram seu preço de venda alterados ou 
que foram vendidos por um preço inferior ao preço de venda. Essa consulta será realizada da seguinte 
forma:
* Data da alteração e/ou venda;
           E 
* Código do veículo desejado
*/

CREATE PROCEDURE Consulta_veiculo_dados_antigo @data_venda DATE, @cod_vei INT IDENTITY(1,1)
AS 
BEGIN
  
  SELECT * FROM Dados_antigos_veiculos  WHERE  Dados_antigos_veiculos.codigo_car = @cod_vei AND Dados_antigos_veiculos.data_alter = @data_venda;

END