-- 1. Показать Фамилию Имя и Отчество самого пожилого сотрудника (Таблицы HumanResources.Employee и Person.Person). Показать поля FirstName, MiddleName, LastName.
SELECT
	p.FirstName
	,p.MiddleName
	,p.LastName
	,DATEDIFF(YEAR,e.BirthDate,GETDATE()) AS Age
FROM Person.Person AS p
INNER JOIN HumanResources.Employee AS e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.BirthDate =
	(
		SELECT MIN(BirthDate)
		FROM HumanResources.Employee
	);




-- 2. Определить количество сотрудников и штат (StateProvinceName), в котором проживает максимальное число сотрудников (Представление Sales.vSalesPerson).
SELECT top 1 StateProvinceName
     , COUNT(*) AS Quantity
FROM Sales.vSalesPerson
GROUP BY StateProvinceName
ORDER BY COUNT(*) DESC


-- 3. Показать товар ([Name]) с минимальной разницей Стоимости последнего поступления (LastReceiptCost) и Стандартной стоимости (StandardPrice) (Таблица Purchasing.ProductVendor). 
SELECT [Name], ProductSubcategoryID
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID = 
(
	SELECT TOP 1 ProductSubcategoryID
	FROM Production.Product
	WHERE ProductSubcategoryID IS NOT NULL
	GROUP BY ProductSubcategoryID
	HAVING COUNT(*) > 1
	ORDER BY COUNT(*) DESC
);




-- 4. Показать товары, цена которых равна максимальной цене товара из той же подкатегории (Таблица Production.Product). Показать поля [Name], ListPrice и ProductSubcategoryID.
SELECT p1.[Name]
	,p1.ListPrice
	,p1.ProductSubcategoryID 
FROM Production.Product AS p1
WHERE
	p1.ProductSubcategoryID IS NOT NULL AND 
	p1.ListPrice = (
		SELECT MAX(p2.ListPrice)
		FROM Production.Product AS p2
		WHERE p1.ProductSubcategoryID = p2.ProductSubcategoryID
	)
ORDER BY p1.ProductSubcategoryID;



-- 5. Показать товары, цена которых больше средней цены в любой модели продуктов (Таблица Production.Product). Показать поля [Name], ListPrice и ProductModelID.
SELECT [Name], ListPrice, ProductModelID
FROM Production.Product
WHERE ListPrice > (
    SELECT AVG(ListPrice)
    FROM Production.Product 
)


