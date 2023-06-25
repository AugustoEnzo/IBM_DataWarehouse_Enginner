#!/bin/sh

## Write your code here to load the data from sales_data table in Mysql server to a sales.csv.
## Select the data which is not more than 4 hours old from the current time.
mysql sales --user=root --password=MTI2NTMtZW56b2F1 -B -e "SELECT rowid, product_id, customer_id, price, quantity, timestamp FROM sales_data WHERE TIMESTAMPDIFF(HOUR, timestamp, CURRENT_TIMESTAMP) > 4;" \
| sed 's/\t/,/g' > sales.csv



export PGPASSWORD=MTE3MTgtZW56b2F1;



psql --username=postgres --host=localhost --dbname=sales_new -c "\COPY sales_data(rowid,product_id,customer_id,price,quantity,timestamp) FROM '/home/project/sales.csv' delimiter ',' csv header;" 

 ## Delete sales.csv present in location /home/project
echo "Cleaning futil files..."
rm sales.csv

 ## Write your code here to load the DimDate table from the data present in sales_data table

psql --username=postgres --host=localhost --dbname=sales_new -c  "INSERT INTO dimdate(dateid, day, month, year) \
SELECT to_char(timestamp, 'YYYYMMDD')::integer AS dateid, EXTRACT(DAY FROM timestamp) AS day, EXTRACT(MONTH FROM timestamp) AS month, EXTRACT(YEAR FROM timestamp) AS year FROM sales_data"

## Write your code here to load the FactSales table from the data present in sales_data table

psql --username=postgres --host=localhost --dbname=sales_new -c  "INSERT INTO factsales(rowid, product_id, custome_id, price, total_price) \
SELECT rowid, product_id, customer_id, price, price * quantity total_price FROM sales_data"

 ## Write your code here to export DimDate table to a csv

psql --username=postgres --host=localhost --dbname=sales_new -c "\copy (SELECT * FROM dimdate) TO '/home/project/DimDate.csv' WITH csv"

 ## Write your code here to export FactSales table to a csv
 
psql --username=postgres --host=localhost --dbname=sales_new -c "\copy (SELECT * FROM factsales) TO '/home/project/FactSales.csv' WITH csv"

