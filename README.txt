Big Data 

Se ha realizado la práctica sobre Docker-Compose, modificado la base de datos a Cassandra y desplegado en Google Cloud. 
El programa entrena el modelo de 0, la primera vez que se ejecute el compose puede tardar varios minutos.

Repositorio GitHub:
https://github.com/ricopinazo/flight-delay-predictor.git

Enlace a video despliegue en Google Cloud: 
https://upm365-my.sharepoint.com/:v:/g/personal/a_pparra_alumnos_upm_es/EZz9Dxm9RLBOvMNTR-7Zp5IBwV0GEmdtfGMDpIHmd0962A?e=thxn4U

Instrucciones: 

- Clonar el repositorio de github

git clone https://github.com/ricopinazo/flight-delay-predictor.git
cd flight-delay-predictor

- Ejecutar docker-compose up (asegurarse de tener instalado docker y docker-compose)
docker-compose up

-Acceder al navegador 
 http://localhost:5000/flights/delays/predict_kafka

Ejecución en Google Cloud:

Inicializar una nueva instancia de Compute Engine, en Disco de arranque elegir como sistema operativo "Container Optimized OS". 
Una vez arrancada la instancia ejecutar:
 
-Clonar el repositorio
git clone https://github.com/ricopinazo/flight-delay-predictor.git
cd flight-delay-predictor

-Descargarse y ejecutar la imagen Docker Compose
docker run docker/compose version

-Realizar el docker-compose a traves de la imagen de Docker Compose
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose up

-Acceder a la consola de Google, configurar el firewall para que acepte conexiones con el puerto 5000 y copiar la IP pública de ma VM. Introducir en el navegador: 
 http://<GooglePublicaIP>:5000/flights/delays/predict_kafka


