## 1. Basic Comparison Operators ##

SELECT order_id, product_name,
sales,discount,profit
from orders
WHERE profit<-1000;

## 2. Order of Execution ##

SELECT order_id,
subcategory,product_name,
round(sales/quantity,2) as price_per_unit
from orders
where sales/quantity < 0.50

## 4. Checking for Membership in a Consecutive Range ##

SELECT order_id, product_id,
sales*0.1 as sales_tax
from orders
where sales*0.1 BETWEEN 1 and 2;

## 5. Checking for Membership in a Non-Consecutive Range ##

SELECT order_id,
product_name,sales,quantity
from orders
WHERE sales in (3,14,15);

## 6. Checking for Missing Values ##

SELECT *
from orders
WHERE segment is null; -- 16 row null

## 7. AND Statements ##

SELECT product_name,
sales/quantity as price_per_unit
from orders
WHERE subcategory='Storage' and sales/quantity>300;

## 8. OR Statements ##

SELECT product_name,
profit, quantity
from orders
where profit<0 or quantity=1;