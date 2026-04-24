------------------------------ GIVING INFORMATION ABOUT ALL TABLES ------------------------------
SELECT 'customers' as table_name,
(select COUNT(*) FROM pragma_table_info('customers')) as number_of_attributes,
(SELECT count(*) from customers) as number_of_rows
UNION ALL
SELECT 'products' as table_name,
(select COUNT(*) FROM pragma_table_info('products')) as number_of_attributes,
(SELECT count(*) from products) as number_of_rows
UNION ALL
SELECT 'productlines' as table_name,
(select COUNT(*) FROM pragma_table_info('productlines')) as number_of_attributes,
(SELECT count(*) from productlines) as number_of_rows
UNION ALL
SELECT 'orders' as table_name,
(select COUNT(*) FROM pragma_table_info('orders')) as number_of_attributes,
(SELECT count(*) from orders) as number_of_rows
UNION ALL
SELECT 'orderdetails' as table_name,
(select COUNT(*) FROM pragma_table_info('orderdetails')) as number_of_attributes,
(SELECT count(*) from orderdetails) as number_of_rows
UNION ALL
SELECT 'payments' as table_name,
(select COUNT(*) FROM pragma_table_info('payments')) as number_of_attributes,
(SELECT count(*) from payments) as number_of_rows
UNION ALL
SELECT 'employees' as table_name,
(select COUNT(*) FROM pragma_table_info('employees')) as number_of_attributes,
(SELECT count(*) from employees) as number_of_rows
UNION ALL
SELECT 'offices' as table_name,
(select COUNT(*) FROM pragma_table_info('offices')) as number_of_attributes,
(SELECT count(*) from offices) as number_of_rows

----------------------------------------------------------------------------------------------
with stock as (
select p.productName,p.productCode, 
(select FLOOR((sum(o.quantityOrdered)*1.0/p.quantityInStock)*100)/100.0
from orderdetails o
WHERE o.productCode = p.productCode) as low_stock
from products p
group by p.productCode,p.productName
order by low_stock desc
),
performance as (
select o.productCode, sum(o.quantityOrdered*o.priceEach) as product_performance
FROM orderdetails o
group by o.productCode 
order by product_performance desc
)
select s.productName,s.productCode, s.low_stock
from stock s
where s.productCode in (select p.productCode  from performance p)
order by low_stock desc
limit 10
;

----------------------------------------------------------------------------------------------
select o.customerNumber ,round(SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)),2) as profit
  FROM products p 
  join orderdetails od 
    on p.productCode = od.productCode 
  join orders o 
    on o.orderNumber = od.orderNumber 
 GROUP BY o.customerNumber
 order by profit desc;

----------------------------------------------------------------------------------------------
WITH 
profit_cte as (
select o.customerNumber ,
       round(SUM(od.quantityOrdered * (od.priceEach - p.buyPrice)),2)
       as profit
  FROM products p 
  join orderdetails od 
    on p.productCode = od.productCode 
  join orders o 
    on o.orderNumber = od.orderNumber 
 GROUP BY o.customerNumber
 order by profit desc
)
select  c.contactFirstName , c.contactLastName, c.country, c.city, p.profit 
from customers c 
join profit_cte p
on p.customerNumber = c.customerNumber 
order by p.profit asc
limit 5;

----------------------------------------------------------------------------------------------
with cltv as (
select count(distinct c.customerName) as total_customer, 
round(sum(od.quantityOrdered * (od.priceEach - p.buyPrice)),2) as profit
from customers c 
join orders o 
on c.customerNumber = o.customerNumber 
join orderdetails od
on od.orderNumber = o.orderNumber 
join products p 
on p.productCode = od.productCode
)
select ROUND(profit/total_customer,2) as CLTV
from cltv

































