FROM bitnami/spark:2.4.4 as models
USER root
WORKDIR /
RUN mkdir /data
RUN mkdir /models
COPY ./requirements.txt /
COPY ./train_spark_mllib_model.py /
RUN curl -Lko /data/simple_flight_delay_features.jsonl.bz2 http://s3.amazonaws.com/agile_data_science/simple_flight_delay_features.jsonl.bz2
RUN pip install -r /requirements.txt
RUN python /train_spark_mllib_model.py ""

FROM bitnami/spark:2.4.4
USER root
RUN mkdir /models
COPY --from=models /models/ /models/