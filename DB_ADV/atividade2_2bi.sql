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

CREATE TRIGGER salva_veiculo_inferior ON vendaVeiculo
AFTER INSERT
AS  
BEGIN
DECLARE @valor_novo decimal(12,2)
DECLARE @valor_antigo decimal(12,2)
DECLARE @codigo_vei int
DECLARE @usuario_d varchar(30)

-------------------------
set @valor_novo = (select vendaVeiculo.vve_valor FROM  INSERTED)
set @codigo_vei = (select veiculo.vei_id FROM  INSERTED)
set @valor_antigo = (select veiculo.vei_preco FROM  veiculo)
set @usuario_d =  (SELECT SERVERPROPERTY('MachineName');
 
 -- FAZ A COMPARAÇÃO se for um valor inferior ao valor antigo
 IF @valor_novo < @valor_antigo 
 BEGIN 
   -- INSERE OS DADOS
   INSERT INTO Dados_antigos_veiculos VALUES(
    @usuario_d,
    @valor_antigo,
    @valor_novo,
    GETDATE(),
    @usuario_d );

END


