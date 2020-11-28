FROM bitnami/spark:2.4.4
USER root
COPY ./start.sh /
COPY ./flight_prediction_2.11-0.1.jar /
COPY ./models/ /models
ENTRYPOINT [ "bash" ]
CMD [ "/start.sh" ]