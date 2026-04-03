

--1 - Selecionar todas as informações da TabelaClientes.
SELECT * FROM TabelaClientes

--2 - Listar apenas os nomes dos colaboradores e seus respectivos cargos.
select NomeColaborador,
	   Cargo
from TabelaColaboradores

--3 - Identificar todos os empréstimos ativos no sistema.
SELECT * FROM TabelaEmprestimo
where Status = 1

--4 - Filtrar apenas clientes que residem em São Paulo.
select Nome,
	   Estado
from TabelaClientes
where Estado = 'SP'

--5 - Filtrar apenas quais colaboradores recebem um salário superior a R$5.000.
select NomeColaborador,
	   Salario
from TabelaColaboradores
where Salario > 5000

--6 - Crie uma consulta para listar apenas os empréstimos cujo valor seja maior ou igual a R$10.000.
SELECT * FROM TabelaEmprestimo
where Valor >= 10000

-- 7 - Visualizar os colaboradores organizados em ordem alfabética de seus nomes.
select NomeColaborador,
	   Cargo
from TabelaColaboradores 
order by NomeColaborador asc

-- 8 - Listar as informações apenas dos 5 primeiros colaboradores.
select top 5 *
from TabelaColaboradores

-- 9 - Visualizar os empréstimos, do maior valor para o menor (ordem decrescente).
SELECT * FROM TabelaEmprestimo
order by Valor desc

-- 10 - Identificar os dois colaboradores com os maiores salários acima de R$5.000.
select top 2 *
from TabelaColaboradores
where Salario > 5000
order by id_colaborador desc