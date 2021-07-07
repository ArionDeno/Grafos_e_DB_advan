#include"arvore_bi.h"


// cria um noh na arvore
Noh * arvore_criaNoh(char dado, Noh *es, Noh *di)
{
   Noh *novo = (Noh*) malloc(sizeof (Noh));
   novo->dado = dado;
   novo->esq = es;
   novo->dir = di;
   return  novo;
}

// inicializa a arvore
Arvore *cria_arvore(char va_raiz)
{
  //cria a raiz da arvove
    Arvore *arv =  (Arvore*) malloc(sizeof (Arvore));

    // aloca memoria para raiz, coloca os val
    arv->raiz = (Noh*) malloc(sizeof (Noh));
    arv->raiz->dado = va_raiz;
    arv->raiz->dir =NULL;
    arv->raiz->esq     =NULL;
    return  arv;
}

// libera arvore
void  libera_arvore(Noh*arv)
{
  if(arv->dado != 'A')
   {
       libera_arvore(arv->esq);
       libera_arvore(arv->dir);
       free(arv);
   }

  // libera raiz
   // free(arv);
  arv = NULL;
}

// imprime a arvore
void imprime_arvore(Noh *arv)
{
  printf("-> \n \t");
   if (arv != NULL)
   {
       printf("\t %c ---", arv->dado);
// chama recursivamente
       printf("Esquerdo\n");
       imprime_arvore(arv->esq);
       printf("direito\n");
       imprime_arvore(arv->dir);

   }
   // sai
   return;
}




// função que remove um noh, pelo valor
// se o valor não existir retorna true
bool  remove_noh(Noh *arv, int v)
{


}

