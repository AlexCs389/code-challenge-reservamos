# Code challenge - Reservamos

Este repositorio tiene como objetivo presentar una prueba técnica de codificación para el proceso de entrevista de un 
puesto de desarrollador RoR en Reservamos.

## Descripción del Proyecto

Se ha desarrollado una API que consume la API de Reservamos para obtener información sobre lugares mediante su nombre. Además, se utiliza 
la API de OpenWeather para obtener pronósticos del clima para los próximos 7 días.

## Tecnologías Utilizadas

El proyecto se desarrolló utilizando las siguientes tecnologías:

- Ruby: 2.7.7
- Rails: 5.2.8.1
- SQLite

## Configuración del Proyecto

Para ejecutar este proyecto, es necesario crear el archivo `master.key` en el directorio `config`. El contenido de este archivo debe ser el siguiente:

```plaintext
c3bd5cc65db0f08c5453697d429ede89
```

## Instrucciones de Ejecución

Posteriormente, puedes ejecutar el proyecto. En este ejemplo, se utiliza RVM para gestionar las versiones de Ruby:

```
cd code-challenge-reservamos/
rvm use 2.7.7
rails s
```

## Abrir en el navegador

Puedes ver la documentación de la api en la siguiente ruta de tu navegador:

```
http://localhost:3000/api-docs/index.html
```
