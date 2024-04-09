CREATE DATABASE db_empresa_gustavo;
USE db_empresa_gustavo;
CREATE TABLE tb_cidade (
    cod_cidade INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_cidade VARCHAR(100) NOT NULL
);
CREATE TABLE tb_departamentos (
	cod_departamento INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TABLE tb_funcionarios (
	mat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(64),
    sexo CHAR(1),
    salario DECIMAL(5,2),
    cod_cidade INT NOT NULL,
    cod_departamento INT NOT NULL,
    FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade),
    FOREIGN KEY (cod_departamento) REFERENCES tb_departamentos (cod_departamento)
);

-- Populando a tabela tb_cidade
INSERT INTO tb_cidade (nome_cidade) VALUES
('São Paulo'),
('Rio de Janeiro'),
('Belo Horizonte'),
('Brasília'),
('Salvador');

-- Populando a tabela tb_departamentos
INSERT INTO tb_departamentos (nome_departamento) VALUES
('Vendas'),
('Financeiro'),
('RH'),
('TI'),
('Logística'),
('Marketing'),
('Jurídico'),
('Produção'),
('Atendimento'),
('Administrativo');

ALTER TABLE tb_funcionarios MODIFY COLUMN salario DECIMAL(8,2);

-- Populando a tabela tb_funcionarios
INSERT INTO tb_funcionarios (nome, sexo, salario, cod_cidade, cod_departamento) VALUES
('João', 'M', 4000.00, 1, 1),
('Maria', 'F', 3500.00, 2, 2),
('Pedro', 'M', 3200.00, 1, 1),
('Ana', 'F', 3800.00, 3, 3),
('Carlos', 'M', 4200.00, 1, 4),
('Fernanda', 'F', 3800.00, 2, 5),
('Rafael', 'M', 4000.00, 4, 6),
('Juliana', 'F', 3600.00, 1, 7),
('Mariana', 'F', 3700.00, 5, 8),
('Lucas', 'M', 3400.00, 2, 9),
('Roberto', 'M', 4100.00, 3, 10),
('Patrícia', 'F', 3900.00, 1, 1),
('Gustavo', 'M', 3800.00, 4, 2),
('Carolina', 'F', 3700.00, 2, 3),
('Daniel', 'M', 3600.00, 3, 4),
('Larissa', 'F', 3400.00, 5, 5),
('Felipe', 'M', 4200.00, 1, 6),
('Camila', 'F', 3700.00, 2, 7),
('Bruno', 'M', 3800.00, 4, 8),
('Amanda', 'F', 3500.00, 3, 9);

-- 1 - Selecionar nome dos funcionários em ordem alfabética:
SELECT * 
FROM tb_funcionarios
ORDER BY nome ASC;

-- 2- Listar nome dos departamentos
SELECT *
FROM tb_departamentos;

-- 3- Listar nome de funcionários que começa com J
SELECT *
FROM tb_funcionarios
WHERE nome LIKE 'J%'
ORDER BY mat ASC;

-- 4- Listar nome das cidades em ordem alfabética 
SELECT *
FROM tb_cidade
ORDER BY nome_cidade;

-- Incluir novo departamento (TI)
INSERT INTO tb_departamentos (nome_departamento) VALUES ('TI');

-- Agora, mudar o nome do departamento para tecnologia da informação
UPDATE tb_departamentos SET nome_departamento = "TECNOLOGIA DA INFORMAÇÃO" WHERE cod_departamento = "11";

-- Inserir uma nova cidade "PORTO ALEGRE"
INSERT INTO tb_cidade (nome_cidade) VALUES ('PORTO-ALEGRE');

-- Informar o salário dos funcionários após aumento de 10%

UPDATE tb_funcionarios SET salario = salario * 1.10 WHERE mat IS NOT NULL;

-- Adicionando um funcionário com um código de cidade inexistente (violação de chave estrangeira)
INSERT INTO tb_funcionarios (nome, sexo, salario, cod_cidade, cod_departamento) VALUES ('Funcionário Teste', 'M', 4000, 999, 1);

-- Adicionando um funcionário com um código de departamento inexistente (violação de chave estrangeira)
INSERT INTO tb_funcionarios (nome, sexo, salario, cod_cidade, cod_departamento) VALUES ('Funcionário Teste 2', 'F', 4500, 1, 999);

-- Listar a média dos salários dos empregados:
SELECT AVG(salario) AS media_salarios FROM tb_funcionarios;

-- Listar o total de empregados:
SELECT COUNT(*) AS total_empregados FROM tb_funcionarios;

-- Listar o total dos salários:
 SELECT salarios
 FROM tb_funcionarios;
 
-- Listar a média dos salários agrupados por sexo:
SELECT sexo, AVG(salario) AS media_salarios_por_sexo FROM tb_funcionarios GROUP BY sexo;

-- Calcular primeiro a remuneração anual dos empregados e depois adicionar o bônus de 900,00:
SELECT nome, (salario * 12) + 900 AS remuneracao_anual_com_bonus FROM tb_funcionarios;

-- Recuperar todas as informações dos empregados que não trabalham nos departamentos 2 e 3:
SELECT * FROM tb_funcionarios WHERE cod_departamento NOT IN (2, 3);

-- Recuperar todas as informações dos empregados que possuem salário entre 2500 e 5500:
SELECT * FROM tb_funcionarios WHERE salario BETWEEN 2500 AND 5500;

-- Retornar o total de empregados por sexo:
SELECT sexo, COUNT(*) AS total_empregados_por_sexo FROM tb_funcionarios GROUP BY sexo;

-- Informar os nomes dos empregados que possuem a soma de seus salários anual menor que 55000,00:
SELECT nome FROM tb_funcionarios GROUP BY nome HAVING SUM(salario * 12) < 55000;

-- Listar todos os empregados que são do sexo feminino e terminam com a letra "A":
SELECT * FROM tb_funcionarios WHERE sexo = 'F' AND nome LIKE '%A';
