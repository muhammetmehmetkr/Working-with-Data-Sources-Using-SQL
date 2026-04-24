## 2. Using a Single CTE ##

WITH customer_avg_table AS (
  SELECT customer_id, AVG(total) AS total_avg
  FROM invoice
  GROUP BY customer_id
)
SELECT c.last_name, c.first_name, i.total_avg
FROM customer AS c
JOIN customer_avg_table AS i
ON c.customer_id = i.customer_id;

## 3. Multiple CTEs ##

WITH country_invoice_total_table as (
SELECT billing_country, SUM(total) AS invoice_total
  FROM invoice
 GROUP BY billing_country
),
country_total_table as (
SELECT country, COUNT(*) AS customer_tally
  FROM customer
 GROUP BY country
)
SELECT ct.country, 
        ROUND(i.invoice_total / ct.customer_tally, 2) AS sale_avg
  FROM (country_invoice_total_table) AS i
  JOIN (country_total_table) AS ct
    ON i.billing_country = ct.country
 ORDER BY sale_avg DESC
 LIMIT 5;

## 4. CTE Constraints ##

WITH
usa_invoice_table AS (
SELECT invoice_id 
  FROM invoice 
 WHERE billing_country = 'USA'
),
invoice_line_track_table AS (
SELECT il.*, t.milliseconds, t.genre_id 
  FROM invoice_line il 
  JOIN track t 
    ON il.track_id = t.track_id 
),
usa_track_table AS ( 
SELECT i.* 
  FROM invoice_line_track_table i 
  JOIN usa_invoice_table u 
    ON i.invoice_id = u.invoice_id 
), 
metal_genre_table AS (
SELECT genre_id 
  FROM genre
 WHERE name LIKE '%Metal%' 
),
metal_usa_track_table AS ( 
SELECT * 
  FROM usa_track_table u 
  JOIN metal_genre_table m 
    ON u.genre_id = m.genre_id 
) 
SELECT invoice_id AS invoice_id, SUM(quantity * unit_price) AS total, SUM(milliseconds)/1000.0/60 AS minute 
  FROM metal_usa_track_table 
 GROUP BY invoice_id

## 7. Recursive CTEs Anatomy ##

WITH RECURSIVE
managers_chain(employee_id, path) AS (

SELECT employee_id, last_name || ' ' || first_name AS path 
  FROM employee
 WHERE reports_to IS NULL
 
 UNION ALL
 
SELECT e.employee_id,
       m.path || '<--' || e.last_name || ' ' || e.first_name AS path
FROM employee e
JOIN managers_chain m ON e.reports_to = m.employee_id
)
 
SELECT path
  FROM managers_chain;