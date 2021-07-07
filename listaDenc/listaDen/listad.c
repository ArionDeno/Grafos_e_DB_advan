#include"listad.h"

// funcao cria lista
  ListaD  *cria_listad(void)
  {
   // alloca memoria para lista
    ListaD *l = (ListaD*) malloc(sizeof (ListaD));
    // marca o inicio da lista
    l->inicio = NULL;
    return  l;
  }

// funcao libera memoria da lista
  void libera_listad(ListaD *d)
{
    Noh *p = d->inicio, *temp=NULL;
    while(p != NULL)
    {
        // guarda ref para o seguinte
        temp = p->prox;

        // anterior libera
        free(p);

        // faz apontar para o proximo salvo
        p = temp;
    }
// libera a memoria da lista principal
    free(d);
}

// funcao insere no fim
// verifica se foi possivel inserir
 void  insere_fimlistad(ListaD *d,int v)
   {
     // novo elemento individual
       Noh *novo = (Noh*)  calloc(1,sizeof (Noh));

       //recebe valor
       novo->val =v;

       //o fim aponta para o incio
       novo->prox = d->inicio;

       // atualiza o inicio
       d->inicio = novo;
   }

// funcao remove no fim
 void  remove_fimlistad(ListaD *d,int *v)
 {
    Noh *anterior =NULL, *p = d->inicio;

  // procura elemento na lista
    while(p !=NULL  && p->val != *v)
    {
        anterior = p;
        p = p->prox;
    }

  // se acho o elemento
 if( p  != NULL)
{
   // retira o elemento da no inicio
    if(anterior == NULL)
    { // retira no inicio
        d->inicio = p->prox;
    }
    else
    {
     // retira no meio da lista
        anterior->prox = p->prox;
    }
  // libera memoria o elemento
     free(p);
  }
 // se não for achado
   else
   {
      printf("elemento nao existe\n") ;
   }

 }



 // mostra o conteudo da lista
 void mostra_listad(ListaD * d)
 { int i =0;
     for (Noh *p = d->inicio; p!= NULL;  p =p->prox)
     {
        printf("Valor = %d\n" ,p->val );
        i++;
     }
     printf("----------------------------\n");
     unsigned  tamlista =  i* sizeof (Noh) ;
     tamlista += sizeof (ListaD);
     printf("tamanho da lista em memoria %u bytes \n ",tamlista);

 }

