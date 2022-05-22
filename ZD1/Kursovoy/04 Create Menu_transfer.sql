CREATE TABLE Menu_transfer (
  id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
  menu_id bigint NOT NULL,
  store_id bigint NOT NULL
)
