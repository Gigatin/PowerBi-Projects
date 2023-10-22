-- Criar um novo esquema chamado 'azure_company', se não existir
create schema if not exists azure_company;

-- Usar o esquema 'azure_company'
use azure_company;

-- Selecionar todas as restrições de tabela no esquema 'azure_company'
select * from information_schema.table_constraints
where constraint_schema = 'azure_company';

-- Criar a tabela 'employee'
CREATE TABLE employee(
    Fname varchar(15) not null,        -- Nome do funcionário (não pode ser nulo)
    Minit char,                        -- Inicial do nome do meio
    Lname varchar(15) not null,        -- Sobrenome do funcionário (não pode ser nulo)
    Ssn char(9) not null,              -- Número de Seguro Social (não pode ser nulo)
    Bdate date,                        -- Data de nascimento
    Address varchar(30),               -- Endereço
    Sex char,                          -- Sexo
    Salary decimal(10,2),              -- Salário
    Super_ssn char(9),                 -- Número de Seguro Social do supervisor
    Dno int not null,                 -- Número do departamento (não pode ser nulo)
    constraint chk_salary_employee check (Salary > 2000.0),  -- Verificação de restrição de salário
    constraint pk_employee primary key (Ssn)  -- Chave primária definida no número de Seguro Social
);

-- Modificar a tabela 'employee', tornando a coluna 'Dno' não nula e definindo o valor padrão como 1
alter table employee modify Dno int not null default 1;

-- Criar a tabela 'departament'
create table departament(
    Dname varchar(15) not null,        -- Nome do departamento (não pode ser nulo)
    Dnumber int not null,             -- Número do departamento (não pode ser nulo)
    Mgr_ssn char(9) not null,          -- Número de Seguro Social do gerente (não pode ser nulo)
    Mgr_start_date date,              -- Data de início do gerente
    Dept_create_date date,            -- Data de criação do departamento
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),  -- Verificação de restrição de datas
    constraint pk_dept primary key (Dnumber),  -- Chave primária definida no número do departamento
    constraint unique_name_dept unique(Dname),  -- Restrição de nome único para o departamento
    foreign key (Mgr_ssn) references employee(Ssn)  -- Chave estrangeira referenciando a tabela 'employee' pelo número de Seguro Social
);

-- Adicionar uma restrição de chave estrangeira 'fk_dept' à tabela 'departament' referenciando 'employee' no campo 'Mgr_ssn' com ação em cascata
alter table departament add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn) on update cascade;

-- Criar a tabela 'dept_locations'
create table dept_locations(
    Dnumber int not null,             -- Número do departamento (não pode ser nulo)
    Dlocation varchar(15) not null,   -- Localização do departamento (não pode ser nulo)
    constraint pk_dept_locations primary key (Dnumber, Dlocation)  -- Chave primária composta
);

-- Adicionar uma restrição de chave estrangeira 'fk_dept_locations' à tabela 'dept_locations' referenciando 'departament' no campo 'Dnumber' com ações em cascata
alter table dept_locations add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber) on delete cascade on update cascade;

-- Criar a tabela 'project'
create table project(
    Pname varchar(15) not null,       -- Nome do projeto (não pode ser nulo)
    Pnumber int not null,            -- Número do projeto (não pode ser nulo)
    Plocation varchar(15),           -- Localização do projeto
    Dnum int not null,               -- Número do departamento (não pode ser nulo)
    primary key (Pnumber),           -- Chave primária definida no número do projeto
    constraint unique_project unique (Pname),  -- Restrição de nome de projeto único
    constraint fk_project foreign key (Dnum) references departament(Dnumber)  -- Chave estrangeira referenciando 'departament' no número do departamento
);

-- Criar a tabela 'works_on'
create table works_on(
    Essn char(9) not null,            -- Número de Seguro Social do funcionário (não pode ser nulo)
    Pno int not null,                -- Número do projeto (não pode ser nulo)
    Hours decimal(3,1) not null,     -- Horas trabalhadas (não pode ser nulo)
    primary key (Essn, Pno),         -- Chave primária composta
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),  -- Chave estrangeira referenciando 'employee' no número de Seguro Social
    constraint fk_project_works_on foreign key (Pno) references project(Pnumber)  -- Chave estrangeira referenciando 'project' no número do projeto
);

-- Criar a tabela 'dependent'
create table dependent(
    Essn char(9) not null,            -- Número de Seguro Social do funcionário (não pode ser nulo)
    Dependent_name varchar(15) not null,  -- Nome do dependente (não pode ser nulo)
    Sex char,                        -- Sexo do dependente
    Bdate date,                      -- Data de nascimento do dependente
    Relationship varchar(8),         -- Relacionamento com o funcionário
    primary key (Essn, Dependent_name),  -- Chave primária composta
    constraint fk_dependent foreign key (Essn) references employee(Ssn)  -- Chave estrangeira referenciando 'employee' no número de Seguro Social
);


-- Inserção na tabela employee
insert into employee values 
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

-- Inserção na tabela dependent
insert into dependent values 
(333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
(333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
(333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
(987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
(123456789, 'Michael', 'M', '1988-01-04', 'Son'),
(123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

-- Inserção na tabela departament
insert into departament values 
('Research', 5, 333445555, '1988-05-22','1986-05-22'),
('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

-- Inserção na tabela dept_locations
insert into dept_locations values 
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

-- Inserção na tabela project
insert into project values 
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- Inserção na tabela works_on
insert into works_on values 
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40.0),
(453453453, 1, 20.0),
(453453453, 2, 20.0),
(333445555, 2, 10.0),
(333445555, 3, 10.0),
(333445555, 10, 10.0),
(333445555, 20, 10.0),
(999887777, 30, 30.0),
(999887777, 10, 10.0),
(987987987, 10, 35.0),
(987987987, 30, 5.0),
(987654321, 30, 20.0),
(987654321, 20, 15.0),
(888665555, 20, 0.0);



-- Seleciona todos os registros da tabela 'employee'.
select * from employee;

-- Conta o número de dependentes associados a cada colaborador.
select Ssn, count(Essn) from employee e, dependent d where (e.Ssn = d.Essn);

-- Seleciona todos os registros da tabela 'dependent'.
select * from dependent;

-- Seleciona a data de nascimento e endereço de colaboradores com nome 'John', inicial do meio 'B' e sobrenome 'Smith'.
SELECT Bdate, Address FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Seleciona departamentos com nome 'Research'.
select * from departament where Dname = 'Research';

-- Seleciona nomes de colaboradores e seus departamentos, filtrando por 'Research' e combinando as tabelas.
SELECT Fname, Lname, Address
FROM employee, departament
WHERE Dname = 'Research' AND Dnumber = Dno;

-- Seleciona todos os registros da tabela 'project'.
select * from project;

-- Recupera o nome do departamento e do gerente com base no local em 'Stafford'.
select Dname as Department, Mgr_ssn as Manager from departament d, dept_locations l
where d.Dnumber = l.Dnumber;

-- Recupera o nome do departamento e o nome completo do gerente em 'Stafford' usando a função 'concat'.
select Dname as Department, concat(Fname, ' ', Lname) from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- Recupera informações sobre projetos em 'Stafford'.
select * from project, departament where Dnum = Dnumber and Plocation = 'Stafford';

-- Recupera informações sobre departamentos e projetos em 'Stafford' com base na localização.
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM project, departament, employee
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND
Plocation = 'Stafford';

-- Seleciona registros de colaboradores cujo número do departamento esteja em (3,6,9).
SELECT * FROM employee WHERE Dno IN (3,6,9);

-- Seleciona a data de nascimento e endereço dos colaboradores com nome 'John', inicial do meio 'B' e sobrenome 'Smith'.
SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Seleciona nomes de colaboradores e seus departamentos com base no nome do departamento 'Research'.
SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname = 'Research' AND Dnumber = Dno;

-- Recupera salários dos colaboradores e calcula o valor do INSS (11% do salário).
select Fname, Lname, Salary, Salary*0.011 from employee;

-- Recupera salários dos colaboradores e calcula o valor do INSS, com um alias 'INSS'.
select Fname, Lname, Salary, Salary*0.011 as INSS from employee;

-- Recupera salários dos colaboradores e calcula o valor do INSS, com arredondamento para 2 casas decimais.
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

-- Define um aumento de salário (10%) para gerentes associados ao projeto 'ProductX'.
select e.Fname, e.Lname, 1.1*e.Salary as increased_sal from employee as e,
works_on as w, project as p where e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX';

-- Concatena nomes de colaboradores e gerentes e fornece um alias 'Manager'.
select Dname as Department, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- Recupera informações de colaboradores que trabalham para o departamento 'Research'.
select Fname, Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber = Dno;

-- Define aliases para os nomes das colunas para melhorar a legibilidade.
select e.Fname, e.Lname, e.Address from employee e, departament d
	where d.Dname = 'Research' and d.Dnumber = e.Dno;