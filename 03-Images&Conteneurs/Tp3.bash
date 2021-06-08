######################################################################
#     Tp3 - Création d'une image depuis un conteneur existant
######################################################################

## => Démarer le conteneur container_web_server crée dans le TP2
## => Créer un image depuis ce conteneur nomée "my_node_server_image"
## => Supprimer container_web_server
## => Créer un nouveau conteneur depuis l'image "my_node_server_image"
## => Demarrer le fichier index.js
## => Vérifier sur "http://localhost:8080/" que le serveur fonctionne

####################### Correction ########################

## Vérifier si le conteneur est actif
$ docker ps

## Si il n'est pas présent
$ docker ps -actif

## Le démarrer le cas échéant
$ docker start container_web_server

## Vérification dans le navigateur
http://localhost:8080/

## Construction de l'image depuis le conteneur
$ docker build -t my_node_server_image

## Verifier que l'image est bien dans le repos local
$ docker images

## Stopper le conteneur container_web_server
$ docker stop container_web_server

## Supprimer le conteneur container_web_server
$ docker rm container_web_server

## créer une instance de notre image my_node_server_image
$ docker run -it my_node_container -p 8080:80 my_node_server_image bash

## Lancement de notre fichier index.js
$ node index.js

## Vérification dans le navigateur
http://localhost:8080/