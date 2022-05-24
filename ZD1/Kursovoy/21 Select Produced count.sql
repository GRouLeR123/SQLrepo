--Показывать количество произведенного товара (за отчетный период, по названию).
SELECT SUM(p1.[count]) as [Sum], m1.[name]
FROM Produced as p1
INNER JOIN Menu as m1
ON p1.menu_id = m1.id
WHERE m1.[name] = 'Пирог Вишневый'
AND (p1.[date] > '2022-05-18' AND p1.[date] < '2022-05-21')
GROUP BY m1.[name]