#ifndef ARVORE_AVL_H
#define ARVORE_AVL_H

#include <stdio.h>
#include<stdlib.h>
#include<stdbool.h>

// estrutura da represnetação  arvore
typedef struct noh
{
    int dado, altura;
    struct noh *esq,*dir;
}Noh;



// funcoes de manipulacao da arvore
/*---------------------------------------------*/

// insere noh na arvore
Noh *insere_noh(Noh *a, int v);


// apaga noh na arvore
Noh *apaga_noh(Noh *a, int v);

// mostra a arvore
void mostra_arvore(Noh *a);

// altura do noh
int altura_arvore(Noh *a);

// rotacao da arvore a direita
Noh *rotacao_direita(Noh *);

// rotacao da arvore a esquerda
Noh *rotacao_esquerda(Noh *);

/*-----funcoes de rotacao--------------*/

// rotacao dir - dir
Noh *rota_dir_dir(Noh *);

// rotacao esq - esq
Noh *rota_esq_esq(Noh *);

// rotacao esq - dir
Noh *rota_esq_dir(Noh *);

// rotacao esq - dir
Noh *rota_dir_esq(Noh *);

// calcula o fator de balanceamento
int fator_balan(Noh *);

// libera arvore
void  libera_arvore(Noh*arv);

#endif // ARVORE_AVL_H
