#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>

#include"arvore_b.h"


int main()
{
    int valor = 0, menu =0, raiz =0;
    bool laco = true;

    Arvore *arvore = NULL;

    // cria arvore
    arvore = cria_arvore();

    printf("Digite a  o valor da raiz\n\n<<");
    scanf("%d",&valor);
    fflush(stdin);

    // salva valor pra raiz
    raiz = valor;

    valor = 0;
    while(laco != false)
    {

        printf("Menu de Opcoes da Arvore\n\n<<");
        puts("\t   1  : inserir noh");
        puts("\t   2  : remover noh noh");
        puts("\t   3   : sair");

        scanf("%d",&menu);
        fflush(stdin);

        // logica do menu
        // insere o noh
        if(menu == 1)
        {
            printf("\n\nDigite o valor do noh\n<<");
            scanf("%d",&valor);
            arvore->raiz = insere_arvore(arvore->raiz,valor);
             puts("------------------------");
            printf("Valor inserido\n");
        }
        // remove o noh se existir
        else if (menu == 2)
        {
            printf("\n\nDigite o valor do noh\n<<");
            scanf("%d",&valor);
            arvore->raiz = retirar_arvore(arvore->raiz,valor);
             puts("------------------------");
            printf("Noh removido\n");
        }
        // sai do laco
        else
        {    laco = false;  }

        fflush(stdin);
    }

    // libera memoria alocada
    libera_arvore(arvore->raiz, raiz);
    free(arvore);
    arvore = NULL;

  return EXIT_SUCCESS;
}
