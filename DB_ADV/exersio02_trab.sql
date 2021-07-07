/*
Arion Denovaro
ex 02 - 06/04/2021
*/

/*
Crie uma fun��o que calcule o valor referente a um percentual sobre um valor. A fun��o receber� como 
par�metro de entrada as seguintes informa��es: o valor e o percentual desejado sobre este valor. O 
retorno dever� ser o valor referente ao percentual informado.
*/

/*
Calcula porsentagem com o paramento do valor
*/
CREATE FUNCTION Ret_porcento(@p float, @v int)
  RETURN FLOAT
  BEGIN 
  /* valor retorno*/
  DECLARE @val float
  /*porcentagem*/
  DECLARE @porte float 

  @porte = @p/100;
  @val = @v * @porte
  
  RETURN @val
END