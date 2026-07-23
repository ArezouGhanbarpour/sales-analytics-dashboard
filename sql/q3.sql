
CREATE PROC finance.SP_Monthly_Diff_Profit @YEAR INT AS

BEGIN

;WITH CTE_A AS

	(SELECT
		*,
		LAG(Sum_Profit)OVER(ORDER BY [Month]) AS Lag_Profit
	FROM 
		(SELECT
			MONTH(DateID) AS [Month],
			SUM(Profit_Amount) AS Sum_Profit
		FROM
			[finance].[FactSales]
		WHERE
			YEAR(DateID) = @YEAR
		GROUP BY
			MONTH(DateID)) TBL)

SELECT
	*,
	IIF(Diff_profit IS NULL,'',IIF(Diff_profit>0,'+','-'))	AS Sym_Diff_Profit
FROM
	(SELECT
		*, (Sum_Profit - Lag_Profit) AS Diff_Profit
	FROM CTE_A) TBL

END