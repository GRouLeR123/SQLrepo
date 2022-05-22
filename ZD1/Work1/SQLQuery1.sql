---№1  Показать все поля из таблицы Production.ProductInventory.
select * from Production.ProductInventory

--№2  Показать поля ProductID, StartDate, EndDate из таблицы Production.ProductCostHistory.
select
	ProductID,
	StartDate,
	EndDate
From Production.ProductCostHistory

--№3  Показать поля ProductID, BusinessEntityID, AverageLeadTime, StandardPrice из таблицы Purchasing.ProductVendor, для товаров, 
--имеющих цену продажи (поле не пустое) при последней покупке (LastReceiptCost).
select
	ProductID,
	BusinessEntityID,
	AverageLeadTime,
	StandardPrice
From Purchasing.ProductVendor
Where LastReceiptCost is not null

--№4  Показать уникальные названия городов из таблицы Person.Address, у которых известна долгота и широта (SpatialLocation).
select DISTINCT [City] from Person.Address
where SpatialLocation is not null

--№5  Показать ID (ProductID), название (Name) и цвет (Color) товаров из таблицы Production.Product, содержащих в названии слово 'Chainring' (звездочка).
select
	ProductID, Name, Color
from Production.Product
where Name like '%Chainring%'

--№6  Показать ID (StateProvinceID) и название (Name) регионов или штатов, а также ID страны, на территории которой они располагаются (TerritoryID) из таблицы Person.StateProvince. 
--Показать только регионы из списка ('Alaska', 'Alabama', 'Colorado', 'Georgia', 'Iowa'), используя оператор IN.
select
	StateProvinceID, Name, TerritoryID
from Person.StateProvince
where Name in ('Alaska','Alabama','Colorado','Georgia','Iowa')

--№7  Показать поля PersonType, NameStyle, Title, FirstName, MiddleName, LastName из таблицы Person.Person. 
--Неизвестные значения поля Title заменить на 'Dear' (уважаемый). Названия полей оставить без изменений.
select 
	PersonType, NameStyle, Title,
	FirstName, MiddleName, LastName
from Person.Person
--update Person.Person
--set Title = 'Dear'
--where Title is null 

--№8  Показать поля ProductID, Name из таблицы Production.Product с применением функции COALESCE().
--Показать поле Measurement, так, чтобы, если значение в поле Class известно, то показать его, а иначе, показать значение в поле Color.
--Если и в поле Color значение неизвестно, то вывести значение 'UNKNOWN'.
select ProductID, Name,
coalesce(Class, Color,'UNKNOWN')
as Measurement
from Production.Product

--№9  Показать ID департамента (DepartmentID), название отдела (GroupName) и вид деятельности данного отдела (Name) из таблицы HumanResources.
--Department и отсортировать строки таблицы в алфавитном порядке вида деятельности (Name).
select
	DepartmentID, GroupName, Name
from HumanResources.Department
order by Name


--№10  Показать название фирмы (Name) из таблицы Purchasing.Vendor. Если фирма называется 'Advanced Bicycles', заменить значение поля Name на NULL. Названия полей оставить без изменений.
select 
	Name
from Purchasing.Vendor
--update Purchasing.Vendor
--set Name = 'Advanced Bicycles'
--where Name is null