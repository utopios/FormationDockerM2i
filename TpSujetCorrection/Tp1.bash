######################################################################
#				Tp1 - Premier conteneur Debian
######################################################################

## => Démarer un conteneur à partir d'une image debian:latest
## => Se connecter au bash du conteneur
## => mise à jour de ce conteneur
## => Installer l'editeur nano (vim)
## => Ecrire un fichier texte contenant du texte nommé texte.txt
## => Afficher le contenu du fichier texte.txt

################## Correction ########################

## Rechercher l'image debian:latest
$ docker search debian:latest

## téléchargement de l'image debian:latest
$ docker pull debian:latest

## Instancier un conteneur à partir de l'image debian:latest (avec bash pour connection directe)
$ docker run -it --name=container_debian dedian:latest bash

## Mise à jour du conteneur
$ apt-get update && apt-get upgrade -y

## Installation de nano
$ apt-get install nano -y

## Ecrire un fichier texte contenant du texte nommé texte.txt
$ nano texte.txt   ## Ajouter le texte puis ctrl + x pour sauvegarder et quitter 

## Afficher le contenu du fichier texte.txt
$ cat texte.txt

