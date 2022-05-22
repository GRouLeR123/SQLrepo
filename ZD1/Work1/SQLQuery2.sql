---№1  Найти максимальную цену товара (ListPrice) из таблицы Production.Product
select max(ListPrice) from Production.Product

select * from HumanResources.Employee


---№2  Найти средний вес (Weight) из таблицы Production.Product, не учитывать пустые значения.
select avg(Weight) as average from Production.Product 
where Weight is not null


---№3  Для каждого пола найти суммарное количество часов отпуска из таблицы.
select sum(SickLeaveHours) as summleave, Gender
from HumanResources.Employee 
group by Gender;


---№4  Вывести пол, где среднее количество часов выходных больше 50.
select * from HumanResources.Employee
select gender, avg(VacationHours) from HumanResources.Employee
group by Gender
having avg(VacationHours) > 50;

--#5  Вывести BusinessEntityID, LastReceiptDate и сумму по StandardPrice для BusinessEntityID с разными LastReceiptDate, предусмотреть вывод общей суммы для всех StandardPrice у различных BusinessEntityID из таблицы Purchasing.ProductVendor.
select * from Purchasing.ProductVendor
select BusinessEntityID, LastReceiptDate, sum(StandardPrice) as [sum]
from Purchasing.ProductVendor
group by rollup (BusinessEntityID, LastReceiptDate)