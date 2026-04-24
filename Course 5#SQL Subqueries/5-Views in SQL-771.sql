## 2. Creating and Querying Views ##

CREATE VIEW customer_email (
       customer_id, first_name, last_name, country, partial_email
  ) AS
SELECT customer_id, first_name,
       last_name, country,
       '****' || SUBSTRING(email, 5) AS email
  FROM customer;
  
  SELECT *
  FROM customer_email
 LIMIT 3;

## 3. Destroying Views ##

CREATE VIEW manager AS
SELECT employee_id, first_name, last_name, title, email
  FROM employee
 WHERE employee_id IN (SELECT DISTINCT reports_to FROM employee);
 
DROP VIEW manager;

SELECT * from manager;

## 4. Optional Column Names ##

CREATE VIEW german_customers as SELECT
last_name, first_name, country FROM customer; 

SELECT * from german_customers
WHERE country='Germany'
;

## 5. Creating Complex Views ##

--drop view genres_most_revenue
CREATE VIEW genres_most_revenue
(genre_name,total_amount) as 
SELECT g.name, SUM(il.unit_price*il.quantity) as total_amount
FROM track t
JOIN genre g on g.genre_id=t.genre_id
join invoice_line il on t.track_id = il.track_id
GROUP by g.name
HAVING SUM(il.unit_price*il.quantity)>100;
SELECT genre_name,total_amount from genres_most_revenue;

## 6. Creating Views from Views ##

--drop view total_sales_customers;
--drop view customer_purchase;
CREATE view customer_purchase
(customer_no,genre_name,unit_price,quantity) as 
SELECT c.customer_id, g.name,il.unit_price,il.quantity
from track t
JOIN genre g on g.genre_id=t.genre_id
join invoice_line il on il.track_id=t.track_id
JOIN invoice i on i.invoice_id=il.invoice_id
join customer c on c.customer_id=i.customer_id;

CREATE view total_sales_customers AS
SELECT genre_name, SUM(unit_price*quantity) as total_amount, 
COUNT(customer_no) as customer_count
FROM customer_purchase
group by genre_name
order by customer_count desc;

SELECT * 
FROM total_sales_customers;

## 7. Dropping Views with Dependencies ##

DROP VIEW customer_purchase CASCADE;
SELECT * from total_sales_customers;