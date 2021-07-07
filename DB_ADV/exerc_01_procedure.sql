/*
será criada uma Stored Procedure para inserir os dados na tabela veículos. Os 
campos da tabela serão recebidos como parâmetros de entrada.

1. A procedure deverá validar os seguintes campos: 
a) O ano do modelo não pode ser menor do que o ano de fabricação; 
b) O valor do veículo não poderá ser zero ou um valor negativo. 
c) Vei_ar, poderá ser “S” ou “N”. 
d) Vei_portas,poderá ser um número entre 2 a 5
e) vei_direcao, poderá ser: “N”-Normal, “H”-Hidráulica, “E”-Elétrica, “O”-Outros
f) Validar as chaves estrangeiras da tabela:
I. mod_id = Modelo do veículo deverá existir na tabela modelo.
II. con_id = Concessionária deverá existir na tabela concessionaria.
III. mot_id = Tipo do motor, deverá existir na tabela motor.
IV. com_id = Tipo de combustível, deverá existir na tabela combustível.
g) Caso as condições acima não sejam satisfeitas, mostrar uma mensagem e não gravar o registro. 
Caso contrário, gravar as informações na tabela veículo
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
/*a) O ano do modelo não pode ser menor do que o ano de fabricação*/
/*
if exists (select mod_id from modelo where mod_id = @mod_id)
*/   


GO