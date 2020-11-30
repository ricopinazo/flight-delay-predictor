# Flight Delay Predictor

*Autores: Alejandro Pérez Parra, Morad Ghaillane Ghailan, Pedro Rico Pinazo*

El proyecto de este repositorio está basado en: https://github.com/ging/practica_big_data_2019

El despliegue del servicio se ha llevado a cabo mediante Docker-Compose sobre [Google Compute Engine](https://cloud.google.com/compute), empleando [Apache Cassandra](https://cassandra.apache.org/) para sustituir el papel de Mongo. El programa de predicción se envía mediante `spark-submit` a un cluster de Spark formado por un master y un worker.

El entrenamiento de los modelos y la compilación del proyecto de Scala se lleva a cabo en la propia generación de las imágenes Docker.

Enlaces:
- [Repositorio de GitHub](https://github.com/ricopinazo/flight-delay-predictor)
- [Vídeo del despliegue en Google Cloud](https://upm365-my.sharepoint.com/:v:/g/personal/a_pparra_alumnos_upm_es/EZz9Dxm9RLBOvMNTR-7Zp5IBwV0GEmdtfGMDpIHmd0962A?e=thxn4U)

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

- Acceder en el navegador a calquiera de los dos enlaces
    - http://localhost:5000/
    - http://localhost:5000/flights/delays/predict_kafka

## Ejecución en Google Cloud:

Inicializar una nueva instancia de Compute Engine eligiendo en Disco de arranque como sistema operativo ["Container Optimized OS"](https://cloud.google.com/container-optimized-os).
Una vez arrancada la instancia:

- Clonar el repositorio
```bash
git clone https://github.com/ricopinazo/flight-delay-predictor.git
cd flight-delay-predictor
```

- Descargarse y ejecutar la imagen Docker Compose
```bash
docker run docker/compose version
```

- Ejecutar `docker-compose` a través de la imagen de Docker Compose
```bash
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose up -d
```

- Acceder a la consola de Google, configurar el firewall para que acepte conexiones con el puerto 5000 y copiar la IP pública de la VM. Introducir en el navegador:
    - http://publicGoogleIP:5000/


