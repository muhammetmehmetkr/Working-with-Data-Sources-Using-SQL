## 3. The Syntax ##

SELECT *
FROM invoice_line as i
join track as t 
on i.track_id = t.track_id
limit 10

## 4. How Joins Work ##

SELECT *
  FROM track
  JOIN invoice_line
    ON track.track_id = invoice_line.track_id;

## 5. Selecting Columns ##

SELECT customer.customer_id, first_name,last_name,email,
invoice_id,invoice_date,total
from invoice
JOIN customer
on customer.customer_id=invoice.customer_id
limit 10

## 6. Selecting All Columns from One Table ##

--Selecting All Columns from One Table
SELECT album.album_id, album.title, album.artist_id, artist.name
  FROM album
  JOIN artist
    ON album.artist_id = artist.artist_id;

## 7. Aliasing in Joins ##

SELECT t.track_id, t.name as track_name,
       t.composer,g.name as genre
  from track as t
  join genre g
    on g.genre_id = t.genre_id
 limit 10;