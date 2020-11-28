#!/bin/bash

if [[ -z "${SPARK_MASTER_URL}" ]]; then
  SPARK_MASTER_URL="local[*]"
fi

spark-submit \
  --class "es.upm.dit.ging.predictor.MakePrediction" \
  --packages org.mongodb.spark:mongo-spark-connector_2.11:2.3.2,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  /flight_prediction_2.11-0.1.jar \
  "${SPARK_MASTER_URL}"