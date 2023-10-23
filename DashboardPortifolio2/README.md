# Dashboard de Análise de Popularidade no Twitter

## Visão Geral

Este dashboard tem como objetivo demonstrar a popularidade dos candidatos em uma rede social, especificamente no Twitter. As informações apresentadas neste dashboard são resultado de um processo de coleta e análise de dados realizado com o auxílio de ferramentas como Python, Excel e Power Bi.

## Processo de Coleta, tratamento e Análise

- **Coleta de Dados**: Para obter as informações necessárias, foi realizada a coleta de textos do Twitter de forma semanal. A palavra-chave de pesquisa utilizada foi o nome do candidato, e o limite de textos coletados foi de 100.000, embora esse número possa variar. A coleta iniciava do texto mais atual para o mais antigo.

- **Tratamento de Dados**: Para o tratar utilizei algumas tecnicas, como remoção de StopWords( o, a, de, uma, um, etc), lematização com foco em transformar as palavras em suas raizes facilitando a analise de emoções, vetorização das palavras (tira elas de um contexto e as individualiza, permitindo serem analisadas com valores separados) e remoção de espaço desencessario, tudo foi realizado com scripts no Python.

- **Ferramenta de Coleta**: A coleta de dados foi inicialmente realizada com o uso do `snscrape`. No entanto, é importante observar que, a partir de 2023, essa ferramenta foi bloqueada devido a mudanças nas políticas da rede social.

- **Análise de Sentimentos**: Para a análise de sentimentos, foram utilizadas as seguintes bibliotecas:
  - **NLTK**
  - **TextBlob**
  - **ScriptLearn**
  
  É relevante mencionar que o NLTK e o TextBlob forneciam resultados mais "confiáveis" após a tradução. Já o ScriptLearn realizava análises com base em um conjunto de dados que utilizei para o treinar (no caso, o "imdb-traduzido").

## Estrutura do Dashboard

O dashboard foi dividido em duas páginas:

### Página 1 - Visão Geral

Nesta página, estão disponíveis os seguintes filtros:

- "Tipo de Análise": Permite selecionar as tecnologias de análise utilizadas e exibe as informações individualmente quando selecionadas.
- "Sentimento": Oferece três opções (negativo, neutro e positivo) que revelam os dados de cada sentimento individualmente quando selecionados.
- "Candidatos": Apresenta imagens dos 4 principais candidatos durante a eleição e exibe as informações de cada candidato quando selecionados.
- "Data": Filtro de linha que permite selecionar os períodos dos dados.

Informações mostradas nesta página incluem:

- Quantidade de dados por Candidato (usando um gráfico de rosca).
- Quantidade de dados por Sentimento (usando um gráfico de pizza) com considerações sobre a confiabilidade dos analisadores na língua portuguesa.
- Quantidade de dados por Data e Presidente (usando um gráfico de área ampliada).
- Quantidade de dados por Sentimento e Tipo de Análise.
- Contagem de dados por Sentimento e Presidente.
- Um card com o total de dados na base.
- Uma lista demonstrando quantos dados foram coletados para cada candidato até o final das eleições.

### Página 2 - Segundo Turno

Nesta página, estão disponíveis os mesmos filtros da página anterior, adicionando um filtro para diferenciar entre o primeiro e o segundo turno.

Novas visualizações incluem:

- Gráfico de linhas que demonstra a quantidade de dados por análise, turno e sentimento, evidenciando a diferença de dados para cada candidato nessas condições.
- Gráfico de colunas empilhadas para mostrar a igualdade de dados gerados por esses candidatos.

## Contato

Se você tiver alguma dúvida ou desejar mais informações sobre este projeto, sinta-se à vontade para entrar em contato.

- Email: gabrielcaetano41@hotmail.com
- LinkedIn: https://www.linkedin.com/in/gabriel-caetano-silva-motta-32181717b/
