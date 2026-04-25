## 1. Introduction ##

SELECT invoice_id, customer_id, invoice_date,billing_country,total 
  from invoice
limit 3;

## 2. Column Sum ##

SELECT SUM(total) as overall_sale
from invoice

## 3. Column Average ##

SELECT AVG(total) as avg_sale
from invoice

## 4. Minimum and Maximum Values in a Numeric Column ##

SELECT MAX(total) as max_sale
from invoice

## 5. First and Last Values in a Text Column ##

SELECT MAX(billing_country) as last_billing_country
from invoice

## 6. Counting Rows ##

SELECT COUNT(*) as num_rows
from invoice

## 7. Counting Rows with Missing Values ##

SELECT COUNT(composer) as num_composers
from track