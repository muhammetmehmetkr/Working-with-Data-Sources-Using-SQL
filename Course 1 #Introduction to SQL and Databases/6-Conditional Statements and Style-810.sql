## 1. Conditional Statements ##

SELECT order_id, state, sales,
CASE
    WHEN region='Central'or region='South' THEN 'Territory 1'
    ELSE 'Territory 2'
END as territory
from orders

## 2. Binning Continuous Variables With CASE ##

SELECT order_id,product_id,sales,
CASE
    WHEN sales BETWEEN 0 and 49.99 THEN 'small sale'
    WHEN sales BETWEEN 50 and 99.99 then 'medium sale'
    ELSE 'large sale'
end as sales_size
from orders

## 3. Grouping Categorical Values With CASE ##

SELECT order_date,order_id, ship_mode,
CASE 
    WHEN ship_mode = 'Same Day' THEN 'High Priority'
    WHEN ship_mode = 'First Class' THEN 'Medium Priority'
    ELSE 'Low Priority'
END as ship_priority
from orders
order by order_date DESC

## 4. Not Accounting for ELSE ##

SELECT order_id,product_name,
profit/sales as profit_margin,
CASE
    WHEN profit/sales >0.3 THEN 'Great'
    WHEN profit/sales <0.1 then 'Terrible'
END as profit_category
from orders
WHERE subcategory='Supplies' and city='Los Angeles'
order by profit_category DESC;

## 5. Ordering by Expressions ##

SELECT segment, subcategory,product_name,sales,profit
from orders
where city='Watertown'
order by CASE
      WHEN segment='Corporate' then 1
      when segment='Consumer' then 2
      ELSE 3
      END;