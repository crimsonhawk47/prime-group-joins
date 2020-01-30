-- Tasks
-- 1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city, "addresses".state, "addresses".zip FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;
-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "orders".order_date, "line_items".quantity , "products".description FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id
JOIN "products" ON "line_items".product_id = "products".id;
-- 3. Which warehouses have cheetos?
SELECT warehouse.warehouse FROM warehouse_product
JOIN warehouse on warehouse.id = warehouse_id
JOIN products on products.id = product_id
WHERE products.description ILIKE 'cheetos'
-- 4. Which warehouses have diet pepsi?
SELECT warehouse.warehouse FROM warehouse_product
JOIN warehouse on warehouse.id = warehouse_id
JOIN products on products.id = product_id
WHERE products.description ILIKE 'diet pepsi'

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(*) FROM orders
JOIN addresses ON address_id = addresses.id
JOIN customers on customers.id = addresses.customer_id
group by customers.first_name, customers.last_name;

-- 6. How many customers do we have?
SELECT COUNT(*) from customers

-- 7. How many products do we carry?
SELECT COUNT(*) from products

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM products
JOIN warehouse_product on warehouse_product.product_id = products.id
where description ilike 'diet pepsi'

-- Stretch
-- 9. How much was the total cost for each order?


-- 10. How much has each customer spent in total?


-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).

