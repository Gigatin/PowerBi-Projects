# Dashboard de Recursos Humanos

Projeto de análise de dados da área de Recursos Humanos (RH), focado na criação de um Dashboard no Power BI para acompanhamento de KPIs estratégicos.

---

## 1. Visão da Área Analisada

A área de Recursos Humanos (RH) é responsável por gerenciar e administrar as atividades relacionadas aos colaboradores de uma empresa, promovendo seu desenvolvimento, satisfação e, consequentemente, contribuindo para o sucesso organizacional.

Responsabilidades comuns do RH:
- Gestão de pessoas.
- Recrutamento e seleção.
- Capacitação e desenvolvimento.
- Administração de salários e benefícios.
- Mediação de conflitos.
- Promoção de políticas de igualdade e inclusão.
- Avaliação de desempenho e definição de metas.

---

## 2. KPIs Analisados

Indicadores de desempenho utilizados para avaliar a eficiência do setor:
- **Índice de saída de colaboradores**
- **Grau de satisfação interna**
- **Tempo médio de contratação**
- **Investimento por nova contratação**
- **Adesão a treinamentos**
- **Resultados de avaliação de desempenho**
- **Absenteísmo**
- **Engajamento dos funcionários**

---

## 3. Perguntas Respondidas pelo Dashboard

1. Total de funcionários atualmente na empresa?
2. Tempo médio de experiência dos funcionários (em anos)?
3. Total e percentual de funcionários por gênero?
4. Média salarial mensal dos funcionários?
5. Total de funcionários por função/cargo?
6. Percentual de funcionários disponíveis para hora extra?
7. Nível de envolvimento dos funcionários no trabalho?
8. (Adicional) Total e percentual de funcionários que devem receber promoção (não exibido no Dashboard)?

---

## 4. Etapas do Projeto

1. Realização da carga de dados.
2. Checagem da necessidade de transformação dos dados via PowerQuery (não foram necessárias alterações).
3. Criação de uma Tabela de Medidas para melhor organização e performance.
4. Criação de coluna condicional para indicação de funcionários aptos à promoção.
5. Otimização da performance por meio da criação de medidas DAX.
6. Desenvolvimento de medidas principais:
    - `TotalFunc = COUNTROWS(DatasetRH)`
    - `TotalFeminino = CALCULATE([TotalFunc], DatasetRH[Genero] = "Feminino")`
    - `TotalMasculino = CALCULATE([TotalFunc], DatasetRH[Genero] = "Masculino")`
    - `%Masculino = DIVIDE([TotalMasculino], [TotalFunc], 0)`
    - `%Feminino = DIVIDE([TotalFeminino], [TotalFunc], 0)`
    - `SalarioMedio = AVERAGE(DatasetRH[Salario_Mensal])`
    - `TotalFuncPromover = CALCULATE([TotalFunc], DatasetRH[StatusPromo] = "Considerar Promoção")`
    - `%Promover = DIVIDE([TotalFuncPromover], [TotalFunc], 0)`
    - `%NaoPromover = DIVIDE([TotalFuncNaoPromover], [TotalFunc], 0)`

7. Criação de gráficos para visualização dos dados:
    - **Total de Funcionários por Função**: Gráfico de barras horizontal.
    - **Nível de Envolvimento no Trabalho**: Gráfico de rosca.
    - **Funcionários Disponíveis para Hora Extra**: Gráfico de pizza.

---

## 5. Observações e Resultados

- **Total de Funcionários**: 1400 colaboradores.
  - 838 masculinos (59,86%)
  - 562 femininos (40,14%)
- **Salário Médio**: R$ 6.930,00
- **Tempo Médio de Experiência**: 11,29 anos
- **Funções com mais funcionários**:
  - Cientista de Dados: 638
  - Analista de Dados: 246
  - Engenheiro de IA: 176
  - Arquiteto de Dados: 139
  - Engenheiro de Dados: 125
  - Engenheiro Analítico: 76
- **Nível de Envolvimento dos Funcionários**:
  - Alto: 139 (9,39%)
  - Médio: 826 (59%)
  - Baixo: 356 (25,43%)
  - Ruim: 79 (5,64%)
- **Funcionários Disponíveis para Hora Extra**: 28,43%

> **Insights**:  
> A maioria dos funcionários apresenta envolvimento de nível médio, indicando uma oportunidade de atuação com programas de incentivo e desenvolvimento para elevar este engajamento para níveis altos.

---

## 📊 Tecnologias Utilizadas

- **Power BI**
- **DAX (Data Analysis Expressions)**
- **Power Query (mínima intervenção)**

---

## 📋 Considerações Finais

Este projeto apresenta uma abordagem estruturada de análise de dados de Recursos Humanos, com foco na construção de KPIs relevantes para tomada de decisão estratégica, visando o crescimento organizacional através da valorização de seus colaboradores.
