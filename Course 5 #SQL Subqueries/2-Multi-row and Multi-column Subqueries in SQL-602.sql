## 1. Introduction ##

SELECT COUNT(*) AS tracks_tally
  FROM track
 WHERE media_type_id IN (SELECT media_type_id
  FROM media_type
 WHERE name LIKE '%MPEG%');

## 2. Subqueries as Lists ##

SELECT * 
FROM invoice
WHERE customer_id in (SELECT customer_id FROM customer
                     WHERE first_name like 'A%')

## 3. NOT IN Operator ##

SELECT first_name, last_name FROM customer
WHERE customer_id not in (SELECT customer_id FROM invoice
GROUP by customer_id
having SUM(total)<100)

## 4. Subqueries as Tables ##

SELECT AVG(billing_city_tally) AS billing_city_avg
  FROM (SELECT billing_city, COUNT(*) AS billing_city_tally
          FROM invoice
         GROUP BY billing_city);

## 5. Multi-Column Subqueries and Joins ##

SELECT last_name,first_name, i.total_avg
FROM customer c
JOIN (SELECT customer_id, AVG(total) total_avg
                    from invoice
                    GROUP by customer_id) as i
on i.customer_id=c.customer_id
              

## 6. Join Multi-Columns Subqueries ##

SELECT ct.country, (i.invoice_tally/ct.customer_tally) as sale_avg_tally
from (SELECT billing_country, COUNT(*) AS invoice_tally
        FROM invoice
       GROUP BY billing_country) as i
join (SELECT country , COUNT(*) AS customer_tally
        FROM customer
       GROUP BY country) as ct
on i.billing_country = ct.country
ORDER by sale_avg_tally DESC;