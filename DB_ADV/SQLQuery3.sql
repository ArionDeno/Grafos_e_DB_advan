/* 8.Vamos  atualizar  o  atributo  tempo  de  servico  de  cada funcionario.  
  Para  isso usaremos  a seguinte f�rmula:
  Ano atual menos o ano de nascimento do funcion�rio menos 25.
*/

UPDATE funcionario SET fun_tempoServico WHERE fun_tempoServico = (SELECT DATENAME(year, GetDate()) ) 
