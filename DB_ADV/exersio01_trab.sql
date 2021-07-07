/*
Arion denovaro
Atividade 01 -06/04/2021
*/

/*
1 Crie uma visão que contenha as seguintes informações:
nome da cidade,
nome do estado, 
nome da região,
país a que pertence a cidade.
*/

CREATE VIEW Descr_regional  AS
SELECT 
	cidade.cid_Nome,
	estado.est_Nome,
	regiao.Reg_Nome,
	Pais.Pais_Nome

FROM cidade 
INNER JOIN  estado
ON cidade.est_ID = estado.est_ID

INNER JOIN Regiao 
ON regiao.Reg_ID = Est.Reg_ID

INNER JOIN Pais
ON  Pais.Pais_ID = Regiao.Pais_ID;

