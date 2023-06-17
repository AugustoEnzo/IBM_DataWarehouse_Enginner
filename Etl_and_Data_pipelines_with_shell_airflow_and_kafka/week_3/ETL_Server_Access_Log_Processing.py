from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

defaults_args = {
    "owner": "Enzo Augusto",
    "start_date": days_ago(0),
    "email": ['ramesh@somemail.com'],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

dag = DAG(
    "my_first_dag",
    default_args=defaults_args,
    subscription='My first DAG',
    schedule_interval=timedelta(days=1)
)

get_log = BashOperator(
    task_id="get_log",
    bash_command="curl -o logs https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Apache%20Airflow/Build%20a%20DAG%20using%20Airflow/web-server-access-log.txt",
    dag=dag
)

extract_log = BashOperator(
    task_id="extract_log",
    bash_command="cut -d'#' -f1,4 web-server-access-log.txt > extracted-web-server-access-log.txt",
    dag=dag
)

transform_log = BashOperator(
    task_id="transform_log",
    bash_command="tr '#' ',' < extracted-web-server-access-log.txt > transformed-web-server-access-log.txt",
    dag=dag
)

load_log = BashOperator(
    task_id="load_log",
    bash_command="zip extracted-web-server-access-log.txt, transformed-web-server-access-log.txt",
    dag=dag
)

# task pipeline
get_log >> extract_log >> transform_log >> load_log