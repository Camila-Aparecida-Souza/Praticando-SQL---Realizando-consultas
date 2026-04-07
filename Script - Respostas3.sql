--CONCAT(string1, string2, ...)
--LEN(string)
--SUBSTRING(string, start, length)
--LOWER(string)
--LTRIM(string) e RTRIM(string)
--REPLACE(string, from_str, to_str)

-- 21 - Escreva uma consulta SQL que exiba todos os nomes dos clientes no formato padronizado em maiúsculas.
select 
	UPPER(Nome) AS NomeMaiusculo
from TabelaClientes


-- 22 - Converter os nomes dos colaboradores em letras minúsculas
select 
	LOWER(NomeColaborador) as NomeMinusculo
from TabelaColaboradores


-- 23 - Criar uma consulta SQL para extrair os três primeiros caracteres do nome e CPF de cada cliente para formar um identificador único?
select
	CONCAT((SUBSTRING(Nome, 1, 3)),(SUBSTRING(CPF, 1, 3))) AS Identificador
from TabelaClientes


-- 24 - Criar uma consulta que retorne os nomes dos clientes e o número de caracteres de cada um
select Nome,
	   LEN(Nome) as Comprimento
from TabelaClientes


-- 25 - Exibir o nome completo do colaborador, seguido de seu cargo no departamento, em uma única coluna.
select
	CONCAT(NomeColaborador, ' - ' ,Cargo) as NomeCompletoECargo
from TabelaColaboradores


-- 26 - Consulta que seja utilizada para ajustar os nomes exibidos, substituindo "Recursos Humanos" por "RH"
select 
	REPLACE(NomeDepartamento, 'Recursos Humanos', 'RH') as NomeAtualizado
from TabelaDepartamento


-- 27 - Combinar as informações de tipo, status e valor do empréstimo em uma única string formatada que seja clara, informativa e estéticamente agradável.
select  
	CONCAT(Tipo, ' - ', Status, ' - R$', Valor) as DescricaoEmprestimo
from TabelaEmprestimo


-- 28 - gerar um identificador único para cada pagamento, exibindo o status e o ID do pagamento concatenados
select 
	CONCAT((SUBSTRING(Status, 1, 3)), (SUBSTRING(id_pagamento, 1, 3))) as Identificador
from TabelaPagamentos


-- 29 - Padronizar as fontes. O nome "Serasa" deve ser convertido para "SER", "SPC" permanece como está, e "Boa Vista" deve ser abreviado para "BOA".
SELECT 
    id_score,
    Fonte,
    UPPER(REPLACE(REPLACE(Fonte, 'Boa Vista', 'BOA'), 'Serasa', 'SER')) AS FonteAbreviada
FROM TabelaScoreCredito


-- 30 - Remover os espaços extras nos valores da coluna Tipo.
SELECT
	id_emprestimo,
	LTRIM(RTRIM(Tipo)) AS Tipo
FROM TabelaEmprestimo