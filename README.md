# Big Data

*Authors: Alejandro Pérez Parra, Morad Ghaillane Ghailan, Pedro Rico Pinazo*

Se ha realizado la práctica sobre Docker-Compose, modificado la base de datos a Cassandra y desplegado en Google Cloud. El programa de predicción es enviado mediante spark-submit a un cluster de Spark formado por un master y un worker.

El entrenamiento de los modelos y la compilación del proyecto de scala se lleva a cabo en la propia generación de las imágenes Docker.

Repositorio GitHub:
https://github.com/ricopinazo/flight-delay-predictor.git

Enlace a video despliegue en Google Cloud:
https://upm365-my.sharepoint.com/:v:/g/personal/a_pparra_alumnos_upm_es/EZz9Dxm9RLBOvMNTR-7Zp5IBwV0GEmdtfGMDpIHmd0962A?e=thxn4U

## Instrucciones:

- Clonar el repositorio de github
```bash
git clone https://github.com/ricopinazo/flight-delay-predictor.git
cd flight-delay-predictor
```

- Ejecutar docker-compose up (asegurarse de tener instalado docker y docker-compose)
```bash
docker-compose up -d
```

- Acceder al navegador a calquiera de los dos enlaces
    - http://localhost:5000
    - http://localhost:5000/flights/delays/predict_kafka

## Ejecución en Google Cloud:

Inicializar una nueva instancia de Compute Engine, en Disco de arranque elegir como sistema operativo "Container Optimized OS".
Una vez arrancada la instancia ejecutar:

- Clonar el repositorio
```bash
git clone https://github.com/ricopinazo/flight-delay-predictor.git
cd flight-delay-predictor
```

- Descargarse y ejecutar la imagen Docker Compose
```bash
docker run docker/compose version
```

- Realizar el docker-compose a traves de la imagen de Docker Compose
```bash
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose up -d
```

- Acceder a la consola de Google, configurar el firewall para que acepte conexiones con el puerto 5000 y copiar la IP pública de ma VM. Introducir en el navegador:
    - http://publicGoogleIP:5000/


