## 1. Introduction ##

SELECT billing_country, 
       ROUND(COUNT(*)*100.0/
             (SELECT COUNT(*) 
                FROM invoice), 2)  AS sales_prop
  FROM invoice
 GROUP BY billing_country
 ORDER BY sales_prop DESC
 LIMIT 5;

## 3. Subqueries Vocabulary ##

SELECT billing_country,
SUM(total)/(SELECT SUM(total) FROM invoice) as country_share
FROM invoice
GROUP by billing_country
ORDER by country_share DESC
LIMIT 5 ;

## 4. Subqueries Guidelines ##

SELECT COUNT(*) AS rows_tally 
  FROM invoice 
 WHERE total > (SELECT AVG(total) AS total_avg 
                  FROM invoice);

## 5. Filtering with Scalar Subqueries ##

SELECT count(*) as total_row
from invoice
where total > (SELECT MAX(total)*0.75 from invoice);

## 6. Filtering Aggregate Results with Scalar Subqueries ##

SELECT customer_id, AVG(total) as customer_avg
FROM invoice
GROUP by customer_id
HAVING AVG(total) > (SELECT AVG(total) 
                       FROM invoice
                       WHERE customer_id=5)