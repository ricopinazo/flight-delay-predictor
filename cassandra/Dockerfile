FROM cassandra:3.11.9
RUN apt-get update
RUN apt-get install python3 python3-pip -y
RUN pip3 install cassandra-driver==3.24.0
COPY ./entrypoint-wrap.sh /
COPY ./import_distances.py /
ENTRYPOINT ["/entrypoint-wrap.sh"]
