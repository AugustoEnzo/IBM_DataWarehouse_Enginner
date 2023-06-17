#Problem:
#Create a new topic named weather.
bin/kafka-topics.sh --create --topic wheater --bootstrap-server localhost:9092

#Problem:
#Post messages to the topic weather.
bin/kafka-console-producer.sh --topic wheater --bootstrap-server localhost:9092

#Message content
Toronto, 2023-06-17, -05ºC

#Problem:
#Read the messages from the topic weather.
bin/kafka-console-consumer.sh --topic wheater --from-beginning --bootstrap-server localhost:9092