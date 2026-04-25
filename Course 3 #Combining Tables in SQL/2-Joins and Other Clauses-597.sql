## 1. The Order of Execution ##

SELECT *
from track as t
join invoice_line as i
on t.track_id = i.track_id
LIMIT 3;

## 3. Joining and WHERE ##

SELECT * 
FROM track as t
JOIN invoice_line as i
on t.track_id = i.track_id
WHERE i.invoice_id = 19

## 4. Joining and GROUP BY ##

SELECT g.name as genre, COUNT(*) as num_of_tracks
from track as t
join genre as g
on g.genre_id = t.genre_id
GROUP BY genre

## 6. Joining and JOIN ##

SELECT i.*,e.first_name
from invoice as i
join customer as c
on c.customer_id = i.customer_id
join employee as e
on c.support_rep_id = e.employee_id
limit 10