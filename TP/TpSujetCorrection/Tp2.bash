######################################################################
#				Tp2 - Conteneur Web
######################################################################

## => Démarer un conteneur nommé "My_httpd" en tache de fond à partir de l'image httpd:latest (ne pas oublier le mapping des ports)
## => Se connecter au bash du conteneur
## => mise à jour de ce conteneur
## => Vérifier sur "http://localhost:8080/" que le message s'affiche bien
## => Changez le message retourné par le serveur web: /usr/local/apache2/htdocs/index.html
## => Vérifier sur "http://localhost:8080/" que le nouveau message s'affiche bien
## => Proceder à l'installation de git
## => Vérifier son installation avec la commande git --version

################## Correction ########################

## Rechercher l'image debian:latest
$ docker search httpd:latest

## téléchargement de l'image debian:latest
$ docker pull httpd:latest

## Instancier un conteneur à partir de l'image httpd:latest (avec bash pour connection directe)
$ docker run --name=httpd_c -d -p 8080:80 httpd:latest 

## Connection en root au conteneur
$ docker exec -it httpd_c bash

## Mise à jour du conteneur
$ apt-get update && apt-get upgrade -y

## Vérification dans le navigateur
http://localhost:8080/

## Modifier le contenu du fichier index.html (Solution 1)
$ echo "<h1>J'ai modifie le message</h1>" > /usr/local/apache2/htdocs/index.html 

## Modifier le contenu du fichier index.html (Solution 2 avec nano)
$ apt-get install nano -y

## edition du fichier html avec nano
$ nano /usr/local/apache2/htdocs/index.html

## Vérification dans le navigateur
http://localhost:8080/

## Afficher le contenu du fichier texte.txt
$ apt-get install -y git

## Vérification de l'installation de git
$ git --version

############################ Server node.js #####################################

## Création d'un conteneur Debian
$ docker run -it --name=container_web_server -p 8080:80 debian:latest bash

##Mettre à jour le serveur
$ apt-get update && apt-get upgrade -y

## Installation de node.js, NPM, nano
$ apt-get install nodejs -y && apt-get install -y npm && apt-get install nano -y

## Création du fichier index.js
$ nano index.js

## Recopier le script suivant
const express = require("express")
const http = require ("http")
const app = express()

app.get('/', (req,res)=> {
    res.end("Bonjour depuis mon serveur node.js...")
    http.request('http://'+process.env.ADRESS_APACHE4)
})

app.listen(80,()=> {
    console.log("app is running")
})

## node install express
$ npm install express

## Démarrage du serveur node.js
$ node index.js

