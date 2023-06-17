# A typical imports block looks like this:
# Python code
from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

# Defining DAG arguments

# You can override them on a per-task basis during operator initialization
default_args = {
  'owner': 'Ramesh Sannareddy',
  'start_date': days_ago(0),
  'email': ['ramesh@somemail.com']
  'email_on_failure': True,
  'email_on_retry': True,
  'retries': 1,
  'retry_delay': timedelta(minutes=5),
}

#DAG arguments are like settings for the DAG.

#The above settings mention

#the owner name,
#when this DAG should run from: days_age(0) means today,
#the email address where the alerts are sent to,
#whether alert must be sent on failure,
#whether alert must be sent on retry,
#the number of retries in case of failure, and
#the time delay between retries.
#A typical DAG definition block looks like this.

# define the DAG
dag = DAG(
    dag_id='sample-etl-dag',
    default_args=default_args,
    description='Sample ETL DAG using Bash',
    scheduling_interval=timedelta(days=1),
)

#Here we are creating a variable named dag by instantiating the DAG class with the following parameters.

#sample-etl-dag is the ID of the DAG. This is what you see on the web console.

#We are passing the dictionary default_args, in which all the defaults are defined.

#description helps us in understanding what this DAG does.

#schedule_interval tells us how frequently this DAG runs. In this case every day. (days=1).

#A typical task definitions block looks like this:

# define the tasks

# define the first task named extract
extract = BashOperator(
    task_id='extract',
    bash_command='echo "extract"',
    dag=dag,
)

# define the second task named transform
transform = BashOperator(
    task_id='transform',
    bash_command='echo "transform"',
    dag=dag,
)

# define the third task named load
load = BashOperator(
    task_id='load',
    bash_command='echo "load"',
    dag=dag,
)

# task pipeline
extract >> transform >> load