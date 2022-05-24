CREATE TABLE Produced (
  id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
  [count] int NOT NULL,
  [date] date NOT NULL,
  menu_id bigint NOT NULL
)
