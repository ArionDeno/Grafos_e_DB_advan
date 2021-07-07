#ifndef LISTADD_H
#define LISTADD_H
/*
 * definição e implementação de uma
Lista Dupla  encadeada
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

// estrutura noh lista dupla enc
typedef struct nohdd
{
  struct nohdd *prox, *ante;
  int valor;
}NohDD;

// estrutua para armazenar a lista dupla enc
typedef  struct Listadd
{
  NohDD  *prim, *ult;
}ListaDD;

// funcao cria a lista dd
ListaDD  *cria_listadd(void);

// libera a lista dd
void libera_listadd(ListaDD *);

//insere no fim da lista dd
void insere_fimlistadd(ListaDD *, int );

 // retira elemento da lista dd se houver
void  remove_listadd(ListaDD *,int );

// mostra os dados da lista
void mostra_listadd(ListaDD *);



#endif // LISTADD_H
