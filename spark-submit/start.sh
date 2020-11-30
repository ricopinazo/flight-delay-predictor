#!/bin/bash

if [[ -z "${SPARK_MASTER_URL}" ]]; then
  SPARK_MASTER_URL="local[*]"
fi

spark-submit \
  --class "es.upm.dit.ging.predictor.MakePrediction" \
  --packages com.datastax.spark:spark-cassandra-connector_2.11:2.4.2,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  --conf spark.cassandra.connection.host=cassandra \
  /flight_prediction_2.11-0.1.jar \
  "${SPARK_MASTER_URL}"