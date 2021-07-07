/*
1. Criar uma View que mostre as seguintes características do veículo:
Renavam do veículo, nome da montadora, descrição do modelo do veículo, tipo de combustível.
*/

CREATE VIEW Descricao_carro AS
	SELECT        veiculo.vei_renavam ,
	              montadora.mon_nome  ,
				  modelo.mod_descricao ,
				  motor.mot_descricao 

FROM veiculo
INNER JOIN modelo
ON veiculo.mod_id = modelo.mod_id

/* chave primaria com chave estrageira para coletar os dados*/
INNER JOIN montadora 
ON montadora.mon_id = modelo.mon_id

INNER JOIN motor
ON  veiculo.mot_id = motor.mot_id;


/*-------------------executar viem-----------*/
SELECT * FROM Descricao_carro;