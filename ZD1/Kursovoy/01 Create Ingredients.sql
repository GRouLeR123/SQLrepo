CREATE TABLE Ingredients (
  id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
  [name] varchar(255) NOT NULL UNIQUE([name]),
  [count] int NOT NULL,
  [delivery_id] bigint NOT NULL
)

--USE bakery
--DROP TABLE Ingredients, Menu, Menu_ingredients, Menu_transfer,
--Produced, Purchase, Store, Suplier

--