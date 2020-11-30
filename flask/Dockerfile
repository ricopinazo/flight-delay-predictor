FROM python:3.8.6
WORKDIR /usr/src/app
ENV PROJECT_HOME=/usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY web/ ./web/
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "./web/predict_flask.py" ]

