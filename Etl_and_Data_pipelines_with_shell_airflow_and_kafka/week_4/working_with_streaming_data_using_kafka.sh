wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz

tar -xzf kafka_2.12-2.8.0.tgz

cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties

cd kafka_2.12-2.8.0
bin/kafka-server-start.sh config/server.properties

cd kafka_2.12-2.8.0
bin/kafka-topics.sh --create --topic news --bootstrap-server localhost:9092

bin/kafka-console-producer.sh --topic news --bootstrap-server localhost:9092

# Message example content
Good morning
Good day
Enjoy the Kafka lab

cd kafka_2.12-2.8.0
bin/kafka-console-consumer.sh --topic news --from-beginning --bootstrap-server localhost:9092

rm kafka_2.12-2.8.0.tgz

