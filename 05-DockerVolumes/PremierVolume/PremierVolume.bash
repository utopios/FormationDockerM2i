## Création d'un volume
$ docker volume create volume-test

## Lister les volumes 
$ docker volume ls

## Inspecter un volume
$ docker volume inspect volume-test

## Retourne un objet JSON
[
    {
        "CreatedAt": "2021-06-08T14:07:36Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/volume-test/_data",
        "Name": "volume-test",
        "Options": {},
        "Scope": "local"
    }
]

## Supprimer un volume
$ docker volume rm volume-test

## Création d'un volume
$ docker volume create volume-test

## Build de l'image
$ docker build -t vtest .

## Création d'un conteneur avec le montage du volume crée precedemment
$ docker run -it --name vtest_c -v volume-test:/data vtest

## Inspecter un volume
$ docker volume inspect volume-test

## Retourne un objet JSON
[
    {
        "CreatedAt": "2021-06-08T12:38:41Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/data-test/_data",
        "Name": "data-test",
        "Options": null,
        "Scope": "local"
    }
]

## Ajout d'un fichier à notre conteneur
$ echo "Ceci est mon fichier test" > test.txt

## Affichage du nouveau fichier test.txt
$ cat test.txt

## Suppression de notre conteneur
$ docker rm -f my_lamp_c

## Création d'un nouveau conteneur reprennant le volume crée precedemment
$ docker run -it --name vtest_c -v volume-test:/data vtest


