#ifndef ARVORE_BI_H
#define ARVORE_BI_H

#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>

// representação de um noh da arvore
typedef  struct  noh
{
    struct noh  *esq, *dir;
    char dado;
} Noh;

// representação da arvore
typedef struct arvore
{
  Noh *raiz;
} Arvore;

/*----------------------TAD-------------------*/

// cria um noh na arvore
Noh * arvore_criaNoh(char dado, Noh *es, Noh *di);

// inicializa a arvore
Arvore *cria_arvore(char va_raiz);

// libera arvore
void  libera_arvore(Noh *arv);

// imprime a arvore
void imprime_arvore(Noh *arv);


// função que remove um noh, pelo valor
// se o valor não existir retorna true
bool  remove_noh(Noh *arv, int v);



#endif // ARVORE_BI_H
