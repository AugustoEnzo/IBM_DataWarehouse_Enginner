wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz

tar -xzf kafka_2.12-2.8.0.tgz

cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties

cd kafka_2.12-2.8.0
bin/kafka-server-start.sh config/server.properties

# Data to stream
# {"atmid": 1, "transid": 100}

cd kafka_2.12-2.8.0

bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic bankbranch  --partitions 2

bin/kafka-topics.sh --bootstrap-server localhost:9092 --list

bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic bankbranch

bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic bankbranch 

# Data to stream
# {"atmid": 1, "transid": 100}

# {"atmid": 1, "transid": 101}

# {"atmid": 2, "transid": 200}

# {"atmid": 1, "transid": 102}

# {"atmid": 2, "transid": 201}

cd kafka_2.12-2.8.0

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --from-beginning

bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic bankbranch --property parse.key=true --property key.separator=:

# Data to stream
# 1:{"atmid": 1, "transid": 102}

# 1:{"atmid": 1, "transid": 103}

# 2:{"atmid": 2, "transid": 202}

# 2:{"atmid": 2, "transid": 203}

# 1:{"atmid": 1, "transid": 104}

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --from-beginning --property print.key=true --property key.separator=:

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --group atm-app

bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group atm-app

# Data to stream
# 1:{"atmid": 1, "transid": 105}

# 2:{"atmid": 2, "transid": 204}

bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group atm-app

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --group atm-app

bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092  --topic bankbranch --group atm-app --reset-offsets --to-earliest --execute

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --group atm-app

bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092  --topic bankbranch --group atm-app --reset-offsets --shift-by -2 --execute

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bankbranch --group atm-app

