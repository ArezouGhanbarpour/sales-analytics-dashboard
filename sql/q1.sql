
--CREATE DATABASE KantikoDB
--CREATE SCHEMA finance
/*
CREATE TABLE finance.DimCustomers (
	CustomerID INT Primary Key Identity(1,1),
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100),
	Industry NVARCHAR(200),
	Country NVARCHAR(50)
	)

CREATE TABLE finance.DimProduct (
	ProductID INT Primary Key Identity(1,1),
	ProductName NVARCHAR(100),
	Category NVARCHAR(100),
	Price DECIMAL
)


CREATE TABLE finance.FactSales (
	SalesID INT Primary Key Identity(1,1),
	CustomerID INT,
	ProductID INT,
	DateID DATE,
	Quantity INT,
	Revenue_Amount DECIMAL(12,2),
	Cost_Amount DECIMAL(12,2),
	Profit_Amount DECIMAL(12,2)
)



CREATE TABLE finance.DimDate (
	DateID DATE Primary Key,
	Year_Date INT,
	HalfYearName CHAR(2),
	QuarterName CHAR(2),
	MonthName VARCHAR(20),
	Year_HalfYear_Date INT,
	Year_Quarter_Date INT,
	Year_Month_Date INT
)


GO
INSERT INTO [finance].[DimDate] (DateID)
VALUES ('2023-01-01')
GO 2000 

;WITH CTE_A AS
	(SELECT ROW_NUMBER ()OVER(ORDER BY (SELECT 1)) AS RW, *
	 FROM finance.DimDate)

,CTE_B AS
	(SELECT *,DATEADD(DAY, RW -1 , DateID) AS New_DateID
	FROM CTE_A)

UPDATE CTE_B
SET DateID = New_DateID

;WITH CTE_A AS
	(SELECT *, MONTH(DateID) AS NEW_Month_Date
	 FROM [finance].[DimDate])
	
, CTE_B AS
	(SELECT *,
		CASE
			WHEN NEW_Month_Date < 7 THEN 'H1'
			ELSE 'H2'
		END AS New_HalfYearName,
		CASE
			WHEN NEW_Month_Date < 4 THEN 'Q1'
			WHEN NEW_Month_Date > 3 AND   NEW_Month_Date < 7 THEN 'Q2'
			WHEN NEW_Month_Date > 7 AND   NEW_Month_Date < 10 THEN 'Q3'
			ELSE 'Q4'
		END AS New_QuarterName
	FROM CTE_A)

	UPDATE CTE_B
	SET HalfYearName = New_HalfYearName,
		QuarterName = New_QuarterName


SELECT *,CASE MONTH(DateID)
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
END AS New_Month
FROM [finance].[DimDate]

UPDATE [finance].[DimDate]
SET MonthName = CASE MONTH(DateID)
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
END


;WITH CTE_A AS
(SELECT *,
CASE
	WHEN HalfYearName = 'H1' THEN CONCAT(Year(DateID),'01')
	WHEN HalfYearName = 'H2' THEN CONCAT(Year(DateID),'02')
	ELSE 'N/A'
END AS YearHalf,
CASE
	WHEN QuarterName = 'Q1' THEN CONCAT(Year(DateID),'01')
	WHEN QuarterName = 'Q2' THEN CONCAT(Year(DateID),'02')
	WHEN QuarterName = 'Q3' THEN CONCAT(Year(DateID),'03')
	WHEN QuarterName = 'Q4' THEN CONCAT(Year(DateID),'04')
ELSE 'N/A'
END AS YearQuarter,
CONCAT(Year(DateID),IIF (MONTH(DateID) <10, '0', ''),MONTH(DateID)) AS YearMonth

FROM [finance].[DimDate])


UPDATE CTE_A
SET Year_HalfYear_Date = YearHalf,
	Year_Quarter_Date = YearQuarter,
	Year_Month_Date = YearMonth


UPDATE [finance].[FactSales]
SET ProductID = (SELECT ABS(CHECKSUM(NEWID())) %40+1)

SELECT ProductID, DateID, COUNT(*) AS CNT FROM [finance].[FactSales]
GROUP BY ProductID, DateID
HAVING COUNT(*) > 1
ORDER BY CNT DESC

UPDATE [finance].[FactSales]
SET CustomerID =  (SELECT ABS(CHECKSUM(NEWID())) %200+1)


UPDATE A SET A.Revenue_Amount = A.Quantity * B.Price
FROM 
	[finance].[FactSales] A
INNER JOIN [finance].[DimProduct] B ON A.ProductID = B.ProductID

;WITH CTE_A AS
	(SELECT A.Quantity, A.Revenue_Amount, B.Price, Quantity*Price AS REV
	FROM [finance].[FactSales] A INNER JOIN [finance].[DimProduct] B ON A.ProductID = B.ProductID)
UPDATE CTE_A
SET Revenue_Amount = REV
*/

/
SELECt * FROM [finance].[FactSales]


