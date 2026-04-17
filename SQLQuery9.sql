-- CHECK CONSTRAINT
ALTER TABLE Products
ADD CONSTRAINT chk_price_cost
CHECK (Price <= 2 * Cost);


