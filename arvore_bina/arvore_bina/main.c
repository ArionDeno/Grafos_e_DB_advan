#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include"arvore_bi.h"

int main()
{
 const char letras[] ={'A','B','C','D','E','F'};
  Arvore *arvore = cria_arvore(letras[0]);

  // cria esq
  //  <B
  arvore->raiz->esq = arvore_criaNoh(letras[1],arvore->raiz->esq,NULL);
  // <C
  arvore->raiz->esq = arvore_criaNoh(letras[3],arvore->raiz->esq,NULL);

  // cria lado direito
// C >
  arvore->raiz->dir = arvore_criaNoh(letras[2],NULL,arvore->raiz->dir);
  //E
  arvore->raiz->dir = arvore_criaNoh(letras[4],NULL,arvore->raiz->dir);
  //F
  arvore->raiz->dir->dir = arvore_criaNoh(letras[5],NULL,arvore->raiz->dir);

  // imprime a arvore
 imprime_arvore(arvore->raiz);

   libera_arvore(arvore->raiz);


    return EXIT_SUCCESS;
}
