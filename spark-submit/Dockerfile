FROM bitnami/spark:2.4.4 as sbt
USER root
RUN mkdir /predictor
COPY ./predictor/ /predictor/
WORKDIR /predictor
RUN apt update
RUN apt install zip
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source //.sdkman/bin/sdkman-init.sh  &&  sdk install java 8.0.265-open  &&  sdk install sbt  &&  sbt package"

FROM fdp-spark-base
USER root
COPY --from=sbt /predictor/target/scala-2.11/flight_prediction_2.11-0.1.jar /
COPY ./start.sh /
ENTRYPOINT [ "bash" ]
CMD [ "/start.sh" ]