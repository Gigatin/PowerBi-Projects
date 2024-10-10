# Dashboard de Vendas

**Este Projeto é baseado no terceiro capitulode Power Bi do Curso de Power Bi para Data science da Data Science Academy**

Este projeto consiste em um **dashboard de vendas** que inclui modelagem de dados, criação de relacionamentos e fórmulas DAX para realizar análises e cálculos relacionados ao desempenho de vendas de uma empresa. O dashboard foi construído com base em quatro arquivos principais:

- **Clientes**
- **Pedidos**
- **Produtos**
- **Vendas**

## Modelagem e Relacionamentos

A estrutura dos dados foi modelada da seguinte forma:

- **Clientes**: Um cliente pode efetuar várias vendas.
- **Produtos**: Um produto pode pertencer a várias ou nenhuma venda.
- **Pedidos**: Uma venda pode estar relacionada a vários ou nenhum pedido.
- **Vendas**: Cada venda está relacionada a um cliente, a um pedido e a um produto.

### Relacionamentos:

- **Vendas** (muitos) → **Clientes** (um)
- **Vendas** (muitos) → **Pedidos** (um)
- **Vendas** (muitos) → **Produtos** (um)

## Cálculos DAX

Para responder a algumas perguntas importantes, foram criadas as seguintes colunas calculadas:

- **Lucro**: Calculado como o valor da venda menos o custo de envio.
  
  ```DAX
  Lucro = Vendas[Valor Venda] - Vendas[Custo Envio]

- **Margem de Lucro**: Calculada como a razão entre o lucro e o valor da venda, multiplicado por 100 e arredondado para duas casas decimais.

```DAX
MargemLucro = ROUND(DIVIDE(Vendas[Lucro], Vendas[Valor Venda]) * 100, 2)
```
## Perguntas Respondidas pelo Dashboard

### 1. Qual foi o total de valor de vendas por modo de envio dos pedidos?

- **Classe Padrão**: R$ 7.556.448,21
- **Segunda Classe**: R$ 2.565.561,05
- **Primeira Classe**: R$ 1.843.147,32
- **Mesmo Dia**: R$ 677.305,33

### 2. Quais mercados tiveram o maior custo médio de envio dos produtos vendidos?

- **APAC**: R$ 29,14
- **EUA**: R$ 28,94
- **Europa**: R$ 27,84
- **LATAM**: R$ 26,46
- **África**: R$ 19,44
- **Canadá**: R$ 17,78
- **EMEA**: R$ 17,48

### 3. A empresa atingiu a meta de venda mensal de R$ 350 em abril de 2014?

- **Não**, o valor médio foi de R$ 229,62, abaixo da meta.

### 4. Qual categoria de produto apresentou o maior lucro médio?

- **Tecnologia**: R$ 417,85
- **Móveis**: R$ 371,70
- **Material de Escritório**: R$ 108,10

### 5. Qual foi o comportamento da margem de lucro ao longo do tempo?

O lucro se manteve estável ao longo dos anos:

- **2011**: 88,89%
- **2012**: 89,21%
- **2013**: 89,04%
- **2014**: 89,12%

Picos de lucro ocorreram em abril e outubro de 2011 e 2012, além de janeiro e fevereiro de 2013.

## Visualizações do Dashboard

O dashboard final inclui as seguintes visualizações:

- **Gráfico de Rosca**: Média de lucro por categoria de produto.
- **Mapa de Árvore (TreeMap)**: Média de custo de envio por mercado.
- **Gráfico de Cascata**: Total de valor de vendas por modo de envio.
- **Gráfico de Linhas**: Comportamento do lucro ao longo do tempo.
- **KPI**: Média de valor de venda.
- **Segmentação de Dados**: Filtro por anos e meses.

## Conclusão

O **Dashboard de Vendas** oferece uma visão detalhada do desempenho de vendas, lucros e custos ao longo do tempo, fornecendo informações valiosas para a tomada de decisões estratégicas.
