CREATE DATABASE DADOS_REVENDA;
GO
USE DADOS_REVENDA;
GO
/*tabela periodo tera as datas*/
CREATE TABLE Periodo( data_p DATE PRIMARY KEY); 

/* cod_cidade  cidade , estado */
CREATE TABLE Localizacao(cod_local INT PRIMARY KEY, cidade VARCHAR(80), estado VARCHAR(80) );

/*tabela com o tipo combustivel - alchol, gasolina, eletrico*/
CREATE TABLE Tipo_combustivel(Id_comb INT PRIMARY KEY, descricao VARCHAR(30) );

/* modelo do carro */
CREATE TABLE Modelo_veiculo(Id_modlVei INT PRIMARY KEY, modelo_desc VARCHAR(200) );

/*montadora do carro , ford , peugeot, chevrolet , toyota, fiat*/
CREATE TABLE Montadora(Id_mont INT PRIMARY KEY,  desc_monta VARCHAR(30) );

/*tabela com as informações do total de vendas com periodo*/ 
CREATE TABLE Total_Vendas 
 ( 
  Id_totvenda INT PRIMARY KEY  IDENTITY(1,1),
  total DECIMAL(8,2),
  Id_mont INT, Id_modlVei INT, Id_comb INT , cod_local INT , data_p DATE,
  CONSTRAINT fkId_monta FOREIGN KEY(Id_mont) REFERENCES Montadora (Id_mont),
  CONSTRAINT fkId_modvei FOREIGN KEY(Id_modlVei) REFERENCES Modelo_veiculo (Id_modlVei),
  CONSTRAINT fkId_comb FOREIGN KEY(Id_comb) REFERENCES Tipo_combustivel (Id_comb),
  CONSTRAINT fkcod_local FOREIGN KEY(cod_local) REFERENCES Localizacao (cod_local),
  CONSTRAINT fkdata_p FOREIGN KEY(data_p) REFERENCES Periodo(data_p),
  );
 
/*---------------------------------------------*/  

/*
  insere os dados da tabela, vindos do outro banco
*/
USE DADOS_REVENDA;
GO
INSERT INTO Modelo_veiculo(Id_modlVei , modelo_desc)
SELECT mod_id , mod_descricao    FROM RevendaCC.DBO.Modelo ;

INSERT INTO Tipo_combustivel(Id_comb , descricao  )
SELECT com_id  , con_descricao FROM RevendaCC.DBO.combustivel;

INSERT INTO Periodo( data_p)
SELECT distinct ven_data FROM RevendaCC.DBO.venda order by ven_data;

INSERT INTO Montadora(Id_mont,  desc_monta )
SELECT mon_id  , mon_nome FROM RevendaCC.DBO.montadora;

INSERT INTO Localizacao(cod_local , cidade , estado )
SELECT cid_ID , cid_Nome , est_Nome  
    FROM RevendaCC.DBO.cidade inner join 
	      RevendaCC.DBO.Estado on
		  revendaCC.DBO.cidade.est_ID = revendaCC.DBO.Estado.est_ID;

		  /*fazer o insert da tabela Total_Vendas com os dados das demais*/
/*varieis para multiplicar*/

DECLARE @valor_mul AS DECIMAL(12,2);


INSERT INTO Total_Vendas
SELECT vve_quantidade * vve_valor as valor_mul, mt.mon_id, model.mod_id, veiculo.com_id, loca.est_ID, ven_data  
    FROM RevendaCC.DBO.vendaVeiculo 
    INNER JOIN revendaCC.dbo.veiculo ON RevendaCC.dbo.veiculo.vei_id =  RevendaCC.dbo.vendaVeiculo.vei_id
    INNER JOIN revendaCC.dbo.modelo model ON model.mod_id =  RevendaCC.dbo.veiculo.mod_id
    INNER JOIN revendaCC.dbo.montadora mt ON mt.mon_id = RevendaCC.dbo.veiculo.mod_id
    INNER JOIN revendaCC.dbo.venda ON revendaCC.dbo.venda.ven_id = revendaCC.dbo.vendaVeiculo.ven_id
    INNER JOIN revendaCC.dbo.cliente ON revendaCC.dbo.cliente.cli_id = revendaCC.dbo.venda.cli_id
    INNER JOIN revendaCC.dbo.cidade loca ON loca.cid_ID = revendaCC.dbo.cliente.cid_id

