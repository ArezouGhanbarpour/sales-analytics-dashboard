CREATE VIEW finance.VW_Yearly_Monthly_Revenue_Profit AS
SELECT 
	[Year],
	[Month],
	CASE [Month]
		WHEN 1 THEN 'Jan'
		WHEN 2 THEN 'Feb'
		WHEN 3 THEN 'März'
		WHEN 4 THEN 'Apr'
		WHEN 5 THEN 'Mai'
		WHEN 6 THEN 'Jun'
		WHEN 7 THEN 'Jul'
		WHEN 8 THEN 'Aug'
		WHEN 9 THEN 'Sep'
		WHEN 10 THEN 'Okt'
		WHEN 11 THEN 'Nov'
		WHEN 12 THEN 'Dez'
		ELSE 'N/A'
	END AS [MonthName],
	[Revenue],
	[Profit]
FROM
	(SELECT 
		YEAR(DateID) AS [Year],
		MONTH(DateID) AS [Month],
		SUM(Revenue_Amount) AS [Revenue], 
		SUM(Profit_Amount) AS [Profit]
	FROM 
		[finance].[FactSales]
	GROUP BY 
		YEAR(DateID), MONTH(DateID))TBL 
