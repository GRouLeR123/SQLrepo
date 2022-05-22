--Показывать сумму (количество) заказываемого продукта у 
--данного поставщика за отчетный период.
SELECT p1.ingredient_id as ingredient, SUM(p1.[count]) as [Sum]
FROM Purchase as p1
WHERE ingredient_id IN
	(
	SELECT i1.[name]
	FROM Ingredients as i1
	INNER JOIN Suplier as s1
	ON i1.delivery_id = s1.id
	WHERE s1.company_name = 'Макфа'
	)
	and (p1.[date] >'2022.05.21' and p1.[date] <= '2022.05.24')
GROUP BY p1.ingredient_id
