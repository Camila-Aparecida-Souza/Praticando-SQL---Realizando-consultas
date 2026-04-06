-- 11 - Liste os colaboradores do departamento de TI que possuem um sal�rio superior a R$ 4.500.
SELECT TC.NomeColaborador,
	   TC.Salario,
	   TC.id_departamento,
	   TD.NomeDepartamento
FROM TabelaColaboradores TC
INNER JOIN TabelaDepartamento TD ON TC.id_departamento = TD.id_departamento
WHERE TC.id_departamento = 'D03' AND Salario > 4500


-- 12 - Liste os clientes que nasceram antes de 1990 ou que residem no estado de S�o Paulo.
SELECT Nome,
	   DataNascimento,
	   Estado
FROM TabelaClientes
WHERE DataNascimento < '1990-01-01' OR Estado = 'SP'


-- 13 - Liste todos os empr�stimos concedidos entre 01/01/2023 e 31/03/2023.
SELECT id_emprestimo,
	   DataInicio,
	   Tipo,
	   Valor
FROM TabelaEmprestimo
WHERE DataInicio BETWEEN '2023-01-01' AND '2023-03-31'


-- 14 - Liste os clientes que possuem 18 anos ou mais.
/* o DATEADD adiciona um intervalo de tempo a uma data. Formato: DATEADD(tipo, quantidade, data)
	DATEADD(YEAR, 18, DataNascimento) ====>>> Somar 18 anos � data de nascimento
*/
SELECT Nome,
       DataNascimento,
       CPF
FROM TabelaClientes
WHERE DATEADD(YEAR, 18, DataNascimento) <= GETDATE()


-- 15 - Liste os empr�stimos que pertencem �s categorias "Pessoal" ou "Imobili�rio".
SELECT id_emprestimo, 
	   Tipo, 
	   Valor
FROM TabelaEmprestimo
WHERE Tipo IN ('Pessoal', 'Imobili�rio');


-- 16 - Liste os empr�stimos que possuem valores entre R$ 10.000 e R$ 50.000 e pertencem �s categorias "Consignado" ou "Autom�vel".
SELECT id_emprestimo,
	   Tipo,
	   Valor
FROM TabelaEmprestimo
WHERE Valor between 10000 and 50000
  AND Tipo IN ('Consignado', 'Autom�vel')


-- 17 - Liste os estados distintos onde os clientes residem.
SELECT DISTINCT Estado 
FROM TabelaClientes


-- 18 - Liste os clientes que moram no Rio de Janeiro ou Salvador e cujo CPF inicie com "6".
SELECT Nome,
	   CPF,
	   Cidade,
	   Estado
FROM TabelaClientes
WHERE (Cidade = 'Rio de Janeiro' OR Cidade = 'Salvador')
  AND CPF LIKE '6%'


-- 19 - Liste os pagamentos realizados no ano de 2023 com valores entre R$ 500 e R$ 1.000.
SELECT id_pagamento,
	   DataPagamento,
	   Valor,
	   Status
FROM TabelaPagamentos
WHERE DataPagamento between '2023-01-01' AND '2023-12-31' --YEAR(DataPagamento) = 2023
  AND Valor between 500 and 1000


-- 20 - Liste os clientes que possuem uma pontua��o de cr�dito menor ou igual a 700.
SELECT id_cliente,
	   Pontuacao,
	   Fonte
FROM TabelaScoreCredito
WHERE Pontuacao <= 700