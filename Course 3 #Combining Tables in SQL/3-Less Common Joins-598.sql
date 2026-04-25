## 1. Self-joins ##

SELECT e.first_name || " " || e.last_name as employee,
m.first_name || " " || m.last_name as manager
from employee as e
join employee as m
on e.reports_to=m.employee_id

## 2. LEFT JOIN ##

SELECT 1;

## 3. LEFT JOIN (continuation) ##

SELECT e.first_name || " " || e.last_name as employee,
m.first_name || " " || m.last_name as manager
from employee as e
LEFT join employee as m
on e.reports_to = m.employee_id

## 4. CROSS JOIN ##

SELECT c.first_name,c.last_name,c.email,c2.first_name,c2.last_name
from customer as c
CROSS join customer as c2
WHERE not c.customer_id=c2.customer_id

## 6. Joining on Conditions ##

SELECT t.track_id, t.name, COUNT(i.invoice_id) as no_of_purchases
from track as t
left join invoice_line as il
on il.track_id=t.track_id
left  join invoice as i
on i.invoice_id=il.invoice_id 
and i.invoice_date between '2020-01-01' and '2020-12-31'
GROUP by t.track_id,t.name

## 7. Joining on Conditions (continuation) ##

SELECT i1.invoice_id, i1.invoice_date,i1.total as total ,
ROUND(sum(i2.total),2) as running_total

       --i2.invoice_id AS previous_invoice_id
       --i2.invoice_date AS previous_invoice_date,
       --i2.total AS previous_total
  FROM invoice i1
  JOIN invoice i2
    ON i1.invoice_id >= i2.invoice_id and i1.invoice_date>=i2.invoice_date
 GROUP BY i1.invoice_id,i1.invoice_date, i1.total;