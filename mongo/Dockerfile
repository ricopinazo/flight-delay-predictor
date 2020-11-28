FROM mongo:4.4.1
COPY ./origin_dest_distances.jsonl /
COPY ./init.sh /docker-entrypoint-initdb.d/
CMD ["docker-entrypoint.sh", "mongod"]