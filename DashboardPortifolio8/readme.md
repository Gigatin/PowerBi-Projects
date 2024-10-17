# Dashboard de Marketing

Este projeto foi desenvolvido para fornecer insights detalhados sobre o comportamento dos clientes e o desempenho das campanhas de marketing. O dashboard é dividido em várias páginas para facilitar a compreensão, e oferece uma análise visual e estratégica que auxilia na tomada de decisões baseadas em dados.

## Estrutura do Dashboard

Para garantir uma navegação eficiente e que os dados sejam facilmente absorvidos, cada página foca em um tema específico, com explicações e análises para os gráficos apresentados. A seguir, detalhamos o conteúdo de cada página.

---

### **Página 1 - Descobrindo o Perfil dos Clientes**

Nesta página, buscamos entender quem são os clientes da empresa, como se comportam e qual o perfil deles em termos de escolaridade, estado civil e compras realizadas.

- **Total de clientes**: 1.999  
  - O número total de clientes que realizaram transações no período analisado. Esse dado é importante para avaliar a base de clientes da empresa.

- **Média salarial anual**: R$ 51,98 mil  
  - A média salarial dos clientes ajuda a entender o poder de compra de seu público-alvo, fornecendo insights sobre como posicionar produtos e campanhas de marketing.

- **Compras por canal**: 
  - Loja Física: 12.000
  - Web: 8.147  
  - Esse dado destaca a importância dos diferentes canais de vendas. A loja física lidera, mas o canal online também tem um volume considerável, o que indica que estratégias multicanal podem ser eficazes.

- **Compras com descontos**: 4.661  
  - Mostra o número de clientes que aproveitaram descontos. Isso pode revelar a sensibilidade do público ao preço e a eficácia de campanhas promocionais.

- **Compras via catálogo**: 5.270  
  - Indica que o catálogo ainda é um canal relevante de vendas, mesmo com o aumento do comércio eletrônico.

**Perfil dos Clientes**:
- **Escolaridade**:  
  - Superior: 999
  - Doutorado: 437
  - Mestrado: 337
  - Segundo grau: 177
  - Primeiro grau: 49  
  - Esse dado ajuda a segmentar a audiência com base na escolaridade, permitindo a personalização das campanhas de marketing de acordo com o nível educacional.

- **Estado civil**:  
  - Solteiro: 1.197
  - Casado: 522
  - Divorciado: 280  
  - O estado civil pode influenciar os hábitos de compra. Por exemplo, solteiros podem ter mais flexibilidade financeira para compras de impulso, enquanto casados podem ter decisões mais ponderadas.

**Segmentação por País**:  
- A segmentação por país permite entender como o comportamento dos clientes pode variar em diferentes regiões, possibilitando campanhas de marketing localizadas e personalizadas.

---

### **Página 2 - Visão do Comportamento dos Clientes**

Nesta página, exploramos como o comportamento de gastos dos clientes está relacionado a suas condições financeiras e familiares.

- **Gráfico de dispersão - Salário anual vs. Gasto com alimentos**:  
  - Um outlier foi identificado, e sua remoção melhorou a análise. A conclusão é que, geralmente, quanto maior o salário, maior o gasto com alimentos, o que faz sentido dado o aumento da renda disponível.

- **TotalGasto (Total de Gasto)**:
  - Função DAX utilizada para calcular o gasto total nas diferentes categorias de produtos (Alimentos, Brinquedos, Eletrônicos, Móveis, Utilidades, Vestuário). A fórmula foi:
  ```dax
  TotalGasto = SUMX(DadosMarketing, DadosMarketing[Gasto com Alimentos] + DadosMarketing[Gasto com Brinquedos] + DadosMarketing[Gasto com Eletrônicos] + DadosMarketing[Gasto com Móveis] + DadosMarketing[Gasto com Utilidades] + DadosMarketing[Gasto com Vestuário])
  ```

  Esse cálculo permite analisar o comportamento de consumo de forma agregada, mostrando como os clientes distribuem seus gastos entre as diferentes categorias.

#### **Correlação entre gasto total e número de filhos/adolescentes em casa**:

Observou-se que quanto menos filhos ou adolescentes em casa, maior o total gasto. Isso sugere que, com menos dependentes, os clientes têm mais renda disponível para gastar em produtos não essenciais.

- **0 filhos**: R$ 1.033.114
- **0 adolescentes**: R$ 713.736
- **1 filho**: R$ 165.711
- **1 adolescente**: R$ 468.749
- **2 filhos**: R$ 5.948
- **2 adolescentes**: R$ 22.324

---

### **Página 3 - Visão da Performance das Campanhas de Marketing**

Nesta página, avaliamos a eficácia das campanhas de marketing e como elas impactaram as vendas.

#### **Relação entre quem comprou e quem não comprou**:

- **84%** dos clientes não compraram durante as campanhas de marketing, enquanto **16%** realizaram compras. Este dado sugere que há espaço para melhorar a taxa de conversão das campanhas.

#### **Média salarial dos clientes que compraram vs. não compraram**:

- Os clientes que compraram têm uma média salarial de R$ 59.500, enquanto os que não compraram têm uma média de R$ 50.538. Isso indica que campanhas de marketing podem ser mais eficazes para clientes com maior poder aquisitivo.

#### **Efeito do website nas vendas durante as campanhas**:

- Foi criada uma matriz que cruza o número de vendas com o país e a escolaridade dos clientes. Essa análise ajuda a entender se o marketing digital foi eficaz em determinadas regiões e públicos-alvo.

#### **Influência de filhos no resultado das campanhas de marketing**:

- A presença de filhos em casa parece influenciar o comportamento de compra durante as campanhas. Substituímos os valores da coluna "comprou" (0 = não, 1 = sim) para analisar melhor esse impacto.

---

### **Página 4 - Visão dos Pontos de Venda**

Esta página examina como diferentes países e categorias de produtos influenciam o desempenho das vendas.

#### **Gastos por categoria e país**:

- **Estados Unidos** têm o maior gasto médio, com destaque para as categorias de **Eletrônicos** e **Móveis**. Este dado ajuda a identificar mercados-chave para expansão e categorias de produto com maior retorno.

#### **Total de Gasto por Ano e País**:

- Entre 2019 e 2020, houve um aumento nas vendas devido ao impacto da COVID-19, que impulsionou o comércio online. Após uma queda em 2021, as vendas voltaram a crescer de maneira constante e estável até 2023, refletindo uma recuperação do mercado.

---

## **Conclusão**

O **Dashboard de Marketing** fornece insights estratégicos que ajudam as empresas a entender melhor seus clientes, ajustar suas campanhas de marketing e otimizar os pontos de venda. A análise de dados permite decisões mais informadas, aumentando a eficiência operacional e as vendas.
