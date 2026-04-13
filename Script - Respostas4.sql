/* Resumo de algumas funções */
/*
SELECT GETDATE() AS data_atual;
SELECT CAST(GETDATE() AS DATE) AS data_atual;
SELECT CAST(GETDATE() AS DATE) AS somente_data;
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy') AS data_formatada;
SELECT DATEDIFF(DAY, '2025-01-01', '2025-01-07') AS dias_diferenca;
SELECT DATEPART(YEAR, GETDATE()) AS ano_atual;
SELECT DATEADD(DAY, 7, GETDATE()) AS data_futura;
SELECT 
    nome, 
    data_nascimento,
    CASE
        WHEN DATEADD(YEAR, 18, data_nascimento) <= GETDATE() THEN 'Adulto'
        ELSE 'Menor'
    END AS categoria
FROM pessoas;

*/

--31 - Crie uma consulta SQL para exibir a data e hora atual.
SELECT GETDATE() AS data_atual


--32 - Exibir a data de nascimento dos clientes no formato YYYY-MM-DD.
SELECT Nome,
	   FORMAT(DataNascimento, 'yyyy-MM-dd') AS DataFormatada
FROM TabelaClientes


--33 - Usando funções de data, calcule quantos dias existem entre a DataInicio e a data correspondente ao término do empréstimo (ou seja, DataInicio + Prazo).
SELECT id_emprestimo,
	   DATEDIFF(DAY, DataInicio, DATEADD(DAY, Prazo, DataInicio)) AS dias_diferenca
 FROM TabelaEmprestimo


--34 - Crie uma consulta que extraia o ano da coluna DataNascimento na tabela TabelaClientes.
SELECT Nome,
	   --DATEPART(YEAR, DataNascimento) AS AnoNascimento
	   YEAR(DataNascimento) AS AnoNascimento
FROM TabelaClientes


--35 - listar os empréstimos registrados entre 2023-01-01 e 2023-03-31 na tabela TabelaEmprestimo
select * from TabelaEmprestimo
where DataInicio between '2023-01-01' and '2023-03-31'


--36 - Crie uma consulta SQL que adicione o valor do prazo à data de início na tabela TabelaEmprestimo.
SELECT id_emprestimo, 
       DataInicio, 
       DATEADD(DAY, Prazo, DataInicio) AS DataVencimento 
FROM TabelaEmprestimo


-- 37 - Exibir os pagamentos registrados na tabela TabelaPagamentos ordenados pela data de pagamento em ordem crescente.
select * from TabelaPagamentos
order by DataPagamento asc


-- 38 - Crie uma consulta SQL que calcule a idade dos clientes.
SELECT Nome, 
       DATEDIFF(YEAR, DataNascimento, GETDATE()) - 
       CASE 
           WHEN MONTH(DataNascimento) > MONTH(GETDATE()) OR 
                (MONTH(DataNascimento) = MONTH(GETDATE()) AND DAY(DataNascimento) > DAY(GETDATE())) 
           THEN 1 
           ELSE 0 
       END AS Idade
FROM TabelaClientes


-- 39 - Verificar quais empréstimos estão vencidos com base na data atual. Use as funções de data para criar uma consulta que exiba "Vencido" ou "No Prazo" para cada empréstimo
SELECT id_emprestimo, 
       CASE 
           WHEN DATEDIFF(DAY, DATEADD(DAY, Prazo, DataInicio), GETDATE()) > 0 THEN 'Vencido'
           ELSE 'No Prazo'
       END AS StatusEmprestimo
FROM TabelaEmprestimo


--40 - calcular o próximo pagamento de cada empréstimo registrado na tabela TabelaEmprestimo. O próximo pagamento será calculado a partir da data de pagamento anterior, com base em um intervalo fixo de 30 dias.
SELECT id_emprestimo, 
       DataInicio, 
       DATEADD(DAY, 30, DataInicio) AS ProximoPagamento
FROM TabelaEmprestimo