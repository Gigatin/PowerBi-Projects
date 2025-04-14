# 📊 Dashboard Comercial — Análise de Performance de Vendas

## 💡 Descrição

Este projeto tem como objetivo disponibilizar um **Dashboard Comercial** eficiente para análise da performance de vendas, organizado de forma clara e intuitiva.  
O dashboard foi construído com foco em facilitar insights para tomada de decisão estratégica.

---

## 🗂️ Estrutura do Dashboard

O dashboard é composto por **5 páginas**, respeitando a regra de até **4 gráficos por página**, garantindo clareza e facilidade de leitura.

---

## ⚙️ 1. Carregamento de Dados

Os dados foram extraídos de uma planilha com as seguintes colunas:

| Coluna              | Descrição                   |
|---------------------|-----------------------------|
| `Cidade`            | Cidade da venda            |
| `Estado`            | Estado da venda            |
| `Vendedor`          | Nome do vendedor           |
| `Id-Vendedor`       | Identificador do vendedor  |
| `Comissão (%)`      | Percentual de comissão     |
| `Data Venda`        | Data da venda              |
| `ValorVenda`        | Valor da venda             |
| `Custo`             | Custo do produto           |

> 🔎 **Observação:** Durante a verificação no Power Query, não foram encontrados problemas de tipagem ou inconsistências nos dados.

---

## 🔍 2. Exploração de Dados

Durante a exploração dos dados, foram observados os seguintes pontos:

- O **Segmento** é dividido em três valores: `Corporativo`, `Doméstico` e `Industrial`.
- A **Comissão** é representada em percentual (`%`).
- Possibilidade de **especialização dos vendedores** por segmento foi levantada como hipótese.

---

## 📈 3. Definição dos Relatórios

Cada relatório foi estruturado para conter de **1 a 4 gráficos**, com foco em clareza e narrativa visual.

---

### 🧭 Primeira Página: Índice

Página de navegação com **botões de acesso rápido** para:

- Índice
- Narrativa Inteligente
- Principais Influenciadores de Vendas
- Faixas de Vendas por Categorias e Pontos de Venda
- Performance dos Vendedores por Região

---

### 💡 Segunda Página: Narrativa Inteligente

**Objetivo:** Apresentar uma visão geral rápida e clara da performance.

#### Gráfico 1 — Total de Vendas por Segmento

- Tipo: Gráfico de Pizza
- Insights:
  - Doméstico: **71,47%** do total
  - Corporativo: **25,03%** do total
  - Industrial: **3,49%** do total

---

#### Gráfico 2 — Total de Vendas por Fabricante

- Tipo: Gráfico de Barras (ideal para comparações com +10 fabricantes).
- Top 5 fabricantes:
  1. Brastemp — R$ 93.000
  2. Samsung — R$ 83.000
  3. Consul — R$ 59.000
  4. Motorola — R$ 35.000
  5. HP — R$ 18.000

> Menor valor: Electrolux — R$ 7.000.

---

#### Gráfico 3 — Total de Vendas por Categoria

- Tipo: Gráfico de Funil
- Insights:
  - Eletrodomésticos: R$ 193.320
  - Celulares: R$ 96.600
  - Eletrônicos: R$ 48.330
  - Eletroportáteis: R$ 19.060

---

#### Gráfico 4 — Narrativa Inteligente

- Ferramenta de resumo dinâmico que adapta a narrativa conforme filtros aplicados.
- Facilita insights e economiza tempo de análise.

---

### 🔥 Terceira Página: Principais Influenciadores

**Objetivo:** Identificar variáveis que impactam diretamente as vendas.

- Tipo: Gráfico de Principais Influenciadores.
- Correlações analisadas: `ValorVenda x Segmento` e `Categoria`.

**Principais descobertas:**

- O **Segmento Corporativo** tende a elevar o valor médio das vendas.
- A **Categoria Celulares** também está positivamente associada a maiores vendas.
- Por outro lado, o **Segmento Doméstico** e **Eletroportáteis** indicam menor retorno.

> 💡 **Recomendação:** Redirecionar esforços comerciais para segmentos e categorias de maior retorno.

---

### 🏪 Quarta Página: Faixas de Vendas por Categorias e Pontos de Venda

**Objetivo:** Avaliar a distribuição de vendas por loja e por categoria.

- Tipo: Gráfico de Faixas
- Eixo: `Categoria` x `ValorVenda`
- Legenda: Lojas

**Análise das 3 lojas com maior volume de vendas:**

| Loja      | Eletrodomésticos | Celulares  | Eletrônicos | Eletroportáteis |
|-----------|------------------|------------|-------------|-----------------|
| SP8822    | R$ 40.542,44     | R$ 36.912  | R$ 7.077    | R$ 1.102        |
| R1295     | R$ 34.418,90     | R$ 4.590   | R$ 5.990    | R$ 3.907        |
| R1296     | R$ 27.540,77     | R$ 17.220  | R$ 4.827,89 | R$ 1.255        |

> 🔍 **Conclusão:** Lojas como SP8822 são fortes em Eletrodomésticos e Celulares, mas fracas em Eletrônicos e Eletroportáteis. Possível oportunidade de readequação de mix.

---

### 🌍 Quinta Página: Performance dos Vendedores por Região

**Objetivo:** Mapear geograficamente a performance por vendedor.

- Tipo: Gráfico de Mapa
- Correlação: `Estado x Vendedor`
- Tamanho da bolha: Total de `ValorVenda`.

**Destaques regionais:**

- **São Paulo**
  - André Pereira — R$ 39.183,89
  - Artur Moreira — R$ 36.465,67
  - Josias Silva — R$ 35.171,27

- **Rio de Janeiro**
  - André Pereira — R$ 35.419

> 💡 **Insight:** André Pereira se destaca em múltiplas regiões, sugerindo eficiência no relacionamento com clientes e estratégias comerciais.

---

## 🏆 Conclusão

Este dashboard entrega uma visão clara e organizada sobre:

- **Quem** vende mais
- **O que** é mais vendido
- **Onde** as vendas são concentradas
- **Quais** fatores impactam nas vendas.





