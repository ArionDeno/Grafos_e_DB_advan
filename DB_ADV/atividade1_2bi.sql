/*01 questão 

Criar a tabela, com o nome "Dados_antigos_veiculos"
------------------------------------------------------------------
Na tabela veículos quando o preço de venda do veículo for alterado, deverá ser registrado em uma 
------------------------------------------------------------------
tabela as seguintes informações: 

inserir na trigger as seguintes informcoes:
----------------------------
 * Código do veículo;
 * Preço de venda antigo do veículo; 
 * Novo preço de venda do veículo; 
 * Data da alteração; 
 * Usuário que realizou a alteração. Utilizar o comando SELECT SERVERPROPERTY('MachineName'); 

*/



/*
02 questão 

Criar a trigger, quando for vendido a preço inferior, ao preco da tabela.
------------------------------------------------------------------------
Quando o veículo for vendido por um preço inferior ao seu preço de venda cadastrado na tabela 
veículos, deverá ser registrado em uma tabela as seguintes informações: 
-----------------------------------------
* Código da venda;
* Código do veículo vendido; 
* Valor cadastrado do veículo na tabela veículos; 
* Valor da venda do veículo; 
* Data da venda; 
* Usuário que realizou a venda;

*/


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