

-- Top 20 produtos mais vendidos 

SELECT TOP 20 SUM(Quantity * UnitPrice) AS MAIS_VENDIDOS, [Description] FROM Online_Retail
GROUP BY [Description] ORDER BY MAIS_VENDIDOS DESC

-- Top 5 produtos mais vendidos em cada país 

SELECT TOP 5 SUM(Quantity * UnitPrice) AS VALOR_TOTAL, Country FROM Online_Retail
GROUP BY Country ORDER BY VALOR_TOTAL DESC

--Quantidade média de produtos vendidos para cada país

SELECT Country, AVG(UnitPrice) AS MÉDIA_DE_PRODUTOS
FROM Online_Retail GROUP BY Country

-- Quantidade de venda total por mês dos produtos que foram emitidos 
--invoice em até 1 dia (mesma data da compra) 

SELECT COUNT(DISTINCT(InvoiceNo)) AS VENDAS, MONTH(CONVERT(DATE, InvoiceDate, 22)) AS MES FROM Online_Retail
GROUP BY MONTH(convert(DATE, InvoiceDate, 22)) ORDER BY  MONTH(convert(DATE, InvoiceDate, 22))

--Percentual de cancelamento por mês

select * from Online_Retail
where SUBSTRING (InvoiceNo, 1,1) = 'c'

--Percentual total da receita dos produtos não cancelados e dos 3 países que mais
--venderam um relação ao total de receita sem cancelados.

SELECT SUM(Quantity * UnitPrice) AS PORCENTAGEM FROM Online_Retail
WHERE SUBSTRING (InvoiceNo, 1,1) = 'c'
 
SELECT SUM(Quantity * UnitPrice) FROM Online_Retail

SELECT TOP 3 (SUM(Quantity * UnitPrice)*100)/ COUNT (*) AS PORCENTAGEM, Country FROM Online_Retail
WHERE SUBSTRING (InvoiceNo, 1,1) != 'c'
GROUP BY Country ORDER BY PORCENTAGEM DESC 



