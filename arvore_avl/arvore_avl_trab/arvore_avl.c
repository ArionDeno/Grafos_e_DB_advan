


#include <stdio.h>
#include<stdlib.h>
#include<stdbool.h>

#include"arvore_avl.h"


// funcoes de manipulacao da arvore
/*---------------------------------------------*/


// insere noh na arvore
Noh *insere_noh(Noh *a, int v)
{
  // vazio insere novo
  if(a == NULL)
  {
     a = (Noh*) malloc(sizeof (Noh));
     a->dado =v;
     a->dir = NULL;
     a->esq = NULL;
  }
  else
  {
    // insere na sub arvore dir
    if(v > a->dado)
    {
      a->dir = insere_noh(a->dir,v);
      //fator balanceamento
      if(fator_balan(a) == -2)
      {
        if(v > a->dir->dado)
        { a = rota_dir_dir(a); }
        else
        {a = rota_dir_esq(a); }
      }
    }
    else
    {// joga dado esq
      if(v < a->dado)
      {
         a->esq = insere_noh(a->esq, v);
         //fator balaceamento
         if(fator_balan(a) == 2)
         {
           if(v <a->esq->dado)
           {a = rota_esq_esq(a); }
           else
           {a = rota_esq_dir(a); }
         }
      }
    }
    // calcula altura da arovre
    a->altura = altura_arvore(a);
  }

 // retora a arvore
  return  a;
}


// apaga noh na arvore
Noh *apaga_noh(Noh *a, int v)
{
 Noh *p;

 // se o noh é vazio
 if(a == NULL)
 {
   puts("arvore vazia , nada a apagar aqui");
     return NULL;
 }
 else
 {
   // busca lado direito
    if(v > a->dado)
    {
        a->dir = apaga_noh(a->dir,v);
        //calcula fator de balanceamento para rotacao
        if(fator_balan(a) == 2)
        {
            // lado esquerdo
            if(fator_balan(a->esq) > 0)
            {a = rota_esq_esq(a);  }
            else
            {a = rota_esq_dir(a);  }
        }
        // lado esquerdo
        else
        {
            if(v < a->dado)
            {
               a->esq = apaga_noh(a->esq,v);
               // fator de balanceamento
               if(fator_balan(a) == -2)
               {
                   if(fator_balan(a->dir) <= 0)
                   {a = rota_dir_dir(a);  }
                   else
                   {a = rota_dir_esq(a);  }
               }
               //o dado para apagar foi achado
               else
               {
                 if(a->dir !=NULL)
                 {
                   //apaga o seguinte
                   p = a->dir;

                   while(p->esq !=NULL)
                   {p = p->esq;  }

                   a->dado = p->dado;
                   a->dir = apaga_noh(a->dir,p->dado);

                   // remanegando a arvore
                   if(fator_balan(a) == 2)
                   {
                       if(fator_balan(a->esq) >= 0)
                       {a = rota_esq_esq(a); }
                       else
                       {a = rota_esq_dir(a);  }
                   }
                   else
                   {return  a->esq;}
                 }
               }
            }
        }
    }
 }
  a->altura = altura_arvore(a);
  return  a;
}

// mostra a arvore
void mostra_arvore(Noh *a)
{
  if(a != NULL)
  {
     printf("arvore dados \n valor-> %d , bal -: %d\n",a->dado, fator_balan(a));
     puts("----ESQ-----------------------");
     mostra_arvore(a->esq);
     puts("----DIR-----------------------");
     mostra_arvore(a->dir);
  }
}


// altura do noh
int altura_arvore(Noh *a)
{
  int alt_e,alt_d;
  // sem nohs
  if(a == NULL)
  {return 0;}

  //lado esquerdo 1
  if(a->esq == NULL)
  {alt_e =0; }
  else
  {alt_e = 1+ a->esq->altura;}

  // lado direito
  if(a->dir == NULL)
  {alt_d =0; }
  else
  {alt_d = 1 + a->dir->altura;}

  // compara para ver qual é maior
  if(alt_e > alt_d)
  return(alt_e);

  // lado direito
  return(alt_d);
}


// rotacao da arvore a direita
Noh *rotacao_direita(Noh *a)
{
  Noh *y;
  y = a->esq;
  a->esq = y->dir;
  y->dir =a;
  a->altura = altura_arvore(a);
  y->altura = altura_arvore(y);
  return(y);
}

// rotacao da arvore a esquerda
Noh *rotacao_esquerda(Noh *a)
{
   Noh *y;
   y = a->dir;
   a->dir = y->esq;
   y->esq = a;
   a->altura = altura_arvore(a);
   y->altura = altura_arvore(y);
   return(y);
}

/*-----funcoes de rotacao--------------*/

// rotacao dir - dir
Noh *rota_dir_dir(Noh *a)
{
  a = rotacao_esquerda(a);
  return(a);

}


// rotacao esq - esq
Noh *rota_esq_esq(Noh *a)
{
 a = rotacao_direita(a);
 return(a);
}


// rotacao esq - dir
Noh *rota_esq_dir(Noh *a)
{
  a->esq = rotacao_esquerda(a->esq);
  a = rotacao_direita(a);
  return(a);
}


// rotacao esq - dir
Noh *rota_dir_esq(Noh *a)
{
  a->dir = rotacao_direita(a->dir);
  a = rotacao_esquerda(a);
  return a;
}



// calcula o fator de balanceamento
int fator_balan(Noh *a)
{
  int alt_e,alt_d;

  if(a == NULL)
  {return 0; }

  // lado esq
  if(a->esq == NULL)
  {alt_e = 0; }
  else
  {alt_e = 1 + a->esq->altura; }

  // lado dir
  if(a->dir == NULL)
  {alt_d = 0; }
  else
  {alt_d = 1 + a->dir->altura; }

  // calcula a diferença
  return(alt_e - alt_d);
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


