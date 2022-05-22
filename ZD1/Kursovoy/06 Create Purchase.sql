CREATE TABLE Purchase (
  id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
  [count] int NOT NULL,
  [date] date NOT NULL,
  [cost] int NOT NULL,
  ingredient_id varchar(255) NOT NULL
)
