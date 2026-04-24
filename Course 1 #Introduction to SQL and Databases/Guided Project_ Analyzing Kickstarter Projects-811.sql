## 1. Retrieving Column Data Types ##

PRAGMA table_info(ksprojects)

## 2. Initial Selection of Rows and Columns ##

SELECT main_category,goal,backers,pledged from ksprojects
LIMIT 10;

## 3. Filtering by Category ##

SELECT main_category,goal,backers,pledged 
from ksprojects
where state in ('failed','canceled','suspended')
LIMIT 10;

## 4. Filtering by Quantity ##

SELECT main_category, backers, pledged, goal
 FROM ksprojects
WHERE state IN ('failed', 'canceled', 'suspended')
AND (backers>=100 and pledged>=20000)
LIMIT 10;

## 5. Ordering Results ##

SELECT main_category, backers, pledged, goal,
pledged/goal as pct_pledged
  FROM ksprojects
 WHERE state IN ('failed')
   AND backers >= 100 AND pledged >= 20000
   order by main_category asc, pct_pledged desc
 LIMIT 10;

## 6. Applying Conditional Logic ##

  SELECT main_category, backers, pledged, goal,
         pledged / goal AS pct_pledged,
         CASE
            WHEN pledged/goal>=1 THEN 'Fully funded'
            WHEN pledged/goal BETWEEN 0.75 and 1.0 THEN 'Nearly funded'
            WHEN pledged/goal<0.75 THEN 'Not nearly funded'
            END as funding_status
    FROM ksprojects
   WHERE state IN ('failed')
     AND backers >= 100 AND pledged >= 20000
ORDER BY main_category, pct_pledged DESC
   LIMIT 10;