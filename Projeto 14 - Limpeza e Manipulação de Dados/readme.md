# Relatório de Análise e Tratamento de Dados  
## Base Fictícia de Clientes

### Objetivo do Projeto

Este projeto tem como objetivo realizar uma **análise exploratória de dados (EDA)** sobre uma base fictícia de clientes, identificando inconsistências, erros e padrões incorretos. Posteriormente, são aplicadas técnicas de **tratamento de dados**, incluindo a remoção de duplicatas, preenchimento de valores ausentes e tratamento de outliers. Por fim, os dados são visualizados e preparados para análises futuras.

---

### Estrutura da Base de Dados

A base de dados contém 9 colunas, conforme descritas abaixo:

- `ID_Cliente`  
- `Idade`  
- `Peso`  
- `Altura`  
- `Estado Civil`  
- `Cidade`  
- `Estado`  
- `Limite de Crédito`  
- `Taxa de Desconto`  
- `Tipo de Cliente`  

A base possui inicialmente **502 registros**.

---

###  Análise Exploratória (EDA)

Durante a etapa de EDA, foram identificadas as seguintes inconsistências:

- Valores **nulos** nas colunas `Idade` e `Peso`.
- Diferença entre a contagem total e a contagem de IDs únicos:
  - Total: 502 registros  
  - IDs únicos: 496 registros  
  - ➤ Indica a **presença de duplicatas** na base.
- A coluna `Altura` contém **valores fora da curva (outliers)**.

---

###  Tratamento de Dados

As operações de limpeza e tratamento foram realizadas no **Power BI (Power Query)**, seguindo os passos abaixo:

####  1. Remoção de Duplicatas

- Foi aplicada a função de **remoção de duplicatas** na coluna `ID_Cliente`.
- Após a ação, a contagem total de registros corresponde à contagem de IDs únicos (496 registros).

####  2. Substituição de Valores Nulos

- Os valores nulos das colunas `Idade` e `Peso` foram substituídos pela **mediana** da respectiva coluna, reduzindo o impacto de outliers na imputação.

####  3. Tratamento de Outliers

- Os valores extremos da coluna `Altura` foram também substituídos pela **mediana**.
-  Observação: Em contextos empresariais, outras abordagens podem ser mais adequadas, como:
  - Exclusão de registros
  - Manutenção dos outliers
  - Tratamento com base em z-score ou IQR  
  A escolha depende dos objetivos analíticos e do impacto nos resultados.

---

###  Conclusão

A análise permitiu detectar e corrigir problemas relevantes na base de dados, como:

- **Duplicatas**
- **Valores ausentes**
- **Outliers**

Após o tratamento, a base está pronta para ser utilizada em análises descritivas, construção de dashboards ou aplicação de modelos de machine learning, caso desejado.

---

###  Tecnologias Utilizadas

- Power BI (Power Query)
- Estatística Descritiva (Mediana, Contagem Distinta)

---

###  Autor

Este relatório foi desenvolvido como parte de um estudo prático sobre análise e limpeza de dados em Power BI.

