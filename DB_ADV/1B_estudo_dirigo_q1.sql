/*
1.Selecione  o  nome,  a  cidade  de  residência e  a  data  de  nascimento  de  todos  os
clientes por ordem de data de nascimento do mais jovem ao mais velho. 
Mostrando a data de nascimento no formato DD/MM/AAAA
*/


SELECT cliente.cli_nome , cliente.cli_nascimento, cidade.cid_Nome

FROM cliente 

INNER JOIN cidade
ON cliente.cid_id = cidade.cid_ID 

ORDER BY  cliente.cli_nascimento ASC;
