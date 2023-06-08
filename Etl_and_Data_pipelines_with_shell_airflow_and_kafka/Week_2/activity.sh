echo "database" | cut -c1-4

echo "database" | cut -c5-8

echo "database" | cut -c1,5

cut -d":" -f1 /etc/passwd

cut -d":" -f1,3,6 /etc/passwd

cut -d":" -f3-6 /etc/passwd

echo "Shell Scripting" | tr "[a-z]" "[A-Z]"

echo "Shell Scripting" | tr "[:lower:]" "[:upper:]"

echo "Shell Scripting" | tr  "[A-Z]" "[a-z]"

ps | tr -s " "

echo "My login pin is 5634" | tr -d "[:digit:]"

start_postgres

`psql --username=postgres --host=localhost`

psql --username=postgres --host=localhost

\c template1

create table users(username varchar(50),userid int,homedirectory varchar(100));

\q

cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt

cat extracted-data.txt

# Transform phase
echo "Transforming data"
# read the extracted data and replace the colons with commas.

tr ":" "," < extracted-data.txt

tr ":" "," < extracted-data.txt > transformed-data.csv

# Load phase
echo "Loading data"
# Send the instructions to connect to 'template1' and
# copy the file to the table 'users' through command pipeline.

echo "\c template1;\COPY users  FROM '/home/project/transformed-data.csv' DELIMITERS ',' CSV;" | psql --username=postgres --host=localhost

bash csv2db.sh

echo '\c template1; \\SELECT * from users;' | psql --username=postgres --host=localhost