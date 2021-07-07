#include"arvore_avl.h"


//cria nova arvore
Noh *cria_arvore(int raiz)
{
    //novo noh
  Noh *novo = (Noh*) malloc(sizeof (Noh));
  novo->dir = NULL;
  novo->esq = NULL;
  novo->dado = raiz;
  novo->altura = 0;

  return novo;
}


