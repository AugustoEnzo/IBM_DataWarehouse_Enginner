 cp my_first_dag.py $AIRFLOW_HOME/dags

cp my_first_dag.sh $AIRFLOW_HOME/dags
cd airflow/dags
chmod 777 my_first_dag.sh

airflow dags list

airflow dags list|grep "my-first-dag"

airflow tasks list my-first-dag