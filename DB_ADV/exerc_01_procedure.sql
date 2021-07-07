/*
ser� criada uma Stored Procedure para inserir os dados na tabela ve�culos. Os 
campos da tabela ser�o recebidos como par�metros de entrada.

1. A procedure dever� validar os seguintes campos: 
a) O ano do modelo n�o pode ser menor do que o ano de fabrica��o; 
b) O valor do ve�culo n�o poder� ser zero ou um valor negativo. 
c) Vei_ar, poder� ser �S� ou �N�. 
d) Vei_portas,poder� ser um n�mero entre 2 a 5
e) vei_direcao, poder� ser: �N�-Normal, �H�-Hidr�ulica, �E�-El�trica, �O�-Outros
f) Validar as chaves estrangeiras da tabela:
I. mod_id = Modelo do ve�culo dever� existir na tabela modelo.
II. con_id = Concession�ria dever� existir na tabela concessionaria.
III. mot_id = Tipo do motor, dever� existir na tabela motor.
IV. com_id = Tipo de combust�vel, dever� existir na tabela combust�vel.
g) Caso as condi��es acima n�o sejam satisfeitas, mostrar uma mensagem e n�o gravar o registro. 
Caso contr�rio, gravar as informa��es na tabela ve�culo
*/


CREATE PROCEDURE valida_dados_veiculo @ano_model INT,
                                      @preco  decimal(10,2),
                                      @fabricaco INT,
									  @ar_cond VARCHAR(1),
									  @vei_dir VARCHAR(1),
									  @chassi VARCHAR(18),
									  @placa  VARCHAR(7),
									  @renvavam INT,
									  @n_portas INT,
									  @model_id INT,
									  @cond_id INT,
									  @mod_id INT,
									  @com_id INT,
									  @retorno VARCHAR(100)
AS
/*a) O ano do modelo n�o pode ser menor do que o ano de fabrica��o*/
/*
if exists (select mod_id from modelo where mod_id = @mod_id)
*/   


GO