import json
import uuid
import sys
import urllib.request
from cassandra.cluster import Cluster

cluster = Cluster()
session = cluster.connect()

session.execute(
    """
    CREATE KEYSPACE agile_data_science
    WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};
    """
)

session.execute(
    """
    CREATE TABLE agile_data_science.origin_dest_distances
    ( "Id" UUID PRIMARY KEY, "Origin" text, "Dest" text, "Distance" float );
    """
)

session.execute(
    """
    CREATE TABLE agile_data_science.flight_delay_classification_response
    ( "UUID" UUID PRIMARY KEY, "Prediction" text );
    """
)

url = "http://s3.amazonaws.com/agile_data_science/origin_dest_distances.jsonl"
lines = urllib.request.urlopen(url).read().decode("utf-8").splitlines()
for line in lines:
    row = json.loads(line)
    session.execute(
        """
        INSERT INTO agile_data_science.origin_dest_distances ("Id", "Origin", "Dest", "Distance")
        VALUES (%s, %s, %s, %s)
        """,
        (uuid.uuid1(), row["Origin"], row["Dest"], row["Distance"])
    )