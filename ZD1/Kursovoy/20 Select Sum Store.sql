--Показывать список товара (общую сумму заказа, суму заказа данного товара), 
--заказанного данным магазином.

SELECT SUM(m1.cost*p1.[count]) as [Sum], m1.[name]
FROM Produced as p1
INNER JOIN Menu as m1
ON p1.menu_id = m1.id
WHERE menu_id IN (
	SELECT m2.menu_id
	FROM Menu_transfer as m2
	INNER JOIN Store as s1
	ON s1.id = m2.store_id
	WHERE s1.store_name = 'Пекарня'
)
GROUP BY m1.[name]