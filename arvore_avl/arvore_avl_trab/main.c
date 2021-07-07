#include <stdio.h>
#include<stdlib.h>
#include<stdbool.h>

#include"arvore_avl.h"

// opcoes do menu
enum opcoes{INSERIR =1,APAGAR, MOSTRAR, SAIR};



int main(int argc, char *argv[])
{
  int  v;
  enum opcoes opcao;
  Noh *raiz_arvore =NULL;

  puts("Arvore AVL --> Arion");
  puts("Digite o valor para Raiz");
  scanf("%d",&v);

  // insere na raiz
  raiz_arvore = insere_noh(raiz_arvore,v);


  do
  {
     puts("<----------------------------------->");
     puts("\t 1: Inserir");
     puts("\t 2: Apaga");
     puts("\t 3: Mostrar arvore");
     puts("\t 4: Sair");
     puts("<----------------------------------->");
     printf("\r|<<:");
     scanf("%d",&opcao);
     putchar('\n');
/*-------------------------------*/
    if(opcao == INSERIR )
    {
       puts("Digite o valor");
       scanf("%d",&v);
       raiz_arvore = insere_noh(raiz_arvore,v);
       puts("valor inserido!!!");
    }
    else if(opcao == APAGAR)
    {
        puts("Digite o valor");
        scanf("%d",&v);
        raiz_arvore = apaga_noh(raiz_arvore,v);
        puts("valor apagado!!!");
    }
    else if(opcao == MOSTRAR)
    {
       mostra_arvore(raiz_arvore);
    }

    // limpa buffer teclado
    fflush(stdin);

  } while(opcao != SAIR);


  puts("saindo.....");

  libera_arvore(raiz_arvore);

  return EXIT_SUCCESS;
}
