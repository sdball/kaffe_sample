# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :kaffe,
  consumer: [
    endpoints: [kafka: 9092], # that's [hostname: kafka_port]
    topics: ["mytopic"], # the topic(s) that will be consumed
    consumer_group: "kaffe_sample", # the consumer group for tracking offsets in Kafka
    message_handler: KaffeSample, # the module from Step 1 that will process messages
    async_message_ack: false, # see "async message acknowledgement" below
    start_with_earliest_message: false # default false
  ]
