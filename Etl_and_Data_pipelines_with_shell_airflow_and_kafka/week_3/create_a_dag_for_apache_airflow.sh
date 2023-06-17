cp create_a_dag_for_apache_airflow_2.py $AIRFLOW_HOME/dags

airflow dags list

airflow dags list | grep "my_first_dag"

airflow tasks list my_first_dag