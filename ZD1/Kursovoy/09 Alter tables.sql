ALTER TABLE Ingredients
  ADD CONSTRAINT Ingredients_Suplier FOREIGN KEY (delivery_id) 
  REFERENCES Suplier (id);

ALTER TABLE Menu_ingredients
  ADD CONSTRAINT Menu_ingredients_Ingredients FOREIGN KEY (ingredients_id) 
  REFERENCES Ingredients (id);
ALTER TABLE Menu_ingredients
  ADD CONSTRAINT Menu_ingredients_Menu FOREIGN KEY (menu_id) 
  REFERENCES Menu (id);

ALTER TABLE Menu_transfer
  ADD CONSTRAINT Menu_transfer_Menu FOREIGN KEY (menu_id) 
  REFERENCES Menu (id);
ALTER TABLE Menu_transfer
  ADD CONSTRAINT Menu_transfer_Store FOREIGN KEY (store_id) 
  REFERENCES Store (id);

ALTER TABLE Produced
  ADD CONSTRAINT Produced_Menu FOREIGN KEY (menu_id) 
  REFERENCES Menu (id);

ALTER TABLE Purchase
  ADD CONSTRAINT Purchase_Ingredients FOREIGN KEY (ingredient_id) 
  REFERENCES Ingredients ([name]);
