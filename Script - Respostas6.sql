-- 51 - Qual é o total de valores concedidos em empréstimos até o momento
SELECT
	SUM(Valor) AS TotalEmprestimos
FROM TabelaEmprestimo


--52 - Qual é a média salarial dos colaboradores da empresa
SELECT 
	AVG(Salario) AS MediaSalarial
FROM TabelaColaboradores


--53 - Qual é o maior valor de empréstimo concedido pela instituição
SELECT 
	MAX(Valor) AS MaiorEmprestimo
FROM TabelaEmprestimo


--54 - Qual é o menor valor de empréstimo já concedido
SELECT 
	MIN(Valor) AS MenorEmprestimo
FROM TabelaEmprestimo


-- 55 - Quantos colaboradores estão registrados na empresa atualmente
SELECT 
	COUNT(*) AS TotalColaboradores
FROM TabelaColaboradores


-- 56 - Qual é a média dos valores de empréstimos concedidos usando a soma total dividida pela quantidade de empréstimos
SELECT 
	SUM(Valor)/COUNT(id_emprestimo) AS MediaEmprestimos
FROM TabelaEmprestimo


-- 57 - Qual é o total de salários pagos por departamento
SELECT 
	id_departamento,
	SUM(Salario) AS TotalSalarios
FROM TabelaColaboradores
GROUP BY id_departamento


-- 58 - Quais categorias de empréstimos possuem um total concedido superior a R$ 20.000
SELECT 
	Tipo,
	SUM(Valor) AS TotalPorTipo
FROM TabelaEmprestimo
GROUP BY Tipo
HAVING SUM(Valor) > 20000


-- 59 - Qual é o total de valores concedidos e a quantidade de empréstimos firmados por tipo de empréstimo
SELECT
	Tipo,
	SUM(Valor) AS TotalValor,
	COUNT(id_emprestimo) AS QuantidadeEmprestimo
FROM TabelaEmprestimo
GROUP BY Tipo


-- 60 - Qual é o total, a média, o maior e o menor valor dos empréstimos concedidos
SELECT 
	SUM(Valor) AS TotalEmprestimos,
	AVG(Valor) AS MediaEmprestimos,
	MAX(Valor) AS MaiorEmprestimo,
	MIN(Valor) AS MenorEmprestimo
FROM TabelaEmprestimo