## 3. UNION ##

SELECT * from invoice_2017q1_2018q2
UNION
SELECT * FROM invoice_2018q1_2018q4

## 5. UNION ALL ##

SELECT invoice_id, customer_id,invoice_date,total
FROM invoice_2017q1_2018q2
UNION ALL 
SELECT invoice_id, customer_id,invoice_date,total
FROM invoice_2018q1_2018q4

## 6. INTERSECT ##

   SELECT *
     FROM invoice_2017q1_2018q2
INTERSECT
   SELECT *
     FROM invoice_2018q1_2018q4
     

## 7. EXCEPT ##

SELECT *
FROM invoice_2017q1_2018q2

EXCEPT

SELECT *
FROM invoice_2018q1_2018q4
ORDER BY invoice_date desc

## 8. Set Operators Use Cases ##

SELECT *
FROM track
WHERE milliseconds>60000

INTERSECT

SELECT *
FROM track
WHERE milliseconds<120000