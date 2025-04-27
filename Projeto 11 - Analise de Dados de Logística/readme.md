
# Dashboard Análise Logística

Este projeto tem como objetivo corrigir e reformular um dashboard que apresentava informações erradas, focando na extração e apresentação correta dos dados.

## O que é a área de logística?

A área de logística gerencia o fluxo de produtos e informações desde a origem até o destino final, coordenando atividades como transporte, armazenamento, distribuição, embalagem e gestão de estoque. A logística é essencial para a eficiência operacional, a satisfação do cliente e a redução de custos. Uma logística bem executada garante a disponibilidade de mercadorias no tempo e lugar corretos, otimiza recursos e identifica melhorias no processo. Com a globalização, sua importância se tornou ainda maior. Um exemplo prático é uma loja virtual de roupas que depende de uma logística eficiente para garantir entregas no prazo e em boas condições, evitando prejuízos e melhorando a satisfação dos clientes.

## Principais KPIs da área de logística:

- Tempo de processamento: período necessário desde o pedido até a entrega ao cliente.
- Percentual de entregas no prazo: proporção de pedidos entregues dentro do tempo acordado.
- Despesa com transporte: valor médio gasto por produto ou pedido para transporte.
- Cobertura de estoque: quantidade de dias ou semanas que o estoque atual consegue suprir.
- Índice de devoluções: porcentagem de pedidos retornados pelos consumidores.
- Confiabilidade do inventário: grau de correspondência entre o estoque físico e o registrado.
- Ocupação de armazenamento: parte do espaço disponível que está efetivamente utilizada.
- Qualidade do atendimento logístico: avaliação da experiência do cliente em relação a prazos, condições do produto e suporte.
- Taxa de produtos danificados: porcentagem de itens avariados durante transporte ou estocagem.
- Retorno sobre investimento em logística (ROI): lucro obtido a partir dos investimentos realizados na área.

## Análise dos Problemas

O dashboard analisado apresentava diversos erros e problemas:

### Gráficos Avaliados

- **Total de Entregas no Prazo por Canal de Entregas (Erro)**: Gráfico de área com valores incorretos, mostrando 3 entregas para todos os canais.
- **Total de Entregas por Mês (Problema)**: Excesso de informação; em vez de apresentar por mês, exibe dados por ano, semestre e dia.
- **Percentual de Entregas por Equipe (Problema)**: Excesso de dados, obrigando o usuário a rolar para visualizar todas as equipes.
- **Total de Entregas de Produtos do Top 5 Vendedores (Erro)**: Gráfico de rosca poluído com muitos vendedores, sem restrição ao Top 5.
- **Total de Entregas com Atraso por Cidade (Problema)**: Gráfico de barras com excesso de informação e inclusão de entregas não atrasadas.
- **Percentual de Entregas por Status de Entrega (Problema)**: Informado apenas número absoluto, sem percentual.

## Análise Inicial/Exploratória dos Dados

- `ID_Pedido`: Código único de cada pedido.
- `ID_Vendedor`: Identificador do vendedor.
- `ID_Cliente`: Identificador do cliente.
- `Equipe_Entrega`: Nome da equipe de entrega (10 equipes distintas).
- `Cliente`: Nome ou código do cliente.
- `Canal_Entrega`: Canal de entrega (20 canais diferentes).
- `ID_Cidade`: Código da cidade da entrega (149 cidades).
- `Data_Pedido`: Data do pedido.
- `Data_Entrega_Prevista`: Data prevista da entrega.
- `Data_Entrega_Realizada`: Data efetiva da entrega.
- `Status_Entrega`: Status da entrega ("Antecipado", "No Prazo", "Atrasado").

## Solução dos Problemas

- **Organização da Fonte de Dados**:
  - Corrigido o caminho incorreto do arquivo de dados.

- **Total de Entregas no Prazo por Canal de Entrega**:
  - Eixo X: `Canal_Entrega`.
  - Eixo Y: Contagem de `ID_Pedido`.
  - Filtro aplicado para `Status_Entrega` no prazo.

- **Percentual de Entregas por Equipe**:
  - Mudança para gráfico de barras clusterizadas.
  - Eixo Y: `Equipe_Entrega`.
  - Exibição da porcentagem.

- **Total de Entregas por Mês**:
  - Criação de medida `TotalEntrega = Countrows(Logistica)`.
  - Gráfico de linhas, eixo X somente com o mês.

- **Total de Entregas de Produtos do Top 5 Vendedores**:
  - Troca para tabela.
  - Uso de `ID_Vendedor` na legenda e filtro para top 5 por Total Entregas.
  - Criação de medida rápida com estrelas de classificação.

- **Total de Entregas com Atraso por Cidade**:
  - Troca para tabela.
  - Filtro de `Status_Entrega` para somente atrasados.

- **Percentual de Entregas por Status de Entrega**:
  - Mantido o gráfico de barras.
  - Exibição dos números como percentual.

## Criação de Novos Cartões

- **Total Entregas no Prazo**:

```DAX
TotalEntregaPrazo = CALCULATE([TotalEntregas], FILTER(Logistica, Logistica[Status_Entrega] = "Antecipado" || Logistica[Status_Entrega] = "No Prazo"))
```

## Observações do Dashboard

- Total de 54.000 entregas, sendo 47.023 realizadas no prazo, resultando em um índice de entregas dentro do prazo de aproximadamente **87%**.
- Principais canais de entrega no prazo: 07, 19, 11, 08 e 05, com destaque para o Canal 07 que concentrou o maior volume.
- Equipes com melhor desempenho: Norte ,Sudeste , Nordeste, Sul e Internet.
- O ano de 2019 apresentou maior volume de entregas em comparação com 2020, indicando um possível impacto de fatores externos, como crises ou sazonalidades.
- O número de entregas atrasadas foi de 6.977, correspondendo a **13%** do total de entregas.
- Cidades com maior incidência de atrasos: destaque para grandes centros urbanos onde o volume e a complexidade logística são maiores.

## Insights Adicionais

- **Impacto dos Canais de Entrega**: Canais com maior número de entregas no prazo tendem a ser mais estruturados ou estratégicos para a operação. Foco em expandir a eficiência nos canais com pior desempenho pode gerar ganhos de performance.

- **Atuação por Equipe**: As regiões Norte e Sudeste se destacam em volume, mas precisam ser avaliadas também quanto ao percentual de atrasos internos para ajustes na alocação de recursos.

- **Volume de Atrasos**: Embora o percentual de atraso esteja em um patamar aceitável (<15%), é importante identificar causas específicas — como logística de última milha, problemas de estoque ou transporte — para redução contínua.

- **Ano de 2020**: A queda nas entregas pode indicar necessidade de planejamento mais robusto em momentos de crise, seja na diversificação de canais ou otimização dos processos de estoque e distribuição.

- **Atenção às Cidades**: Concentrar ações de melhoria nas cidades com maiores índices de atraso pode trazer impacto relevante na satisfação do cliente.

- **Sugestão de Novos KPIs**: Além dos KPIs tradicionais, sugerimos incluir o "Lead Time Médio de Entrega" (diferença média entre data do pedido e entrega) e a "Satisfação do Cliente Pós-Entrega" para medir a percepção final do serviço.

---

Essa análise proporciona uma visão mais estratégica para tomada de decisão, baseada em dados sólidos e na identificação de pontos críticos que impactam diretamente a eficiência logística.
