#include"arvore_b.h"

// função  para imprimir  a arvore
 void  imprime_arvore(Arvore *arv)
{
  if(arv->raiz == NULL)
  {
      printf(" dado: %d esq \n ",arv->raiz->dado);
      imprime_arvore(arv->raiz->esq);

      printf(" dado: %d dir \n ",arv->raiz->dado);
      imprime_arvore(arv->raiz->dir);
  }
}



// funçao de busca  o dado
  Arvore*  busca_arvore(Arvore *arv, int v)
{
    // se for vazio
  if(arv->raiz == NULL)
      return NULL;
  else if (arv->raiz->dado > v)
  {   return busca_arvore(arv->raiz->esq,v);   }
  else if (arv->raiz->dado < v)
  {   return busca_arvore(arv->raiz->dir,v);   }
  else
  {  return  arv;   }
}


// funcao de inicializacao da arvore
Arvore *cria_arvore(void)
{
   Arvore *arv = (Arvore*) malloc(sizeof (Arvore));
   arv->raiz=NULL;
   return  arv;
}

// funcao de insersao na arvore
 Noh * insere_arvore(Noh *arv, int v)
{
    // novo noh que será add
    Noh * novo= NULL;
    // a raiz está vazia pois nao tem noh
    if(arv== NULL)
    {
        // cria novo noh
        novo = (Noh*) malloc(sizeof (Noh));
        novo->dado = v;
        novo->dir = NULL;
        novo->esq = NULL;
        arv = novo;
    }
    else if (v < arv->dado)
    {
        arv->esq = insere_arvore(arv->esq,v);
    }
    else
    {
        arv->dir = insere_arvore(arv->dir,v);
    }
    return  arv;
}



// funcao remove um noh da arvore, pelo valor
 Noh * retirar_arvore( Noh *arv, int v)
{
    Noh  *raiz = arv;
  if(arv== NULL)
      return NULL;
  // se for maior que valor na raiz
  else if (arv->dado > v)
  {   arv->esq = retirar_arvore(arv->esq,v);   }
  else if (arv->dado < v)
  { arv->dir = retirar_arvore(arv->dir,v); }
  // achou o noh
  else
  {
     /*noh sem filhos */
     if(arv->esq == NULL && arv->dir == NULL )
     {
         // libera noh
         free(arv);
         arv= NULL;
     }
     // só tem filho a esquerda
     else if (arv->esq == NULL)
     {
         // salva o noh
         Noh *temp = arv;
         // anda a um a frente
         arv = arv->dir;
         // libera o anterior
         free(temp);
     }
     //  Só tem filho a direita
     else if (arv->dir  == NULL)
     {
         // salva o noh
        Noh * temp =arv;
        // anda um a frente e
         arv = arv->esq;
         //libera o noh
         free(temp);
     }
   // tem dois noh filhos
     else
     {
        Noh *temp_d = arv->esq;
        // caminha o direito
        while (temp_d  !=  NULL)
        {    temp_d = temp_d->dir;      }
        // muda as informcoes
         arv->dado = temp_d->dado;
         temp_d->dado =v;
         arv->esq =  raiz = retirar_arvore(raiz->esq,v);
     }
     printf("Noh nao existe\n");
  }
  return arv;
}

// libera arvore
void  libera_arvore(Noh*arv, int v)
{
  if(arv->dado !=v )
   {
       libera_arvore(arv->esq,v);
       libera_arvore(arv->dir,v);
       free(arv);
   }

  // libera raiz
   // free(arv);
  arv = NULL;
}
