--№1. Показать номера телефонов (PhoneNumber) и поля PersonType, FirstName, LastName из таблиц Person.Person, Person.PersonPhone.

select
	FirstName,
	LastName,
	PersonType,
	PhoneNumber
From Person.Person inner join Person.PersonPhone
on Person.Person.BusinessEntityID = PersonPhone.BusinessEntityID


--№2. Показать список продуктов (поле Name) в котором указано, есть ли у продукта название модели или нет, 
--из таблиц Production.ProductionModel, Production.Product, используя LEFT OUTER JOIN.
select *
from Production.ProductModel
select *
from Production.Product

select 
	Product.Name
From Production.ProductModel Left Outer Join Production.Product
on Production.ProductModel.Name = Production.Product.Name



--№3. Показать список ID людей (поле BusinessEntityId), в котором указано, работает ли человек в магазине или нет,
-- из таблиц Sales.Store, Person.BusinessEntity, используя RIGHT OUTER JOIN.
select *
from Sales.Store
select *
from Person.BusinessEntity
select 
	Person.BusinessEntity.BusinessEntityID

From Person.BusinessEntity Right Outer Join Sales.Store
on Sales.Store.BusinessEntityID = Person.BusinessEntity.BusinessEntityID

--№4. Показать список продуктов (ProductID), которые содержатся на нескольких складах (LocationID), из таблицы Production.ProductInventory, используя SELF JOIN.
select *
from Production.ProductInventory


select distinct e.ProductID, e.LocationID
from Production.ProductInventory as e
inner join Production.ProductInventory AS m
on e.ProductID = m.ProductID
and e.LocationID <> m.LocationID
order by ProductID


--№5. Показать список складов (LocationID), на которых содержатся несколько продуктов (ProductID), из таблицы Production.ProductInventory, используя SELF JOIN.

SELECT DISTINCT v1.*
FROM Production.ProductInventory AS v1
INNER JOIN Production.ProductInventory AS V2
ON v1.ProductID = v2.ProductID
WHERE v1.LocationID <> v2.LocationID



--№6. Показать список продуктов из таблицы Production.Product с таким же цветом как у продукта ML Road Frame-W - Yellow, 38, используя SELF JOIN.
SELECT DISTINCT
	p2.[Name]
	,p2.Color
	,p2.ListPrice
FROM Production.Product AS p1
INNER JOIN Production.Product AS p2
ON (p1.ListPrice = p2.ListPrice)
AND p1.[Name] = 'ML Road Frame-W - Yellow, 38'


--№7. Показать комбинированный список таблиц Person.AddressType, Person.ContactType по полям ID, Name, ModifiedDate, используя UNION.
select *
from Person.AddressType
select *
from Person.ContactType

SELECT AddressTypeID, Name, ModifiedDate
FROM Person.AddressType
UNION
SELECT ContactTypeID, Name, ModifiedDate
FROM Person.ContactType;

--№8. Показать список ID, которые содержатся в таблице Sales.Store (поле BusinessEntityID), но не содержатся в таблице Sales.Customer (поле CustomerID).
select *
from  Sales.Store
select *
from Sales.Customer

select BusinessEntityID
from  Sales.Store
except 
select CustomerID
from Sales.Customer

