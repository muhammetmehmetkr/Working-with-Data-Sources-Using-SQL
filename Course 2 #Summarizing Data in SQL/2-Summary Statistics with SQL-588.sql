## 1. Introduction ##

SELECT name,album_id,milliseconds
from track
WHERE unit_price>=1

## 2. Using Several Statistics in a Column ##

SELECT MIN(milliseconds) as min_runtime,
MAX(milliseconds) as max_runtime
from track

## 3. Using Aggregate Functions with Computed Columns ##

SELECT AVG(milliseconds / 1000.0 / 60) as avg_runtime_minutes,
AVG(bytes / 1024.0 / 1024) as avg_size_megabyte
from track

## 4. Combining Aggregate and Scalar Functions ##

SELECT AVG(milliseconds/1000.0/60) as avg_runtime_minutes,
ROUND(AVG(milliseconds / 1000.0 / 60), 2) AS avg_runtime_minutes_rounded
from track

## 5. Combining Aggregate Functions with Arithmetic Operators ##

SELECT AVG(milliseconds) as avg_runtime,
SUM(milliseconds)*1.0 / COUNT(milliseconds) as another_avg_runtime
from track

## 6. Summary Statistics Under a Condition ##

SELECT sum(milliseconds/1000.0/60) as total_runtime_minutes
from track
WHERE unit_price=1.99