/*
02 quest�o 

Criar a trigger, quando for vendido a pre�o inferior, ao preco da tabela.
------------------------------------------------------------------------
Quando o ve�culo for vendido por um pre�o inferior ao seu pre�o de venda cadastrado na tabela 
ve�culos, dever� ser registrado em uma tabela as seguintes informa��es: 
-----------------------------------------
* C�digo da venda;
* C�digo do ve�culo vendido; 
* Valor cadastrado do ve�culo na tabela ve�culos; 
* Valor da venda do ve�culo; 
* Data da venda; 
* Usu�rio que realizou a venda;
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
 
 -- FAZ A COMPARA��O se for um valor inferior ao valor antigo
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


