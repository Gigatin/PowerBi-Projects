# Relatório de Integração Azure com MySQL, Correção de Script e Integração com Power BI

Este relatório descreve o processo de integração do Azure com um banco de dados MySQL, a correção de scripts, a inserção e teste de dados, a integração com o Power BI, o tratamento de dados e a criação de relatórios.

## 1. Integração do Azure com MySQL

Realizamos com sucesso a integração do Azure com um banco de dados MySQL. Isso nos permitiu hospedar nosso banco de dados em um ambiente seguro e escalável na nuvem.

## 2. Correção de Script

Corrigimos um script fornecido, ajustando as tabelas e suas restrições para garantir que os dados fossem inseridos corretamente. Também corrigimos erros como chaves estrangeiras ausentes e restrições de verificação.

## 3. Inserção e Teste de Dados

Inserimos dados nas tabelas do banco de dados e conduzimos testes para garantir que os dados fossem inseridos corretamente. Realizamos consultas básicas para verificar a integridade dos dados.

## 4. Integração com Power BI

Integramos o Power BI com o Azure para criar painéis e relatórios interativos. Isso nos permitiu visualizar e analisar os dados de maneira eficaz.

## 5. Tratamento de Dados

Realizamos o tratamento de dados, incluindo a alteração da tipagem de horas para inteiro e a substituição de valores inconsistentes por 0. Também mantivemos departamentos sem gerentes para avaliar o impacto nos gráficos.

## 6. Criação de Relatórios

Criamos um conjunto de relatórios com foco no desempenho dos colaboradores e departamentos. As visualizações incluídas no dashboard são as seguintes:

- Cards para quantidade de colaboradores e projetos.
- Um filtro de gênero.
- Comparação de média salarial por gênero.
- Contagem de gêneros de colaboradores por gerentes.
- Média salarial por departamento.
- Horas totais gastas por projeto.
- Quantidade de projetos por colaboradores.
- Média de projetos por departamento.
- Quantidade de departamentos por gerente.


## Ressaltando todo o codigo SQL está comentado e detalhado da sua criação, inserção e analise de dados SQL

**Consulta SQL para Obter Colaboradores e Seus Gerentes:**

SELECT
    CONCAT(e.Fname, ' ', e.Lname) AS 'Nome do Colaborador',
    CONCAT(m.Fname, ' ', m.Lname) AS 'Nome do Gerente'
FROM employee e
LEFT JOIN employee m ON e.Super_ssn = m.Ssn;
