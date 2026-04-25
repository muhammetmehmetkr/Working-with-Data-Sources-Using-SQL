## 3. Connecting to the Database ##

import sqlite3

conn = sqlite3.connect("jobs.db")

## 6. Creating a Cursor and Running a Query ##

import sqlite3
conn = sqlite3.connect("jobs.db")
cursor = conn.cursor()

query = "select Major from recent_grads;"
cursor.execute(query)
results = cursor.fetchall()
majors = results
print(results[0:3])

## 8. Fetching a Specific Number of Results ##

import sqlite3
conn = sqlite3.connect("jobs.db")
#cursor = conn.cursor()
query = 'Select Major, Major_category from recent_grads'

five_results = conn.execute(query).fetchmany(5)

## 9. Closing the Database Connection ##

conn = sqlite3.connect("jobs.db")
conn.close()

## 10. Practice ##

import sqlite3
connection = sqlite3.connect("jobs2.db")
query = "Select Major from recent_grads order by Major Desc;"
reverse_alphabetical = connection.execute(query).fetchall()

connection.close()