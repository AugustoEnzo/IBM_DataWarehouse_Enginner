#echo"\c template1; CREATE TABLE IF NOT EXISTS access_logs (timestamp timestamp, latitude float, longitude float, visitorid char(37), accessed_from_mobile boolean, browser_code int);" | psql --username=postgres --host=localhost

if [[ ! -f web-server-access-log.txt.gz ]]; then
    wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz

echo "Getting the data"

gunzip web-server-access-log.txt.gz

echo "Extracting the data"

cut -d"#" -f 1-6 /home/project/web-server-access-log.txt > extracted-data.txt

echo "Transforming the data"

tr "#" "," < extracted-data.txt > transformed-data.csv

echo "Loading the data"

echo "\c template1;\COPY access_logs FROM '/home/project/transformed-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost