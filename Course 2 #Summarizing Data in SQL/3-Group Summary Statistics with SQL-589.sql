## 1. Introduction ##

SELECT COUNT(*) as num_row
from invoice
WHERE billing_country="USA"

## 2. Counting Rows by Group ##

SELECT billing_country, COUNT(*) AS num_row
FROM invoice
GROUP BY billing_country

## 3. Summary Statistics by Group ##

SELECT invoice_id, SUM(unit_price*quantity) as total
FROM invoice_line
GROUP BY invoice_id
LIMIT 5

## 6. Summary Statistics by Group Under Conditions ##

SELECT billing_state,COUNT(*) as num_row, AVG(total) as avg_sale
from invoice
WHERE billing_country='USA'
GROUP BY billing_state

## 7. Summary Statistics by Ordered Groups ##

SELECT track_id, COUNT(*) as num_row, sum(unit_price*quantity) as overall_sale
from invoice_line
GROUP by track_id
ORDER BY overall_sale DESC, num_row DESC
LIMIT 5;