## 1. Introduction ##

SELECT order_id, product_name, sales, quantity,
       CASE 
       WHEN sales BETWEEN 0 AND 50 THEN 'small sale'
       WHEN sales BETWEEN 51 AND 100 THEN 'medium sale'
       ELSE 'large sale'
       END AS sales_amount                        
  FROM orders
 WHERE order_id LIKE 'CA%'
 ORDER BY quantity
 LIMIT 3;

## 2. Reading From a Table ##

select * from orders
limit 5;

## 3. Different SQL Dialects ##

select * from returns limit 4;

## 4. SELECT Rows and Fields ##

select order_date, order_id,product_name,
sales,quantity from orders limit 5;

## 5. Defining Relational Databases ##

SELECT city, state, region
from orders limit 10;

## 6. Aliasing Results ##

SELECT city as 'City',
state as 'State',
postal_code as 'ZIP Code'
from orders LIMIT 10;

## 7. Hello, Comments! ##

SELECT city, state, postal_code, country 
  FROM orders
 LIMIT 4; --"This query shows city, state, postal code, and country information."
 
 /*SELECT country, state, postal_code, city
   FROM orders
  LIMIT 4;*/