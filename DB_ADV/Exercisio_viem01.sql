/*
1. Criar uma View que mostre as seguintes caracter�sticas do ve�culo:
Renavam do ve�culo, nome da montadora, descri��o do modelo do ve�culo, tipo de combust�vel.
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