FROM python:3.8.6
WORKDIR /usr/src/app
ENV PROJECT_HOME=/usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY web/ ./web/
COPY import_distances.py ./
COPY start.sh ./
EXPOSE 5000
ENTRYPOINT [ "bash" ]
CMD [ "./start.sh" ]
