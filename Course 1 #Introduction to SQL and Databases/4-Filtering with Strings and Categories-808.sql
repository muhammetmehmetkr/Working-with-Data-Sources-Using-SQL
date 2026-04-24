## 1. Finding Unique Values with SELECT DISTINCT ##

SELECT DISTINCT order_id, customer_name
FROM orders
WHERE city = 'Buffalo' and state = 'New York'

## 2. Filtering for Categories with IN ##

SELECT DISTINCT ship_mode, state
FROM orders
WHERE state 
in ('District of Columbia','North Dakota','Vermont','West Virginia')

## 3. Flipping the Script with NOT ##

SELECT order_id,city,state,sales
FROM orders
WHERE state not in ('California','Texas','New York')
and sales > 5000;

## 4. Searching for Text Patterns with LIKE (Part 1) ##

SELECT DISTINCT subcategory,product_name
FROM orders
WHERE product_name like '%keyboard%'

## 5. Searching for Text Patterns with LIKE (Part 2) ##

SELECT DISTINCT product_name from orders
WHERE product_name like 'Pr___ C_l____ %'

## 6. Parentheses for Multiple Criteria ##

SELECT product_name,subcategory, sales, profit
from orders
WHERE (sales>5000 and profit>1000) or (sales<10 and profit<-10)