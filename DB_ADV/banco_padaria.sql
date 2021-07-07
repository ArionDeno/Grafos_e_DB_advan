/*
estudo de banco de dados
*/

CREATE DATABASE IF NOT EXISTS Padaria;
Use Padaria;

/*
CRia tabela produto
*/
CREATE TABLE Produto
(
 Cod_produto INT NOT NULL PRIMARY KEY  AUTOINCREMENT,
 nome VARCHAR(50),
 desc VARCHAR(80),
 tipo VARCHAR(10),
 preco_prod DECIMAL(10,2),
 data_compra DATE
);


/*Cria tabela padaria*/
CREATE TABLE Cliente
( Cod_cliente INT NOT NULL PRIMARY KEY AUTOINCREMENT,
  CPF_cliente VARCHAR(11), 
  RG_Cliente VARCHAR(8),
  nome VARCHAR(255),
  endereco VARCHAR(128),
  telefone VARCHAR(13), 
  );

  /*Inserindo dados no banco e na tabelas*/
  /*tabela produto*/
  INSERT INTO Produto(nome,desc ,tipo,preco_prod,data_compra );
  VALUES("Queijo prato", "queijo prato parmesao","Laticinio", 5.55,2020,11,5);

  INSERT INTO Produto(nome,desc ,tipo,preco_prod,data_compra );
  VALUES("Presunto vegano", "Presunto vegetal a base de soja","carne", 4.22,2020,5,9);

  INSERT INTO Produto(nome,desc ,tipo,preco_prod,data_compra );
  VALUES("Pao frances", "pao fraces intregral","catbroidato", 2.00,2020,7,3);

  INSERT INTO Produto(nome,desc ,tipo,preco_prod,data_compra );
  VALUES("Requeijao", "requeijao branco cremoso","laticionio", 6.89,2020,1,6);

  INSERT INTO Produto(nome,desc ,tipo,preco_prod,data_compra );
  VALUES("Manteiga president", "manteiga barata","laticionio", 7.45,2020,9,7);

  /*tabela cliente*/
  INSERT INTO Cliente(CPF_cliente,RG_Cliente,nome,endereco,telefone)
  VALUES("99944444455","888774455","Jorge Jose Algusto","rua das samanbaias","88997799");

  INSERT INTO Cliente(CPF_cliente,RG_Cliente,nome,endereco,telefone)
  VALUES("87545565","32588914","Maisa Da Silva santos",avenida das arvores","96365889");

  /*
  
  create table compra (
Cod_id
Cod_Cliente
Cod_produto
Data
Quantidade
)



select * from cliente
inner join compra
on cliente.cod_cliente = compra.cod_cliente
where compra.data = '31/05/1995'
and cliente.nome = 'João da silva'
  */
