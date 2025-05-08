# 📈 Análise do Mercado de Ações com Dados da NASDAQ (2024-2025)

## 1. Visão Geral
O mercado de ações é um ambiente onde empresas oferecem partes de sua estrutura (ações) para investidores. Ao adquirir esses papéis, o investidor torna-se sócio parcial e pode receber lucros, os chamados dividendos.  
O valor das ações oscila conforme fatores como o desempenho financeiro da empresa, condições econômicas, setor de atuação e decisões políticas.  
As negociações são realizadas por meio de corretoras ou plataformas digitais. Esse mercado é amplamente utilizado como ferramenta de investimento e também como um importante indicador da saúde econômica de um país.

## 2. Sobre a NASDAQ
A **NASDAQ (National Association of Securities Dealers Automated Quotations)** é uma das maiores bolsas de valores do mundo, fundada em 1971, e está atrás apenas da NYSE em capitalização de mercado.

### Características principais:
- Opera 100% de forma eletrônica, sendo pioneira em digitalização do mercado financeiro.
- Famosa por listar empresas de tecnologia e inovação, como:
  - Apple, Microsoft, Amazon, IBM, Meta (Facebook) e Alphabet (Google).
- Também inclui empresas dos setores de saúde, energia, finanças, entre outros.

### Serviços oferecidos:
- Listagem oficial de empresas.
- Compensação e liquidação de operações.
- Fornecimento de dados de mercado em tempo real.
- **Acesso gratuito aos dados pelo portal:**  
🔗 [https://www.nasdaq.com](https://www.nasdaq.com/)

## 3. Estrutura dos Dados da NASDAQ
O conjunto de dados utilizado neste projeto inclui as seguintes colunas:

- `Date`: Data em que a ação foi negociada.
- `Close/Last`: Último valor registrado da ação no dia.
- `Volume`: Quantidade total de ações negociadas.
- `Open`: Primeiro preço registrado no início do pregão.
- `High`: Maior valor atingido pela ação no dia.
- `Low`: Menor valor registrado no mesmo período.

## 4. Principais KPIs (Indicadores-Chave de Desempenho)

1. **Variação Diária (%)**  
   Indica a diferença percentual entre os preços de abertura e fechamento.

2. **Volume de Negociação**  
   Representa a liquidez da ação.

3. **Volatilidade Intradiária**  
   Diferença entre os valores máximos e mínimos da ação ao longo do dia.

4. **Tendência de Fechamento**  
   Análise do comportamento dos preços de fechamento ao longo de um período.

5. **Média Móvel**  
   Utilizada para identificar tendências suavizando as flutuações diárias (ex: média dos últimos 5 dias).

## 5. Descrição das Colunas

- **Data (`Date`)**: Dia exato da transação.
- **Fechamento (`Close/Last`)**: Valor final da ação ao término do pregão.
- **Volume**: Total de ações trocadas no mercado durante o dia.
- **Abertura (`Open`)**: Primeiro valor da ação no início da sessão.
- **Máximo (`High`)**: Preço mais alto do dia.
- **Mínimo (`Low`)**: Preço mais baixo do dia.

---

## 6. Perguntas-Chave para o Dashboard

### 1. Evolução do Volume Negociado
Qual foi o volume total de ações negociadas, ao longo do tempo, para cada uma das 6 empresas analisadas?

**Volume Total de Ações Negociadas (2024-2025):**
- Amazon: 41.705.483,92  
- Apple: 56.296.125,96  
- Google: 28.190.125,32  
- IBM: 4.211.821,76  
- Meta: 14.476.751,84  
- Microsoft: 21.398.441,60  

### 2. Médias Mensais dos Preços das Ações
Qual é o valor médio mensal de abertura (Open), preço mais alto (High), mais baixo (Low) e de fechamento (Close) para as ações de cada empresa?

| Empresa   | Open   | Low    | High   | Close  |
|-----------|--------|--------|--------|--------|
| Amazon    | 196,77 | 194,21 | 199,05 | 196,80 |
| Apple     | 222,04 | 219,78 | 224,69 | 222,44 |
| IBM       | 214,11 | 211,95 | 216,40 | 214,53 |
| Meta      | 562,62 | 554,37 | 570,30 | 562,60 |
| Microsoft | 418,35 | 414,38 | 422,19 | 418,54 |
| Google    | 172,84 | 170,95 | 174,80 | 172,86 |

### 3. Variação Mensal do Preço de Fechamento
Como variou, mês a mês, a média do preço de fechamento (Close) das ações de todas as empresas?

#### 📦 Amazon (AMZN)
- Crescimento moderado no 2º semestre.
- **Maior alta**: Dezembro (+9,58%)
- **Maior queda**: Março (-12,11%)

#### 🍏 Apple (AAPL)
- Estável, com leve queda no fim do ano.
- **Maior alta**: Junho (+8,30%)
- **Maior queda**: Agosto (-1,32%)

#### 🔍 Google / Alphabet (GOOGL)
- Oscilação constante.
- **Maior alta**: Maio (+11,04%)
- **Maior queda**: Agosto (-9,42%)

#### 🖥️ IBM
- Recuperação gradual.
- **Maior alta**: Fevereiro (+14,19%)
- **Maior queda**: Maio (-24,37%)

#### 📘 Meta (META)
- Crescimento inicial, queda acentuada depois.
- **Maior alta**: Fevereiro (+10,70%)
- **Maior queda**: Março (-12,88%)

#### 💻 Microsoft (MSFT)
- Crescimento consistente.
- **Maior alta**: Maio (+11,56%)
- **Menor variação**: Outubro-Novembro (estável)

---

## 7. Construção do Dashboard

### 🔹 Coleta e Preparação dos Dados
1. **Download**: Dados históricos de 07/05/2024 a 07/05/2025 via [NASDAQ.com](https://www.nasdaq.com).
2. **Tratamento Inicial**:
   - Adicionar coluna “Empresa”.
   - Remover símbolo `$` dos preços.
   - Ajustar formato de data (de MM/DD/AAAA para DD/MM/AAAA).

### 📊 Gráficos e Visualizações

#### 1. Volume de Ações Negociadas ao Longo do Tempo
- **Tipo**: Gráfico de área
- **Eixos**:
  - X: Data
  - Y: Soma do Volume

#### 2. Variação da Média de Fechamento Mês a Mês (MoM%)
- **Tipo**: Gráfico de área
- **Eixos**:
  - X: Mês
  - Y: Média do Preço de Fechamento
  - Legenda: Empresa

##### Fórmula DAX:
```DAX
Média de Close/Last MoM% = 
IF(
    ISFILTERED('Data'[Date]),
    ERROR("Medidas rápidas de inteligência de tempo somente podem ser agrupadas ou filtradas pela hierarquia de data fornecida pelo Power BI ou pela coluna de data primária."),
    VAR __PREV_MONTH =
        CALCULATE(
            AVERAGE('Data'[Close/Last]),
            DATEADD('Data'[Date].[Date], -1, MONTH)
        )
    RETURN
        DIVIDE(AVERAGE('Data'[Close/Last]) - __PREV_MONTH, __PREV_MONTH)
)
```

#### 3. Tabela Resumo de Indicadores
Colunas:
Ano, Mês
Médias de: Open, Close, High, Low, Volume

Análise Automatizada
Narrativa Inteligente: Recurso do Power BI para interpretação automática dos dados.

Filtros Interativos
Ano e Mês: Filtragem temporal
Empresa: Seleção individual por companhia

