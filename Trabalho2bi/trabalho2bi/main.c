
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>


#define APRESENTACAO "Algoritimo Bellman-Ford\n Arion \n\t Trabalho Grafos 2\n\n"
#define FORMATO  "%d ; %d ; %d \n"
#define ARQUIVO "grafo.txt"
#define TAM_INI  1024
#define VERTICE_ORIGEM 0


//estrutura para armazenar as Linhas
typedef struct
{
  int origem, dest, peso;
}Linha;


/*um grafo é composto de linhas e vertices*/
typedef struct
{
 // array de Linhas dos vertices
  Linha *linhas;
  int n_vertices , n_linhas;
}Grafo;



/*
 funcao que le os dados do arquivo txt ,
 armazena na estrutura dinamica e retorna.
*/
Grafo *le_grafo(const char *caminho);


// funcao que implementa o algoritimo
void bellman_ford(Grafo *g, int ori);


int main(int argc, char *argv[])
{
  Grafo *grafo = NULL;
   int a = 25;



//----------------------------------------
  printf(APRESENTACAO);

  grafo = le_grafo(ARQUIVO);

  // verifica erro do arquivo
  if(grafo == NULL)
  {
    printf("Erro.... \n saindo do programa\n");
    return  EXIT_FAILURE;
  }

//-----------------------------
 bellman_ford(grafo,VERTICE_ORIGEM);


//-----------------------------

  // libera memoria alocada pela funcao do arquivo
  free(grafo->linhas);
  free(grafo);
  grafo = NULL;

  return EXIT_SUCCESS;
}


/*
 funcao que le os dados do arquivo txt ,
 armazena na estrutura dinamica e retorna.
*/
Grafo *le_grafo(const char *caminho)
{
  FILE *arq = NULL;
  Grafo *gf = NULL;
  unsigned int pos_arr =0, total_alocado =TAM_INI;

  // verifica abertura do arquivo
  arq = fopen(caminho,"r+");
  if(arq == NULL)
  {
    fprintf(stderr,"Erro ao tentar abrir o arquivo\n");
    return  NULL;
  }

  // aloca memoria para estrutura e array na estrutura
  gf = (Grafo*) malloc(sizeof(Grafo));

  // erro ao alocar memoria
  if(gf == NULL)
  {
    fprintf(stderr,"Erro ao tentar Alocar memoria \n");

    fclose(arq);
    arq = NULL;

    return  NULL;
  }

  //atribui os valores iniciais
   gf->n_linhas   = 0;
   gf->n_vertices = 0;


  // aloca memoria para array
  gf->linhas = NULL;
  gf->linhas = (Linha*) malloc(sizeof(Linha)* TAM_INI);

  //verifica se houve erro ao aloca memoria
  if(gf->linhas == NULL)
  {
    fprintf(stderr,"Erro ao tentar Alocar memoria \n");

    fclose(arq);
    arq = NULL;

    free(gf);
    return  NULL;
  }

  puts("Lendo dados no arquivo TXT  !...");

  // le os dados do arquivo e salva na memoria
  // mesma coisa que != NULL
  while(!feof(arq))
  {
   // le do arquivo no formato espesificado, salva no array
    fscanf(arq,FORMATO, &gf->linhas[pos_arr].origem,
                        &gf->linhas[pos_arr].dest,
                        &gf->linhas[pos_arr].peso);
    // dados lidos
    printf(FORMATO,gf->linhas[pos_arr].origem,
                   gf->linhas[pos_arr].dest,
                   gf->linhas[pos_arr].peso);

    // incrementa pos array
    pos_arr++;

    // verifica se precisa allocar mais memoria
    if(pos_arr >= total_alocado)
    {
      total_alocado *=2;
      gf->linhas = realloc(gf->linhas,sizeof(Linha) * total_alocado);
      puts("<-------Dados redimensionados----------|");
    }

  }



  // fecha o arquivo, pois ja acabou a leitura
  fclose(arq);
  arq = NULL;

// se foi allocado memoria extra que nao precisa, ajusta o array
  if(total_alocado > pos_arr)
  {
    gf->linhas = realloc(gf->linhas,sizeof(Linha) * pos_arr);
    puts("<_---_><_---_><_---_><_---_>");
  }

  gf->n_linhas = (int)pos_arr;
  gf->n_vertices = gf->n_linhas--;

  return  gf;
}


// funcao que implementa o algoritimo

void bellman_ford(Grafo *g, int ori)
{
  const int vertices = g->n_vertices;
  const int linhas = g->n_linhas;
  int distancia[vertices];

  int a =0, b=0;

  // incializa o vetor com infinito
  for (a = 0; a < vertices; a++)
  {
    distancia[a] = INT_MAX;
  }

  //posicao onde esta oque procura
  distancia[ori] =0;

  //variaiveis que controlaram os valores interos
  int lin =0, ver =0, peso_busca=0;

  for(a = 0; a <= vertices -1; a++)
  {
    for(b = 0; b < linhas; b++)
    {
      lin = g->linhas[b].origem;
      ver = g->linhas[b].dest;
      peso_busca = g->linhas[b].peso;

      //calcula a distancia , faz relachamento
      if(distancia[lin] +peso_busca  < distancia[ver])
      {
        distancia[ver]  = distancia[lin] + peso_busca;
      }
    }
  }

  // verifca os pontos negativos contem
  for(b = 0; b < linhas; b++)
  {
    lin = g->linhas[b].origem;
    ver = g->linhas[b].dest;
    peso_busca = g->linhas[b].peso;

      //calcula a distancia , faz relachamento
    if(distancia[lin] +peso_busca  < distancia[ver])
    {
      puts("O grafo contem vertices negativos");
    }
  }

  // imprime os dados
  puts("Distancia do vertices da origem");

  for (int a = 0; a < vertices; ++a)
  {
    printf("i-> %d \t ... dist-> %d \n",a,distancia[a]);
  }


}
