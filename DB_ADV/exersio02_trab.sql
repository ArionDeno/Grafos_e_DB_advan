/*
Arion Denovaro
ex 02 - 06/04/2021
*/

/*
Crie uma função que calcule o valor referente a um percentual sobre um valor. A função receberá como 
parâmetro de entrada as seguintes informações: o valor e o percentual desejado sobre este valor. O 
retorno deverá ser o valor referente ao percentual informado.
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