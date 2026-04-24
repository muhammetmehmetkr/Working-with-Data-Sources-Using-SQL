## 1. Sorting, Ascending vs. Descending ##

SELECT order_id,product_name,profit
from orders
ORDER by profit desc

## 2. Ordering by Multiple Fields ##

SELECT product_name, sales, discount, profit
from orders
order by discount desc, profit asc

## 4. ORDER BY with WHERE ##

SELECT subcategory, sales,profit
from orders 
WHERE category='Furniture'
order by sales desc, profit asc

## 5. ORDER BY vs LIMIT ##

SELECT order_id,category,quantity
from orders
WHERE category='Office Supplies' and region='Central'
order by quantity DESC
LIMIT 10;

## 6. Revisiting the Order of Execution ##

SELECT product_name, sales/quantity as price_per_unit
from orders
WHERE sales/quantity<95
ORDER by price_per_unit desc
LIMIT 10

--Unlike the WHERE clause, we are able to use aliases in ORDER BY because it comes after they have been defined in the SELECT clause.

## 7. Coding with Style ##

SELECT subcategory, product_name, quantity 
  FROM   orders
 WHERE  category = 'Furniture' 
 ORDER  BY product_name 
 LIMIT  10;