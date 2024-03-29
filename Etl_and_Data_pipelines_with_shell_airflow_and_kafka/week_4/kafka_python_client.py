# Install kafka-python
# pip install kafka-python

# Create KafkaAdminClient
admin_client = KafkaAdminClient(bootstrap_servers="localhost:9092", client_id="test")

# Create new topics
topic_list = []

new_topic = NewTopic(name="bankbranch", num_partitions=2, replication_factor=1)

topic_list.append(new_topic)

admin_client.create_topics(new_topics=topic_list)

# Describe a topic
configs = admin_client.describe_configs(
    config_resources=[ConfigResource(ConfigResourceType.TOPIC, "bankbranch")]
    )

# KafkaProducer
producer = KafkaProducer(value_serializer=lambda v:json.dumps(v).encode('utf-8'))

producer.send("bankbranch", {'atmid':1, 'transid': 100})

producer.send("bankbranch", {'atmid':2, 'transid':101})

# KafkaConsumer
consumer = KafkaConsumer("bankbranch")

for msg in consumer:
    print(msg.value.decode("utf-8"))
