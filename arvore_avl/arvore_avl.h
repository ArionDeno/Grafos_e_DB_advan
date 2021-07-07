#ifndef ARVORE_AVL_H
#define ARVORE_AVL_H


#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>


/*arvore avl  definicao estrutura*/

typedef  struct  noh
{
  struct noh *esq, *dir;
  int dado,altura;
} Noh;


/*fucoes arvore avl*/

//cria nova arvore
Noh *cria_arvore(int raiz);

// mostra os dados
void mostra_arvore_avl(Noh *a);

/*insere um novo noh*/
Noh *insere_noh(int d, Noh *a);

/*insere um novo noh*/
Noh *remove_noh(int d, Noh *a);

//libera memoria da arvore
void libera_arvore(Noh *a);

//---------------------------------------
/*calcula o fator de balanceamento*/
int fator_balan(int e, int d);

/*rotacao simples esquerda*/
Noh *rotacao_esq_esq(Noh *a);


/*rotacao simples direita*/
Noh *rotacao_dir_dir(Noh *a);


/*rotacao simples esquerda*/
Noh *rotacao_esq_dir(Noh *a);


/*rotacao simples direita*/
Noh *rotacao_dir_esq(Noh *a);



#endif // ARVORE_AVL_H
