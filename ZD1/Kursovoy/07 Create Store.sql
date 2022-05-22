CREATE TABLE Store (
  id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
  store_name varchar(255) NOT NULL,
  [address] varchar(255) NOT NULL
)
