#include"listadd.h"

// funcao cria a lista dd
ListaDD  *cria_listadd(void)
{
  ListaDD * l =(ListaDD*)  malloc(sizeof (ListaDD));
  l->ult = NULL;
  l->prim = NULL;
  return  l;
}

// libera a lista dd
void libera_listadd(ListaDD *dd)
{
    NohDD * temp=NULL, *p =dd->prim ;

    while (dd != NULL)
    {
       temp = p->prox;
       free(p);
       p = temp;
    }
    free(dd);
    dd = NULL;
}

//insere no fim da lista dd
void insere_fimlistadd(ListaDD *dd , int v )
{
  NohDD  *novo = (NohDD *) calloc(1,sizeof (NohDD));

  // recebe o valor
  novo->valor =v;
  novo->ante = dd->ult;
  novo->prox = NULL;
  // testa se a lista está vazia
  if(dd->ult != NULL)
  {
    //novo é o proximo do ultimo
      dd->ult->prox = novo;
  }
  else
  {
     // novo primeiro
      dd->prim = novo;
      // novo tambem e o ultimo, por ter 1 so noh
      dd->ult = novo;
  }

}

 // retira elemento da lista dd se houver
void  remove_listadd(ListaDD *dd,int v )
{
    NohDD *d = NULL;
   // percorre e tenta achar o  elemento
    for (d =  dd->prim; d != NULL ;  d = d->prox)
    {
        // busca o valor
       if( d->valor == v)
        {break;}
    }

//verifica se na primeira posicao da lista
   if( d == dd->prim)
   {dd->prim = d->prox;  }
   else
   // faz o anterior apontar para o proximo
   {d->ante->prox = d->prox;}

   // testa se o ultimo
   if(d == dd->ult)
   { dd->ult =  d->ante ;}
   // faz o prox apontar anterior
   else
   {d->prox->ante  = d->ante;}
   // libera memoria do noh que será excluido
   free(d);

}

// mostra os dados da lista
void mostra_listadd(ListaDD * dd)
{
    for (NohDD *d =  dd->prim; d != NULL ;  d = d->prox)
    {
        printf("Valor da lista:  %d  \n", d->valor);
    }
}

