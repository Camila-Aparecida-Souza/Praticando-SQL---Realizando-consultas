-- 41 - Criar uma consulta que calcule a receita e o custo para cada mês de 2024
SELECT 
	Mes,
	Ano,
	(Quantidade * PrecoUnitario) as Receitas,
	(Quantidade * CustoUnitario) as Despesas
FROM TabelaVendasMensais


-- 42 - Criar uma consulta que calcule o lucro bruto mensal (subtração do custo total das almofadas vendidas da receita total gerada pelas vendas em cada mês)
SELECT
	Mes,
	Ano,
	((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario)) as LucroBruto
FROM TabelaVendasMensais


-- 43 - Criar uma consulta que calcule a margem de lucro bruto (em porcentagem) para cada mês de 2024
SELECT Mes, 
       Ano,
       ROUND(100.0 * ((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario)) / 
             (Quantidade * PrecoUnitario), 1)  AS MargemLucroBruto
FROM TabelaVendasMensais


-- 44 - Criar uma consulta que calcule o lucro líquido mensal para todos os meses do ano de 2024, levando em consideração que os impostos correspondem a 30% do custo total das almofadas vendidas.
SELECT Mes, 
       Ano,
       ROUND((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario) - (Quantidade * CustoUnitario) * 0.30, 2) AS LucroLiquido
FROM TabelaVendasMensais


-- 45 - Criar uma consulta que calcule o número de caixas necessárias. É fundamental que a quantidade de caixas seja a mínima possível (cada caixa comporta até 8 almofadas), pois reduzirá os custos de frete.
SELECT
	id_pedido,
	QuantidadeVendida,
	CEILING(QuantidadeVendida / 8.0) AS	QtdCaixas
FROM TabelaPedidos


-- 46 - criar uma consulta que calcule o preço total que cada cliente deve pagar após aplicar o desconto sobre o preço normal de venda das almofadas. É essencial que o valor seja arredondado para baixo para garantir que o cliente sempre receba o menor preço possível.
SELECT
	id_pedido,
	QuantidadeVendida,
	PrecoUnitario,
	Desconto,
	FLOOR((PrecoUnitario * QuantidadeVendida) * (1 - Desconto)) as PrecoTotal
FROM TabelaPedidos


-- 47 - criar uma consulta que calcule a diferença absoluta entre as vendas mensais de 2024 e a média das vendas dos últimos cinco anos para cada mês, de forma a avaliar se houve disparidade entre os valores independentemente se positiva ou negativa.
select
	Mes,
	Ano,
	ABS(VendasMensais - MediaVendas5Anos) AS DiferencaAbsolutaVendas
from TabelaMetasVendasMensais


-- 48 - criar uma consulta que ajude a empresa a projetar o número de almofadas que espera vender ao longo do 5º ano, começando com uma base de vendas conhecida e uma taxa de crescimento anual específica.
select 
	Ano,
	VendasBase,
	FLOOR(POWER(1 + TaxaCrescimento, 5) * VendasBase) AS VendasProjecao5Anos
from TabelaEstimativaCrescimento


-- 49 - criar uma consulta que ajude a empresa a calcular a menor distância em linha reta entre a localização de cada cliente e a sede da empresa, usando as coordenadas de latitude e longitude. 
select 
	id_cliente,
	CidadeCliente,
	ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 'Entrega gratuita'
            ELSE 'Cobrar entrega'
       END AS StatusEntrega
from TabelaPedidos


-- 50 - calcular a menor distância em linha reta e definir que a entrega será gratuita se a distância for menor que 60 km, caso contrário, o valor de frete será de R$ 50 reais por caixa.
SELECT id_pedido,
       CidadeCliente,
       ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 0
            ELSE CEILING(QuantidadeVendida / 8.0) * 50
       END AS Frete
FROM TabelaPedidos