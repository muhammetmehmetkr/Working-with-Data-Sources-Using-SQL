## 2. Filtering with Correlated Subqueries ##

SELECT invoice_id, billing_country
from invoice i
WHERE i.total>(SELECT AVG(total)
   from invoice as i2
  where i.billing_country=i2.billing_country)

## 3. EXISTS Operators ##

SELECT track_id
FROM track t 
WHERE NOT EXISTS(
SELECT track_id FROM invoice_line il
    WHERE t.track_id = il.track_id
)

## 4. Nested Subqueries ##

SELECT last_name,first_name
FROM employee
WHERE employee_id IN
(SELECT support_rep_id
from customer
WHERE customer_id in (SELECT customer_id
                        FROM invoice
                       GROUP BY customer_id
                      HAVING SUM(total)>100))
                      

## 6. Writing Effective Subqueries ##

SELECT invoice_id, SUM(il.quantity*il.unit_price) as total,
sum(t.milliseconds)/1000.0/60 as minute
  FROM invoice_line il
  JOIN track t
    ON il.track_id = t.track_id
 WHERE invoice_id IN (SELECT invoice_id 
                        FROM invoice
                       WHERE billing_country = 'USA') and t.genre_id IN (SELECT genre_id
                                                             from genre
                                                            WHERE name LIKE "%Metal%")
GROUP by invoice_id;