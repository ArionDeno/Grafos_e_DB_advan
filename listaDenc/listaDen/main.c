#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include"listad.h"
#include"listadd.h"


int main(int argc, char *argv[])
{
  ListaD *lista = cria_listad();
  int var =10;

  ListaDD *listdd = cria_listadd();

  printf("Lista dupla encadeada \n");
  insere_fimlistad(lista,10);
  insere_fimlistad(lista,50);
  insere_fimlistad(lista,55);
  insere_fimlistad(lista,90);

   mostra_listad(lista);

 remove_fimlistad(lista, &var);
 remove_fimlistad(lista, &var);

 mostra_listad(lista);

 libera_listad(lista);

 printf("-________________-_________________-\n");

  insere_fimlistadd(listdd, 9999);
  insere_fimlistadd(listdd, 512);
  insere_fimlistadd(listdd, 64);
  insere_fimlistadd(listdd, 1024);
  insere_fimlistadd(listdd, 48);


  remove_listadd(listdd,48);

  libera_listadd(listdd);

  return EXIT_SUCCESS;
}
