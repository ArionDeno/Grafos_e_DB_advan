#ifndef ARVORE_B_H
#define ARVORE_B_H
/*
Os que cometem erros se culpam
e fecham  o coração.

É impossivel consertar o erro
Os homens não podem voltar ao passado,
por isso, eles bebem,
largados, bebados , derrotados
mandam alchol garganta a baixo,  para tentar diluir as lembranças que não podem ser evitadas
e ai se pergunta ao copo vazio: "estou errado?"
*/

#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>


//implementação da arvore binaria, usando numeros

// definição de noh
typedef  struct noh
{
  int dado;
  struct noh *esq, *dir;
}Noh;

// estrutura de arvore que conterá a raiz
typedef  struct
{
   Noh *raiz;
}Arvore;
//--------------------------------------------------------------


//------------------demais definições--------------------------------------------------------
// função  para imprimir  a arvore
 void  imprime_arvore(Arvore *arv);

// funçao de busca  o dado
  Arvore*  busca_arvore(Arvore *arv, int v);

// funcao de inicializacao da arvore
Arvore *cria_arvore(void);


// funcao de insersao na arvore
// cria um novo noh
 Noh * insere_arvore(Noh *arv, int v);

// funcao remove um noh da arvore, pelo valor
 Noh * retirar_arvore( Noh *arv, int v);


// libera arvore
void  libera_arvore(Noh*arv, int);








#endif // ARVORE_B_H
