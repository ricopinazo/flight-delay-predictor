until python3 /init_db.py
do
    echo "python3: Cassandra is unavailable - retry later"
    sleep 2
done &

exec /docker-entrypoint.sh "$@"