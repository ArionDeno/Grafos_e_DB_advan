/*
2.Mostre o total de modelos de ve�culos por montadora.
  Exiba o nome da montadora 
  e o total de modelos de ve�culos de cada montadora.
*/

SELECT modelo.mod_id COUNT(*) AS montadora.mon_id FROM montadora GROUP BY modelo.mod_descricao;
