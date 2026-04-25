## 1. Understanding Data Types ##

SELECT sales, 
discount,profit from orders

## 2. Table Information with PRAGMA ##

PRAGMA table_info(orders)

## 3. Operating on Numeric Columns ##

select order_id, sales, profit,
profit/sales as profit_margin
from orders
limit 8;

## 4. Integer Division ##

SELECT product_id,
quantity, 
CAST(quantity as REAL)/2 as even_or_odd
from orders
limit 5;

## 5. Functions on Fields: ROUND() ##

SELECT order_id,sales,quantity,
round(sales/quantity,2) as price_per_unit
from orders limit 10;

## 6. Functions on Fields: UPPER() and LOWER() ##

select LOWER(customer_name) as customer_name_lower
from orders

## 7. Concatenating Fields ##

SELECT order_id, region, state,
"Superstore" || " " || city as local_store
from orders limit 10;

## 8. Constant Values ##

select person, region,
51000 as salary
from managers