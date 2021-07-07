#ifndef LISTAD_H
#define LISTAD_H

/*
 * definição e implementação de uma
Lista Simples encadeada
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

//definição de um noh
typedef struct noh
{
  struct noh *prox;
  int val;
}Noh;



// definição de uma lista, que possuei varios nohs

typedef struct
{
 Noh *inicio;
}ListaD;


// funcao cria lista
  ListaD  *cria_listad(void);

// funcao libera memoria da lista
  void libera_listad(ListaD *);

// funcao insere no fim
// verifica se foi possivel inserir
  void  insere_fimlistad(ListaD *,int);

// funcao remove no fim
 void  remove_fimlistad(ListaD *,int *v);

 // mostra o conteudo da lista
 void mostra_listad(ListaD *);


#endif // LISTAD_H
